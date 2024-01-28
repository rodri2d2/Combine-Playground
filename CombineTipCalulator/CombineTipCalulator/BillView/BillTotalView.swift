//
//  BillTotalView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import SwiftUI

struct BillTotalView: View {
    
    let total: Double
    
    var body: some View {
        
        let totalParts = String(format: "%.2f", total).split(separator: ".")
        let wholeNumberPart = totalParts.first ?? "0"
        let fractionPart = totalParts.count > 1 ? totalParts[1] : "00"
        
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(wholeNumberPart)
                        .font(.largeTitle)
                        .bold()
                    Text("," + fractionPart)
                        .font(.headline)
                        .bold()
                }
     
                Text("€")
                    .font(.title3)
                    .bold()
                    .offset(x: -16, y: -4)
            }

            Text("Total".uppercased())
                .foregroundColor(.gray)
                .offset(x: -16)
        }
    }
}

#Preview {
    BillTotalView(total: 48.85)
}
