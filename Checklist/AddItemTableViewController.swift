//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Melissa  Garrett on 5/21/19.
//  Copyright © 2019 MelissaGarrett. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var addBarButton: UIBarButtonItem!
    @IBOutlet var cancelBarButton: UIBarButtonItem!
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        textField.delegate = self
    }
    
    // To display keyboard when user taps the Add button
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }

    // So user can't select the row (can only type in the textField)
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // To dismiss keyboard when user taps the Done button in the pop-up
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
    
    // Gets called every time user types a character
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
              let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        
        return true
    }
    
}
