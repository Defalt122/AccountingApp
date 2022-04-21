//
//  MainViewController.swift
//  AccountingApp
//
//  Created by Defalt Lee on 2022/4/19.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var accountEventsTableView: UITableView!
    @IBOutlet weak var recordBtnLabel: UILabel!
    @IBOutlet weak var recordBtn: UIButton!
    
    let viewModel = MainViewControllerVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testData()
        
        setDelegate()
        setView()
    }

    @IBAction func recordBtnClick(_ sender: UIButton) {
        let vc = AddEventViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    func setDelegate() {
        accountEventsTableView.delegate = self
        accountEventsTableView.dataSource = self
    }
    
    func setView() {
        accountEventsTableView.allowsSelection = false
        
        recordBtnLabel.backgroundColor = .systemBlue
        recordBtnLabel.textColor = .white
        recordBtnLabel.text = "Add Event"
        recordBtnLabel.clipsToBounds = true
        recordBtnLabel.layer.cornerRadius = recordBtnLabel.bounds.height / 3
        
        recordBtn.setTitle("", for: .normal)
    }
    
    func testData() {
        for _ in 0...20 {
            let event = AccountModel(date: Date(), type: .income, category: "work", description: "hi", value: 100)
            viewModel.incomeEvents.append(event)
        }
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalCount = viewModel.incomeEvents.count + viewModel.outgoingEvents.count
        return totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(String(describing: AccountEventTableViewCell.self), owner: self)?.first as! AccountEventTableViewCell
        
        let cellViewModel = AccountEventTableViewCellVM()
        cellViewModel.event = viewModel.incomeEvents.first
        cellViewModel.delegate = viewModel
        
        cell.setContent(cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
