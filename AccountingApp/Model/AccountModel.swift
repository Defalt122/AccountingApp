//
//  AccountingEvent.swift
//  AccountingApp
//
//  Created by Defalt Lee on 2022/4/19.
//

import Foundation

struct AccountModel {
    
    enum AccountingEventType {
        case income
        case outgoing
    }
    
    var date: Date
    var type: AccountingEventType
    var category: String
    var description: String
    var value: Int
    
    static func updateAccountingData() {
        
    }
    
}
