//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Melissa  Garrett on 5/21/19.
//  Copyright © 2019 MelissaGarrett. All rights reserved.
//

import UIKit

// To allow any VC to get a ChecklistItem from this VC (if they implement this protocol)
protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    weak var delegate: ItemDetailViewControllerDelegate?
    
    // Properties to receive data from ChecklistVC
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem?

    @IBOutlet var addBarButton: UIBarButtonItem! // Renamed to Done
    @IBOutlet var cancelBarButton: UIBarButtonItem!
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    // After editing or adding, one of the protocol methods is called
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit, let text = textField.text { // edit an item
            item.text = text
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else { // add a new item
            if let item = todoList?.newTodo() {
                if let textFieldText = textField.text {
                    item.text = textFieldText
                }
                item.checked = false
                delegate?.itemDetailViewController(self, didFinishAdding: item)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // We are in Edit mode (received an item from ChecklistVC)
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        
        navigationItem.largeTitleDisplayMode = .never
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
