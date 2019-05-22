//
//  TodoList.swift
//  Checklist
//
//  Created by Melissa  Garrett on 5/21/19.
//  Copyright © 2019 MelissaGarrett. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
    
        row0Item.text = "Take a job"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patterns"
        
        todos = [row0Item, row1Item, row2Item, row3Item, row4Item]
    }
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = getRandomTodo()
        item.checked = true
        todos.append(item)
        
        return item
    }
    
    private func getRandomTodo() -> String {
        let randomTodos = [ "New todo item", "Generic todo", "Fill me out", "I need something to do", "Much todo about nothing" ]
        
        let randomIndex = Int.random(in: 0...randomTodos.count - 1)
        let randomTodo = randomTodos[randomIndex]
        
        return randomTodo
    }
}
