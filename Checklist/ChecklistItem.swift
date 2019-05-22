//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Melissa  Garrett on 5/21/19.
//  Copyright © 2019 MelissaGarrett. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
