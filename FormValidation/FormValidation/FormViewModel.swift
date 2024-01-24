//
//  FormViewModel.swift
//  FormValidation
//
//  Created by Rodrigo  Candido on 24/1/24.
//

import Foundation
import Combine

class FormViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    @Published var shouldBeDisabled = true
    
    // Validators
    let emailValidator = EmailValidator()
    let passwordValidator = PasswordValidator()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        Publishers.CombineLatest($email, $password)
             .map { email, password in
                 let emailNotEmpty = !email.isEmpty
                 let passwordNotEmpty = !password.isEmpty

                 return !(
                    emailNotEmpty && passwordNotEmpty
                    && self.isEmailValid && self.isPasswordValid
                 )
             }
             .assign(to: &$shouldBeDisabled)
        
        $email
            .map { email in
                
                return self.emailValidator.validate(email)
            }
            .assign(to: \.isEmailValid , on: self)
            .store(in: &cancellables)
        
        $password
            .map { password in
                return self.passwordValidator.validate(password)
            }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
    }
}
