//
//  ViewController.swift
//  Taskequest
//
//  Created by Dharmi Patel on 26/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var peoples = [PeopleData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        downloadJson {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
   
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.lblcell1.text = peoples[indexPath.row].first_name
        cell.lblcell2.text = peoples[indexPath.row].last_name
       
      
        let link = "https://robohash.org/" + peoples[indexPath.row].avatar
        cell.imgcell?.downloaded(from: link)
   
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PeopledataViewController {
            destination.people = peoples[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    
    
    func downloadJson(completed: @escaping () ->()) {
 
    let url = URL(string: "https://linode25.eqserver.net/ios-practical.json")
    
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if err == nil {
                do {
                    self.peoples = try JSONDecoder().decode([PeopleData].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                
                catch {
                    print("Error")
                }
        }
        }.resume()
    
}
}


