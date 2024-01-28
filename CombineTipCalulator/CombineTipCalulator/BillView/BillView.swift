//
//  BillView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import SwiftUI

struct BillView: View {
    
    let title: String?
    let total: Double
    let subTotal: Double
    let totalTip: Double
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
               HeaderView(title: title ?? "")
                Spacer()
            }
            
            HStack {
                 BillTotalView(total: total)
                Divider()
                    .frame(height: 100)
                    .padding(.horizontal, 32)
                VStack(alignment: .leading) {
                    BillDetailView(title: "Subtotal".uppercased(), total: subTotal)
                        .padding(.bottom)
                    BillDetailView(title: "Tip".uppercased(), total: totalTip)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10).fill(Color.white)
                .shadow(color: .gray.opacity(0.5), radius: 8, x: 4, y: 8)
        )
       
    }
}

#Preview {
    BillView(title: "Per person", total: 1, subTotal: 2, totalTip: 3)
}
