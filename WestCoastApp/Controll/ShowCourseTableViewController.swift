//
//  ShowCourseTableViewController.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-02.
//

import UIKit
import CoreData

class ShowCourseTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var currentUser : User? {
        didSet{
            print(currentUser)
        }
        
    }
    
    
    var selectedCourse = CoursesModel() {
        didSet{
            //            print(selectedCourse.courseName)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        if indexPath.section == 0 {
            cell.textLabel?.text = selectedCourse.courseName
            cell.textLabel?.textAlignment = .left
            cell.imageView?.image = UIImage(systemName: "books.vertical.fill")
            cell.selectionStyle = .none
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
            cell.textLabel?.numberOfLines = 0
        }else if indexPath.section == 1{
            cell.textLabel?.text = selectedCourse.courseDescribe ?? "No Course Added"
            cell.textLabel?.textAlignment = .left
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
            cell.textLabel?.numberOfLines = 0
            cell.selectionStyle = .none
            
        }else if indexPath.section == 2 {
            cell.textLabel?.text = "Apply Online Course"
            cell.imageView?.image = UIImage(systemName: "tv")
            //            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
            
        }else if indexPath.section == 3 {
            cell.textLabel?.text = "Apply School Course"
            cell.imageView?.image = UIImage(systemName: "graduationcap")
            //            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
            
        }else if indexPath.section == 4 {
            cell.textLabel?.text = "Wish Course"
            cell.imageView?.image = UIImage(systemName: "heart")
            //            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
            
        }else {
            cell.textLabel?.text = "Cancel"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2 {
            saveNewCourse()
            saveToCoreDate()
            dismiss(animated: true, completion: nil)
            
        }else if indexPath.section == 3 {
            saveNewClassCourse()
            saveToCoreDate()
            dismiss(animated: true, completion: nil)
            
        }else if indexPath.section == 4 {
            saveNewWishCourse()
            saveToCoreDate()
            dismiss(animated: true, completion: nil)
            
        }else if indexPath.section == 5 {
            
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    
    
    func saveNewCourse() {
        
        let newCourse = Courses(context: context)
        newCourse.course_Name = selectedCourse.courseName
        newCourse.course_Description = selectedCourse.courseDescribe
        //        newCourse.course_List = currentUser
        currentUser?.addToUser_Course_List(newCourse)
      
    }
    func saveNewClassCourse() {
        
        let newCourse = Courses(context: context)
        newCourse.course_Name = selectedCourse.courseName
        newCourse.course_Description = selectedCourse.courseDescribe
        //        newCourse.course_List = currentUser
        currentUser?.addToUser_Class_List(newCourse)
      
    }
    func saveNewWishCourse() {
        
        let newCourse = Courses(context: context)
        newCourse.course_Name = selectedCourse.courseName
        newCourse.course_Description = selectedCourse.courseDescribe
        //        newCourse.course_List = currentUser
        currentUser?.addToUser_Wish_List(newCourse)
      
    }
    
    
    func saveToCoreDate()  {
        
        do {
            try context.save()
        }catch{
            print("error with save new course \(error)")
        }
        
    }
    
}
