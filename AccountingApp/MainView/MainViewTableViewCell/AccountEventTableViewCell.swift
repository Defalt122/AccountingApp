//
//  AccountEventTableViewCell.swift
//  AccountingApp
//
//  Created by Defalt Lee on 2022/4/20.
//

import UIKit

class AccountEventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cellBtn: UIButton!
    
    var viewModel: AccountEventTableViewCellVM!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dateLabel.text = ""
        categoryLabel.text = ""
        descriptionLabel.text = ""
        valueLabel.text = ""
        valueLabel.textColor = .black
        
        cellBtn.setTitle("", for: .normal)
    }
    
    @IBAction func cellBtnClick(_ sender: UIButton) {
        viewModel.delegate.cellDidClick(event: viewModel.event)
    }
    
    func setContent(_ viewModel: AccountEventTableViewCellVM) {
        self.viewModel = viewModel
        
        dateLabel.text = viewModel.date
        categoryLabel.text = viewModel.category
        descriptionLabel.text = viewModel.description
        valueLabel.text = viewModel.value
        valueLabel.textColor = viewModel.isIncome ? .red : .green
        
        cellBtn.setTitle("", for: .normal)
    }
    
}
