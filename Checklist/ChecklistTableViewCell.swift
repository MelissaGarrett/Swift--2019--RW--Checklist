//
//  ChecklistTableViewCell.swift
//  Checklist
//
//  Created by Melissa  Garrett on 7/10/19.
//  Copyright © 2019 MelissaGarrett. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet var checkmarkLabel: UILabel!
    @IBOutlet var todoTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
