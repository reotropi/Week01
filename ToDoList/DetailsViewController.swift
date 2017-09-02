//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by Aida Fitryani on 9/2/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var temp = 0
    
    @IBOutlet weak var tanggalDetails: UILabel!
    
    @IBOutlet weak var namaDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tanggalDetails.text = tableData[temp].date
        namaDetails.text = tableData[temp].name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
