//
//  TipPercentageSelectorView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import SwiftUI

struct TipPercentageSelectorView: View {
    @Binding var selectedTipPercentage: TipPercentage

    var body: some View {
        HStack(spacing: 16) {
            ForEach(TipPercentage.allCases, id: \.self) { tip in
                Button {
                    self.selectedTipPercentage = tip
                } label: {
                    Text(tip.displayString)
                }
                .buttonStyle(TipButtonStyle(isSelected: self.selectedTipPercentage == tip))
            }
        }
    }
}


#Preview {
    TipPercentageSelectorView(selectedTipPercentage: .constant(.ten))
}
