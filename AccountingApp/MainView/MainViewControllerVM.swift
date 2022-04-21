//
//  MainViewControllerVM.swift
//  AccountingApp
//
//  Created by Defalt Lee on 2022/4/19.
//

import Foundation

class MainViewControllerVM {
    
    var allEvents: [AccountModel] = [] {
        didSet {
            breakDownData(with: allEvents)
        }
    }
    
    var outgoingEvents: [AccountModel] = []
    var incomeEvents: [AccountModel] = []
    
    var addEvnetBtnDidClick: (()->Void)?
    
    private func breakDownData(with events: [AccountModel]) {
        events.forEach { event in
            if event.type == .income {
                incomeEvents.append(event)
            } else {
                outgoingEvents.append(event)
            }
        }
    }
    
}

extension MainViewControllerVM: AccountEventTableViewCellDelegate {
    
    func cellDidClick(event: AccountModel) {
        print(event.date)
    }
    
}
