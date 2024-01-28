//
//  TipButtonStyle.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import Foundation
import SwiftUI

struct TipButtonStyle: ButtonStyle {

    var isSelected: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .bold()
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(
                isSelected ? Color.pink : Color.white
                   
            )
            
            .foregroundColor(isSelected ? Color.white : Color.pink)
            .clipShape(Capsule())
            .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 1)
            
    }
}
