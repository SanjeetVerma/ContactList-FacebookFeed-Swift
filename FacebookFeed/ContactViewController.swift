//
//  ContactViewController.swift
//  FacebookFeed
//
//  Created by sanjeet on 9/9/16.
//  Copyright © 2016 sanjeet. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{

    var animalsDictionary = [String : Any]()
    
    var animalSectionTitles = [String]()
    
    var animalIndexTitles = [String]()
    
    var filtered:[String] = []
    
    var searchActive : Bool = false
    
    @IBOutlet weak var NoDataFound: UILabel!
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         animalsDictionary  = ["A" : ["Apple","Anar", "Angular"],"B" : ["Bear","Black Swan", "Buffalo"],"C" : ["Camel", "Cockatoo"],"D" : ["Dog", "Donkey"],"E" : ["Emu"],"G" : ["Giraffe","Greater Rhea"],"H" : ["Hippopotamus","Horse"],"K" : ["Koala"],"L" : ["Lion","Llama"],"M" : ["Manatus","Meerkat"],"P" : ["Panda", "Peacock", "Pig", "Platypus", "Polar Bear"],"R" : ["Rhinoceros"],"S" : ["Seagull"],"T" : ["Tasmania Devil"],"W" : ["Whale", "Whale Shark", "Wombat"]]
        
        animalIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        animalSectionTitles = Array(animalsDictionary.keys)
        
        animalSectionTitles = animalSectionTitles.sort(){$0 < $1}
        
        myTableView.delegate = self
        
        myTableView.dataSource = self
        
        mySearchBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if searchActive {
            
            return 1
        }
        return animalSectionTitles.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if searchActive {
            
            return ""
        }
        return animalSectionTitles[section]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionTitle = animalSectionTitles[section] as NSString
        
        let sectionAnimals = animalsDictionary[sectionTitle as String] as! NSArray
        
        if searchActive {
            
           return self.filtered.count
        }
        return sectionAnimals.count
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        if searchActive {
            
            ""
        }
        return animalIndexTitles
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : CustomCell =  tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        
        if searchActive {
            
            let animal = filtered[indexPath.row]
            
            cell.UserImg.image = UIImage(named: "sanjeet")
            
            cell.UserName.text = animal
        }
        else {
            let sectionTitle = animalSectionTitles[indexPath.section] as NSString
            
            let sectionAnimals = animalsDictionary[sectionTitle as String] as! NSArray
            
            let animal = sectionAnimals[indexPath.row] as! String
            
            cell.UserImg.image = UIImage(named: "sanjeet")
            
            cell.UserName.text = animal
        }
        cell.selectionStyle = .None
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow;
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as! CustomCell
        
        print(currentCell.UserName.text!)
        
        self.performSegueWithIdentifier("FacebookSegue", sender: indexPath)
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
        searchActive = true
        
        searchBar.setShowsCancelButton(true, animated: true)
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        searchActive = false
        
        searchBar.text = ""
        
        searchBar .resignFirstResponder()
        
        searchBar.setShowsCancelButton(false, animated: true)
        
        myTableView.hidden = false;
        
        self.myTableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchActive = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered.removeAll()
        
        var searchtext = searchText
        
        searchtext = searchtext.lowercaseString;
        
        for item in animalSectionTitles
        {
            let sectionTitle = item as NSString
            
            let sectionAnimals = animalsDictionary[sectionTitle as String] as! NSArray
            
            for item1 in sectionAnimals
            {
                var done = item1 as! NSString
                
                done = done.lowercaseString
                
                if done.containsString(searchtext) {
                    
                    filtered.append(done as String)
                }
            }
        }
        myTableView.hidden = false;
        
        if searchtext.isEmpty {
            searchActive = false
        }
        else
        {
            searchActive = true
            
            if filtered.count == 0
            {
                myTableView.hidden = true;
            }
        }
        self.myTableView.reloadData()
    }
}
