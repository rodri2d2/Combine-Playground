//
//  BillDetailView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import SwiftUI

struct BillDetailView: View {
    
    let title: String
    let total: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.gray)
            Text(total.currencyFormatted)
                .bold()
        }
    }
}

#Preview {
    BillDetailView(title: "SUBTOTAL", total: 42.48)
}
