//
//  MulticastDelegate.swift
//  MulticastDelegate
//
//  Created by Yury Buslovsky on 03.07.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Foundation

// MARK: - Base

final class MulticastDelegate<T> {

    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()

}

// MARK: - Public API

extension MulticastDelegate {

    func add(_ delegate: T) {
        delegates.add(delegate as AnyObject)
    }

    func remove(_ delegateToRemove: T) {
        for delegate in delegates.allObjects.reversed() {
            if delegate === delegateToRemove as AnyObject {
                delegates.remove(delegate)
            }
        }
    }

    func invoke(_ invocation: (T) -> Void) {
        for delegate in delegates.allObjects.reversed() {
            invocation(delegate as! T)
        }
    }

}
