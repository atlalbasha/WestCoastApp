//
//  SignUpTableViewController.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-01.
//

import UIKit
import CoreData

class SignUpTableViewController: UITableViewController, UITextFieldDelegate {
    
    var myUser = [User?]()
    var myCourse = [Courses?]()
    var currentUser : User?
    var userBrain = UserBrain()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        tableView.register(TextFieldTableViewCell.nib(), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1 {
            return 4
        }else {
            return 1
        }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        if indexPath.section == 0 {
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: cell.frame.width - 10, height: cell.frame.height - 10))
            let image = UIImage(named: "userPic")
            imageView.image = image
            cell.backgroundView = imageView
            cell.selectionStyle = .none
            
            
        } else if indexPath.section == 1 {
            
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            
            if indexPath.row == 0{
                // set custom cell as delegate
                fieldCell.textField.delegate = self
                fieldCell.textField.placeholder = "user name.."
                fieldCell.textField.textAlignment = .center
                fieldCell.selectionStyle = .none
                fieldCell.textField.keyboardType = .namePhonePad
                fieldCell.textField.returnKeyType = .done
                fieldCell.textField.tag = indexPath.row
                
                
            }else if indexPath.row == 1{
                
                // set custom cell as delegate
                fieldCell.textField.delegate = self
                fieldCell.textField.placeholder = "user@email.com"
                fieldCell.textField.textAlignment = .center
                fieldCell.selectionStyle = .none
                fieldCell.textField.keyboardType = .emailAddress
                fieldCell.textField.returnKeyType = .done
                fieldCell.textField.tag = indexPath.row
                
            }else if indexPath.row == 2{
                
                // set custom cell as delegate
                fieldCell.textField.delegate = self
                fieldCell.textField.placeholder = "mobile number.."
                fieldCell.textField.textAlignment = .center
                fieldCell.selectionStyle = .none
                fieldCell.textField.keyboardType = .numbersAndPunctuation
                fieldCell.textField.returnKeyType = .done
                fieldCell.textField.tag = indexPath.row
                
            }else if indexPath.row == 3{
                
                fieldCell.textField.delegate = self
                fieldCell.textField.placeholder = "Password..."
                fieldCell.textField.textAlignment = .center
                fieldCell.selectionStyle = .none
//                fieldCell.textField.isSecureTextEntry = true
                
                fieldCell.textField.returnKeyType = .done
                fieldCell.textField.tag = indexPath.row
            }
            
            return fieldCell
        }else {
            cell.textLabel?.text = "Sign Up"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.textColor = UIColor(named: "WestTextColor")
            cell.backgroundColor = UIColor(named: "WestBackGroundColor")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 260
        }else {
            return UITableView.automaticDimension
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2 {
            
            if checkFieldEmpty() {
                newUserSave()
                saveToCoreData()
            }

            performSegue(withIdentifier: "ProfileSegue", sender: self)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileSegue"{
            
           
            
           
            
            let VC = segue.destination as! ProfileTableViewController
            VC.currentUser = currentUser
            
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if textField.text != ""{
            
            if textField.tag == 0 {
                userBrain.userName = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            }else if textField.tag == 1 {
                userBrain.userEmail = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            }else if textField.tag == 2 {
                userBrain.userMobile = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            }else if textField.tag == 3 {
                userBrain.userPassword = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            
       }else {
            
            if textField.tag == 0 {
               
                textField.attributedPlaceholder = NSAttributedString(string: "Type Your Name...", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "passColor") ?? .orange])
            }else if textField.tag == 1 {
                textField.attributedPlaceholder = NSAttributedString(string: "Type Your Email...", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "passColor") ?? .orange])
            }else if textField.tag == 2 {
                textField.attributedPlaceholder = NSAttributedString(string: "Type Your Mobile...", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "passColor") ?? .orange])
            }else if textField.tag == 3 {
                textField.attributedPlaceholder = NSAttributedString(string: "Type Your Password...", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "passColor") ?? .orange])
            }
            
        }
        
       
        
        textField.resignFirstResponder()
    }
    
    
    func newUserSave()   {
        
        let newUser = User(context: context)
//        let newCourse = Courses(context: context)
//        let result = NSSet()
        
        newUser.user_Name = userBrain.userName
        newUser.user_Email = userBrain.userEmail
        newUser.user_Mobile = userBrain.userMobile
        newUser.user_Password = userBrain.userPassword
//        newUser.user_Course_List = result
        
//        newCourse.course_Name = "html"
//        newCourse.course_Description = "des Html"
//
//        newCourse.course_List = newUser
        currentUser = newUser
       
        myUser.append(newUser)
    }
    
   func checkFieldEmpty () -> Bool {
        if userBrain.userName != "" && userBrain.userEmail != "" && userBrain.userMobile != "" && userBrain.userPassword != "" {
            return true
        }else{
            return false
        }
    }
    
    func saveToCoreData() {
        do {
            try context.save()
        }catch{
            print("error with save new user \(error)")
        }
    }
    
    
    
}

