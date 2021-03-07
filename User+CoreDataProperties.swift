//
//  User+CoreDataProperties.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-07.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var user_Email: String?
    @NSManaged public var user_Mobile: String?
    @NSManaged public var user_Name: String?
    @NSManaged public var user_Password: String?
    @NSManaged public var user_Class_List: NSSet?
    @NSManaged public var user_Course_List: NSSet?
    @NSManaged public var user_Wish_List: NSSet?

}

// MARK: Generated accessors for user_Class_List
extension User {

    @objc(addUser_Class_ListObject:)
    @NSManaged public func addToUser_Class_List(_ value: Courses)

    @objc(removeUser_Class_ListObject:)
    @NSManaged public func removeFromUser_Class_List(_ value: Courses)

    @objc(addUser_Class_List:)
    @NSManaged public func addToUser_Class_List(_ values: NSSet)

    @objc(removeUser_Class_List:)
    @NSManaged public func removeFromUser_Class_List(_ values: NSSet)

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

// MARK: Generated accessors for user_Wish_List
extension User {

    @objc(addUser_Wish_ListObject:)
    @NSManaged public func addToUser_Wish_List(_ value: Courses)

    @objc(removeUser_Wish_ListObject:)
    @NSManaged public func removeFromUser_Wish_List(_ value: Courses)

    @objc(addUser_Wish_List:)
    @NSManaged public func addToUser_Wish_List(_ values: NSSet)

    @objc(removeUser_Wish_List:)
    @NSManaged public func removeFromUser_Wish_List(_ values: NSSet)

}

extension User : Identifiable {

}
