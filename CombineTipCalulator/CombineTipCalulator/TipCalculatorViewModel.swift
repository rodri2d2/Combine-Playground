//
//  TipCalculatorViewModel.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 27/1/24.
//

import SwiftUI

class TipCalculatorViewModel: ObservableObject {
    @Published var billAmount: Double = 0
    @Published var numberOfPeople: Int = 1
    @Published var tipPercentage: TipPercentage = .ten

    var totalTip: Double {
        billAmount * tipPercentage.value
    }

    var totalBillAmount: Double {
        billAmount + totalTip
    }

    var totalPerPerson: Double {
        totalBillAmount / Double(numberOfPeople)
    }

    var totalPerPersonWithoutTip: Double {
        billAmount / Double(numberOfPeople)
    }

    var tipPerPerson: Double {
        totalTip / Double(numberOfPeople)
    }
}
