//
//  AccountEventTableViewCellVM.swift
//  AccountingApp
//
//  Created by Defalt Lee on 2022/4/20.
//

import Foundation

class AccountEventTableViewCellVM {
    
    var delegate: AccountEventTableViewCellDelegate!
    
    var event: AccountModel! {
        didSet {
            breakDownData(with: event)
        }
    }
    
    var date: String = ""
    var category: String = ""
    var description: String = ""
    var value: String = ""
    var isIncome: Bool!
    
    private func breakDownData(with event: AccountModel) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        date = dateFormatter.string(from: event.date)
        
        category = event.category
        
        description = event.description
        
        value = String(event.value)
        
        isIncome = (event.type == .income)
    }
    
}

protocol AccountEventTableViewCellDelegate {
    
    func cellDidClick(event: AccountModel)
    
}
