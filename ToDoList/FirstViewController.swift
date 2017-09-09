//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Aida Fitryani on 9/2/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tablenya: UITableView!

    var tableData = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        let secondViewController = tabBarController?.viewControllers?[1] as? SecondViewController
        secondViewController?.delegate = self
        
        tablenya.reloadData()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if tableData.count<1 {
        tablenya.isHidden = true
        }
        else {
        tablenya.isHidden = false
        tablenya.reloadData()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosen = tableData[indexPath.row] as DataModel
        performSegue(withIdentifier: "detailsSegue", sender: chosen)
    }
    
    func updateData (todoe: DataModel){
        tableData.append(todoe)
        tablenya.reloadData()
    }

}

extension FirstViewController: SecondViewControllerDelegate {
    func firstViewController(controller: SecondViewController, didUpdateTodoes todoes: DataModel) {
        print("kkkk")
        updateData(todoe: todoes)
    }
}




