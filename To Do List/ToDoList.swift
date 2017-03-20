//
//  ToDoList.swift
//  ToDo2
//
//  Created by Westley Lashley on 3/2/17.
//  Copyright © 2017 Westley Lashley. All rights reserved.
//

import UIKit

class ToDoList {
    var items: [String]
    var nameOfLists: String
    
    init(nameOfList: String, items: [String]) {
        self.items = items
        self.nameOfLists = nameOfList
    }
}
