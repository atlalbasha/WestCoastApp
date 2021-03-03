//
//  ProfileTableViewController.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-01.
//

import UIKit
import CoreData

class ProfileTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //    var courses = ["HTML", "Swift", "Android"]
    
    var courses = [Courses]()
    var newUser = [User]()
    
    
    var currentUser : User? {
        didSet{
            loadUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        courses = newUser[0].user_Course_List?.allObjects as! [Courses]
       
        loadUser()
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1 {
            return courses.count
        }else {
            return 1
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        if indexPath.section == 0 {
            cell.textLabel?.text = currentUser?.user_Name
            cell.textLabel?.textAlignment = .left
            cell.imageView?.image = UIImage(systemName: "person")
            cell.selectionStyle = .none
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        }else if indexPath.section == 1{
            cell.textLabel?.text = courses[indexPath.row].course_Name ?? "No Course Added"
            cell.textLabel?.textAlignment = .left
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
            
        }else if indexPath.section == 2 {
            cell.textLabel?.text = "Add New Course"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
        }else {
            cell.textLabel?.text = "Logout"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2{
            performSegue(withIdentifier: "CourseListSegue", sender: self)
        }else if indexPath.section == 3{
            performSegue(withIdentifier: "logoutSegue", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CourseListSegue"{
            let VC = segue.destination as! CourseListTableViewController
            VC.currentUser = currentUser
        
        }else if segue.identifier == "logoutSegue" {
            
            let VC = segue.destination as! WestCoastTableViewController
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Your Courses"
        }else{
            return nil
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        context.delete(courses[indexPath.row])
        courses.remove(at: indexPath.row )
        saveToCoreData()
        tableView.reloadData()
    }
    
    
    
    
    func loadUser(){
        let request: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "user_Name == %@ && user_Password == %@", currentUser!.user_Name!, currentUser!.user_Password!)
        
        request.predicate = predicate
        
        do{
            newUser = try context.fetch(request)
            
        }catch{
            print("Error")
        }
        tableView.reloadData()
    }
    
    
    func saveToCoreData() {
        do {
            try context.save()
        }catch{
            print("error with save new user \(error)")
        }
    }
    
    
    
}


