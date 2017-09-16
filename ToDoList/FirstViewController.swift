//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Aida Fitryani on 9/2/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tablenya: UITableView!

    //var tableData = [DataModel]() -- W1 & 2
    // W3
    var tableData = List<DataModel>()
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        let secondViewController = tabBarController?.viewControllers?[1] as? SecondViewController
        secondViewController?.delegate = self
        
        
        loadDataRealm()
        
        
        tablenya.reloadData()
        
    }
    
    func loadDataRealm() {
        self.realm = try! Realm()
        let lists = realm.objects(DataModel.self)
        if self.tableData.realm == nil, lists.count > 0 {
            for list in lists {
                self.tableData.append(list)
            }
        }
    }
    

    func prepareTable() {
    
        if tableData.count<1 {
            tablenya.isHidden = true
        }
        else {
            tablenya.isHidden = false
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        prepareTable()
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
        
        let chosen = sender as! DataModel
        let next = segue.destination as! DetailsViewController
        next.tanggalKirim = chosen.date
        next.namaKirim = chosen.name
       
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            try! self.realm.write {
                let list = self.tableData[indexPath.row]
                self.realm.delete(list)
            }
            self.tableData.remove(at: indexPath.row)
            tableView.reloadData()
            self.prepareTable()
        }
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosen = tableData[indexPath.row] as DataModel
        performSegue(withIdentifier: "detailsSegue", sender: chosen)
    }
    
    func updateData (todoe: DataModel){
        //tableData.append(todoe)
        //tablenya.reloadData()
        
        let realm = try! Realm()
        try! realm.write {
            tableData.insert(todoe, at: tableData.count)
            realm.add(todoe)
        }
        tablenya.reloadData()
    }

}

extension FirstViewController: SecondViewControllerDelegate {
    func firstViewController(controller: SecondViewController, didUpdateTodoes todoes: DataModel) {
        print("kkkk")
        updateData(todoe: todoes)
    }
}




