//
//  CacheStore.swift
//  CombineCacheAPICalls
//
//  Created by Rodrigo  Candido on 12/2/24.
//

import Foundation

protocol CacheStoreProtocol {
    associatedtype Key: Hashable
    associatedtype Value
    
    func save(_ value: Value, forKey key: Key, withExpiry expiryTime: CacheExpiryTime)
    func retrieve(forKey key: Key) -> Value?
    func removeValue(forKey key: Key)
}

final class CacheStore<Key: Hashable, Value>: CacheStoreProtocol {
    
    private let wrapped = NSCache<CacheKey, CacheEntry>()
    private var expiration: CacheExpiryTime
    private let queue = DispatchQueue(label: "dev.rodri.CacheStore", attributes: .concurrent)

    init(defaultExpiryTime: CacheExpiryTime = .notExpire) {
        self.expiration = defaultExpiryTime
    }
    
    func save(_ value: Value, forKey key: Key, withExpiry expiryTime: CacheExpiryTime) {
        queue.async(flags: .barrier) {
            let entry = CacheEntry(value: value, expiryTime: expiryTime)
            self.wrapped.setObject(entry, forKey: CacheKey(key))
        }
    }

    func retrieve(forKey key: Key) -> Value? {
        queue.sync {
            guard let entry = self.wrapped.object(forKey: CacheKey(key)), 
                    !entry.hasExpired()
            else {
                self.removeValue(forKey: key)
                return nil
            }
            return entry.value
        }
    }

    func removeValue(forKey key: Key) {
        queue.async(flags: .barrier) {
            self.wrapped.removeObject(forKey: CacheKey(key))
        }
    }

    subscript(key: Key) -> Value? {
        get { retrieve(forKey: key) }
        set {
            if let value = newValue {
                save(value, forKey: key, withExpiry: expiration)
            } else {
                removeValue(forKey: key)
            }
        }
    }
}

// MARK: Key and Entry values
extension CacheStore {
    final class CacheKey: NSObject {
        let key: Key
        init(_ key: Key) { self.key = key }
        override var hash: Int { key.hashValue }
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? CacheKey else { return false }
            return value.key == key
        }
    }

    final class CacheEntry: NSObject {
        let value: Value
        let timestamp: Date
        let expiryTime: CacheExpiryTime
        init(value: Value, expiryTime: CacheExpiryTime) {
            self.value = value
            self.timestamp = Date()
            self.expiryTime = expiryTime
        }
        func hasExpired() -> Bool {
            return Date().timeIntervalSince(timestamp) > expiryTime.timeInterval
        }
    }
}
