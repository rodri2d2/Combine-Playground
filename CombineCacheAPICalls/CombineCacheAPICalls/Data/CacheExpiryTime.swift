//
//  CacheExpiryTime.swift
//  CombineCacheAPICalls
//
//  Created by Rodrigo  Candido on 12/2/24.
//

import Foundation

enum CacheIterval {
    case minutes(Int)
    case hours(Int)

    var timeInterval: TimeInterval {
         switch self {
         case .minutes(let value):
             return TimeInterval(value * 60)
         case .hours(let value):
             return TimeInterval(value * 3600)
         }
     }
 }

enum CacheExpiryTime {
    case minute1
    case minute3
    case minute5
    case minute10
    case minute15
    case minute30
    case minute45
    case minute50
    case minute60
    case custom(value: CacheIterval)
    case notExpire

    var timeInterval: TimeInterval {
        switch self {
        case .minute1: return 60
        case .minute3: return 180
        case .minute5: return 300
        case .minute10: return 600
        case .minute15: return 900
        case .minute30: return 1800
        case .minute45: return 2700
        case .minute50: return 3000
        case .minute60: return 3600
        case .custom(let value): return value.timeInterval
        case .notExpire: return Double.greatestFiniteMagnitude
        }
    }
}
