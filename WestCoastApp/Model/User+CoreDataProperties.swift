//
//  User+CoreDataProperties.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-02.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var user_Name: String?
    @NSManaged public var user_Email: String?
    @NSManaged public var user_Mobile: String?
    @NSManaged public var user_Password: String?
    @NSManaged public var user_Course_List: NSSet?

}

// MARK: Generated accessors for user_Course_List
extension User {

    @objc(addUser_Course_ListObject:)
    @NSManaged public func addToUser_Course_List(_ value: Courses)

    @objc(removeUser_Course_ListObject:)
    @NSManaged public func removeFromUser_Course_List(_ value: Courses)

    @objc(addUser_Course_List:)
    @NSManaged public func addToUser_Course_List(_ values: NSSet)

    @objc(removeUser_Course_List:)
    @NSManaged public func removeFromUser_Course_List(_ values: NSSet)

}

extension User : Identifiable {

}
