//
//  HeaderView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 26/1/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.caption)
            .bold()
            .foregroundColor(.pink)
            .padding(.bottom)
    }
}

#Preview {
    HeaderView(title: "Total Amount")
}
