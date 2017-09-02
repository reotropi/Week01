//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Aida Fitryani on 9/2/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

    var tableData = [DataModel]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tablenya: UITableView!

    var chosen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablenya.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        tablenya.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tablenya.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        
        cell.dateLabel.text = tableData[indexPath.row].date
        
        cell.nameLabel.text = tableData[indexPath.row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let next = segue.destination as! DetailsViewController
        next.temp = chosen
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosen = indexPath.row
        performSegue(withIdentifier: "detailsSegue", sender: nil)
    }
    
}


