//
//  EnterBillAmountView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import SwiftUI

struct EnterBillAmountView: View {
    
    @Binding var billAmount: Double
    @FocusState private var isInputActive: Bool
    
    private var numberFormatter: NumberFormatter  {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(title: "Total Amount".uppercased())
            TextField("Enter bill amount", value: $billAmount, formatter: numberFormatter)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                .frame(height: 100)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(.black)
                .shadow(radius: 5)
                .font(.title)
        }
    }
}

#Preview {
    EnterBillAmountView(billAmount: .constant(2))
}
