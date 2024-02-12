//
//  CharacterDetailView.swift
//  CombineCacheAPICalls
//
//  Created by Rodrigo  Candido on 12/2/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 300)
                
                Text(character.name)
                    .font(.largeTitle)
                Text(character.species)
                    .font(.title2)
                // Añade aquí más detalles según sea necesario.
            }
        }
        .navigationTitle(character.name)
    }
}


//#Preview {
//    CharacterDetailView(character: .init(id: 1, name: "", status: "", species: "", type: "", gender: "", origin: "", location: .init(name: "", url: ""), image: "", episode: [], url: "", created: ""))
//}
