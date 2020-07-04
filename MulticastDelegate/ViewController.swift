//
//  ViewController.swift
//  MulticastDelegate
//
//  Created by Yury Buslovsky on 03.07.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBOutlet private weak var countLabel: UILabel!
    
    // MARK: Dependencies
    
    private let counter: Counter = .shared
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "\(counter.count)"
        counter.delegate = self
    }
    
}

// MARK: - Actions

extension ViewController {
    
    @IBAction private func addOneAction(_ sender: UIButton) {
        counter.increment()
    }

}

// MARK: - Counter Delegate

extension ViewController: CounterDelegate {
    
    func counterDidUpdate(_ counter: Counter, to newValue: Int) {
        countLabel.text = "\(newValue)"
    }
    
}
