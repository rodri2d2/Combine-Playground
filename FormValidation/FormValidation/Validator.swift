//
//  Validator.swift
//  FormValidation
//
//  Created by Rodrigo  Candido on 24/1/24.
//

import Foundation

protocol Validator {
    associatedtype ValidationType
    func validate(_ value: ValidationType) -> Bool
}

class EmailValidator: Validator {
    
    typealias ValidationType = String
    
    let domainExtensions = [
        "com",
        "net",
        "org",
        "edu",
        "gov",
        "es",
        "co",
        "info",
        "uk",
        "jp",
        "fr",
        "br"
    ]
    
    func validate(_ value: ValidationType) -> Bool {
        
        if value.isEmpty { return true }
        
        // [A-Z0-9a-z._%+-] Allows upper and lower case letters, numbers, full stops (.), underscores (_), percentages (%), plus (+) and hyphens (-).
        // {3,}: Indicates that there must be at least 3 characters of the above character
        // @ This is the at symbol which is a standard component of all e-mail addresses.
        // [A-Za-z0-9.-]{3,} Defines the part of the email that comes after the @ and before the last full stop (.).
        // \\. A literal full stop. In regex, a single dot (.) is a special character that matches almost any character, so a double backslash is used to indicate a literal dot.
        // [A-Za-z]{2,} Define the final part of the email after the last full stop.
        let regex = "[A-Z0-9a-z._%+-]{3,}@[A-Za-z0-9.-]{3,}\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        let isValid = emailTest.evaluate(with: value)
        
        if isValid {
            let components = value.split(separator: ".")
            if let lastComponent = components.last {
                return domainExtensions.contains(String(lastComponent))
            }
        }
        
        return false
    }
}

class PasswordValidator: Validator {
    
    typealias ValidationType = String
    
    func validate(_ value: String) -> Bool {
        
        if value.isEmpty { return true }
        
        // ^ It means where the characters array starts
        // (?=.*[a-z]) It is a "positive look for" that checks for the presence of at least one lower case letter [a-z]
        // (?=.*[A-Z]) Same "positive look for" but for at leat one upper case [a-z]
        // (?=.*\\d): Same "positive look for" but fot at least on number dígito (\\d). The double backslash is necessary because in many programming languages, including Swift, the backslash is an escape character.
        // (?=.*[!\"@&]) Same "positive look for" but for any character inside square brackets
        // [A-Za-z\\d!\"@&]{8,} Defines the allowed characters set for the password.
        // $ It means where the characters array finishes
        let basicRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!\"@&])[A-Za-z\\d!\"@&]{8,}$"
        let basicTest = NSPredicate(format: "SELF MATCHES %@", basicRegex)
        let isBasicValid = basicTest.evaluate(with: value)
        return isBasicValid
    }

}
