//
//  ContentView.swift
//  CombineAPIRequestData
//
//  Created by Rodrigo  Candido on 23/1/24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()

     var body: some View {
         NavigationView {
             List(viewModel.characters) { character in
                 CharacterRow(character: character)
                     .onAppear {
                         if character == viewModel.characters.last {
                             viewModel.fetchCharacters()
                         }
                     }
             }
             .navigationTitle("Characters")
         }
         .onAppear {
             viewModel.fetchCharacters()
         }
     }
}

struct CharacterRow: View {
    var character: Character
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(character.name).font(.headline)
                Text(character.species).font(.subheadline)
            }
        }
    }
}


#Preview {
    CharactersView()
}
