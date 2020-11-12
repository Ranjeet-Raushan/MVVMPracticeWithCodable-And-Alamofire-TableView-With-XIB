//  UserCell.swift
//  MVVMPractice
//  Created by Ranjeet Raushan on 10/09/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit
class UserCell: UITableViewCell {
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    var modelUserForCell: UserModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func userConfiguration(){
        if let id = modelUserForCell?.id {
            lblId.text =  "\(id)"
        }
        else {
            self.lblId.text  = "No Id"
        }
        
        lblTitle.text = modelUserForCell?.title
        let status = modelUserForCell?.getStatusAndColor()
        lblStatus.text = status?.0
        backgroundColor = status?.1
    }
}

