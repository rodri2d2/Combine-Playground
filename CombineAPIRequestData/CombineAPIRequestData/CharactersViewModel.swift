//
//  CharactersViewModel.swift
//  CombineAPIRequestData
//
//  Created by Rodrigo  Candido on 23/1/24.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    
    @Published var characters = [Character]()
    @Published var isLoadingPage = false
    private var currentPage = 1
    private var totalPages = 1
    var cancellables = Set<AnyCancellable>()
    
    func fetchCharacters() {
        guard !isLoadingPage && currentPage <= totalPages else { return }
        isLoadingPage = true
        
        guard
            let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(currentPage)")
        else { return }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Characters.self, decoder: JSONDecoder())
            .map { decodedData -> [Character] in
                self.totalPages = decodedData.info.pages
                self.currentPage += 1
                return decodedData.characters
            }
            .sink { completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] newCharacters in
                self?.characters.append(contentsOf: newCharacters)
                self?.isLoadingPage = false
            }
            .store(in: &cancellables)
    }
}
