//
//  Budget.swift
//  Wilsonj-budgetcuts2
//
//  Created by Jacob Wilson on 3/12/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import Foundation

class Budget {
    var name: String
    var limit: Double
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
}
