//
//  CharactersViewModel.swift
//  CombineCacheAPICalls
//
//  Created by Rodrigo  Candido on 12/2/24.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters = [Character]()
    private var cache = CacheStore<String, Characters>(defaultExpiryTime: .custom(value: .minutes(4)))
    private var nextPageURL: String? = "https://rickandmortyapi.com/api/character/"
    var cancellables = Set<AnyCancellable>()

    func fetchCharacters() {
        guard 
            let urlString = nextPageURL,
                !urlString.isEmpty
        else { return }
        
        if let cachedData = cache[urlString] {
            self.characters.append(contentsOf: cachedData.characters)
            self.nextPageURL = cachedData.info.next
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map(\.data)
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] newCharacters in
                      self?.characters.append(contentsOf: newCharacters.characters)
                      self?.nextPageURL = newCharacters.info.next
                      self?.cache[urlString] = newCharacters
                  })
            .store(in: &cancellables)
    }
}
