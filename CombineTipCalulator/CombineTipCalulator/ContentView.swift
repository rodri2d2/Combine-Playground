//
//  ContentView.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import SwiftUI

/**
 
 This is the inspiration to create the view
 
 https://www.behance.net/gallery/80727389/Daily-UI-Challenge-Day-004?tracking_source=search_projects|tip+calculator&l=34
 */

struct ContentView: View {
    
    @StateObject var viewModel = TipCalculatorViewModel()
    @State private var currentTip: TipPercentage = .ten
    
    var body: some View {
        
        ZStack {
            Color.gray
                .opacity(0.1)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                perPersonView
                    .padding(.vertical)
                
                totalView
                    .padding(.bottom)
                
                TipPercentageSelectorView(selectedTipPercentage: $viewModel.tipPercentage)
                
                
                EnterBillAmountView(billAmount: $viewModel.billAmount)
                    .padding()
                
                SplitView(numberOfPeople: $viewModel.numberOfPeople)
                    .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    
    
    
    private var perPersonView: some View {
        BillView(
            title: "Per person".uppercased(),
            total: viewModel.totalPerPerson,
            subTotal: viewModel.totalPerPersonWithoutTip,
            totalTip: viewModel.tipPerPerson
        )
        .padding(.horizontal)
    }
    
    
    private var totalView: some View {
        BillView(
            title: nil,
            total: viewModel.totalBillAmount,
            subTotal: viewModel.billAmount,
            totalTip: viewModel.totalTip
        )
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
