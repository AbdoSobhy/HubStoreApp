//
//  RepoTableViewCell.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/17/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
protocol RepoCellView : AnyObject {
    func display(name : String)
    func display(description : String)
    func display(date : String)
}
class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension RepoTableViewCell : RepoCellView {
    func display(name : String){
        nameLabel.text = name
    }
    func display(description : String){
        descriptionLabel.text = description
    }
    func display(date : String){
        dateLabel.text = date
    }
    
}
