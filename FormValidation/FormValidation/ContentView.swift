//
//  ContentView.swift
//  FormValidation
//
//  Created by Rodrigo  Candido on 24/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = FormViewModel()
    
    var body: some View {
        
        Form {
            TextField("Email", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.none)
            if !viewModel.isEmailValid {
                Text("Email not valid")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            SecureField("Password", text: $viewModel.password)
            if !viewModel.isPasswordValid {
                Text("Password not valid")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Button("Commit") {
                
            }
            .disabled(viewModel.shouldBeDisabled)
        }
    }
}

#Preview {
    ContentView()
}
