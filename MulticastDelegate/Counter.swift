//
//  Counter.swift
//  MulticastDelegate
//
//  Created by Yury Buslovsky on 03.07.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Delegate

protocol CounterDelegate: class {
    func counterDidUpdate(_ counter: Counter, to newValue: Int)
}

// MARK: - Declaration

final class Counter {
    
    // MARK: Singleton
    
    static let shared: Counter = .init()
    private init() {}
    
    // MARK: Multicast delegate
    
    @Multicast var delegate: CounterDelegate
    
    // MARK: Properties
    
    private(set) var count: Int = 0 {
        didSet {
            $delegate.invoke { $0.counterDidUpdate(self, to: count) }
        }
    }
    
}

// MARK: - Public API

extension Counter {

    func increment() {
        count += 1
    }
    
}
