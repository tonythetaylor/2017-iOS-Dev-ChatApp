//
//  ViewController.swift
//  SlideThru Msg
//
//  Created by Anthony Taylor on 4/29/17.
//  Copyright © 2017 Taylor Theory Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let myarray = ["item1", "item2", "item3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) 
        cell.textLabel?.text = myarray[indexPath.item]
        return cell
    }
    
    

}

