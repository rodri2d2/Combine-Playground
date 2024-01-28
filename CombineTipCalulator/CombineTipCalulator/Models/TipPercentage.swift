//
//  TipPercentage.swift
//  CombineTipCalulator
//
//  Created by Rodrigo  Candido on 25/1/24.
//

import Foundation

enum TipPercentage: CaseIterable, Hashable, Equatable {
    case ten
    case twenty
    case thirty
    case custom(customValue: Double)
    
    static var allCases: [TipPercentage] {
        return [.ten, .twenty, .thirty, .custom(customValue: 0)]
    }

    var value: Double {
        switch self {
        case .ten:
            return 0.10
        case .twenty:
            return 0.15
        case .thirty:
            return 0.20
        case .custom(let customValue):
            return customValue
        }
    }
    
    static func ==(lhs: TipPercentage, rhs: TipPercentage) -> Bool {
          switch (lhs, rhs) {
          case (.ten, .ten), (.twenty, .twenty), (.thirty, .thirty):
              return true
          case (.custom(let a), .custom(let b)):
              return a == b
          default:
              return false
          }
      }
}

extension TipPercentage {
    var displayString: String {
        switch self {
        case .ten: return "10%"
        case .twenty: return "15%"
        case .thirty: return "20%"
        case .custom: return "Custom"
        }
    }
}
