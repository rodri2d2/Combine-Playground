//
//  SplitView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 27/1/24.
//

import SwiftUI

struct SplitView: View {
    @Binding var numberOfPeople: Int

      var body: some View {
          HStack {
              Text("SPLIT")
                  .font(.headline)
                  .foregroundColor(.pink)
              
              Spacer()
              
              Button(action: {
                  if numberOfPeople > 1 { numberOfPeople -= 1 }
              }) {
                  Image(systemName: "minus.circle.fill")
                      .foregroundColor(numberOfPeople >= 1 ? .pink : .gray)
              }
              
              Text("\(numberOfPeople)")
                  .font(.title)
              
              Button(action: {
                  numberOfPeople += 1
              }) {
                  Image(systemName: "plus.circle.fill")
                      .foregroundColor(.pink)
              }
          }
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .shadow(radius: 5)
      }
}

#Preview {
    SplitView(numberOfPeople: .constant(2))
}
