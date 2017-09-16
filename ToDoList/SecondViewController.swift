//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Aida Fitryani on 9/2/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var theTextField: UITextField!

    var delegate: SecondViewControllerDelegate?
    
    var dataTemp = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        /* W1 & 2
         let name = theTextField.text
        
        if name != nil {
            dataTemp = DataModel(date: getDate, name: name!)
            self.delegate?.firstViewController(controller: self, didUpdateTodoes: dataTemp)
           //tableData.append(dataTemp)
         }
         W3
         */
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyy - HH:mm"
        let result = formatter.string(from: date)
        let tempTodo = DataModel()
        tempTodo.name = (theTextField.text!)
        tempTodo.date = result
        
        self.delegate?.firstViewController(controller: self, didUpdateTodoes: tempTodo)
        
        theTextField.text = ""
        self.view.endEditing(true)
        tabBarController?.selectedIndex = 0
        
    }
    
}

protocol SecondViewControllerDelegate {
    func firstViewController( controller: SecondViewController, didUpdateTodoes todoes: DataModel)
}
