//
//  DataModel.swift
//  ToDoList
//
//  Created by Aida Fitryani on 9/2/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import Foundation


/* W1 & 2
 class DataModel {
    private var _date: String?
    private var _name: String?
    
    init() { }
    
    init(date:String, name:String) {
        _date = date
        _name = name
    }
    
    var date: String {
        return _date!
    }
    
    var name: String {
        return _name!
    }
    
}*/


// W3
import RealmSwift

class DataModel: Object {
    dynamic var date = ""
    dynamic var name = ""

}
