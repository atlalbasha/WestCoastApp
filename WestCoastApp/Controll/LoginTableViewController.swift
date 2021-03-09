//
//  LoginTableViewController.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-01.
//

import UIKit
import CoreData

class LoginTableViewController: UITableViewController, UITextFieldDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    var newUser = [User]()
    var currentUser : User?
    var userBrain = UserBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
        if section == 1{
            return 2
        }else{
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
            fieldCell.textField.textAlignment = .center
            fieldCell.selectionStyle = .none
            fieldCell.textField.returnKeyType = .done
            
            if indexPath.row == 0 {
                fieldCell.textField.delegate = self
                fieldCell.textField.placeholder = "Type your Email.."
                fieldCell.textField.keyboardType = .emailAddress
                fieldCell.textField.tag = indexPath.row
            
                
            }else if indexPath.row == 1 {
                
                fieldCell.textField.delegate = self
                fieldCell.textField.placeholder = "Type password.."
                fieldCell.textField.isSecureTextEntry = true
                fieldCell.textField.tag = indexPath.row
                
            }
           
           
            return fieldCell
       
            
        }else {
            cell.textLabel?.text = "Login"
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
            
            loadUser(userName: userBrain.userName, userPassword: userBrain.userPassword)
            if (currentUser != nil) {
                performSegue(withIdentifier: "ProfileSegue", sender: self)
            }else{
                alert()
            }
           
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
        
        if textField.text != "" {
            if textField.tag == 0 {
                userBrain.userName = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
            }else {
                userBrain.userPassword = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
            }
            
        }else{
           // do if textfield is empty
            
        }
        
    }
    
    
    func loadUser(userName: String, userPassword: String){
        let request: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "user_Name == %@ && user_Password == %@", userName, userPassword)
        
        request.predicate = predicate
        
        do{
            newUser = try context.fetch(request)
            for user in newUser {
                currentUser = user
                
            }
        }catch{
            print("Error")
        }
        
    }
    
    
    func alert() {
        
        
        let alert = UIAlertController(title: "Warning", message: "User name, or Password don't Match", preferredStyle: .alert)
                
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
        present(alert, animated: true, completion: nil)
        
    }
}
