//
//  Courses+CoreDataProperties.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-07.
//
//

import Foundation
import CoreData


extension Courses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Courses> {
        return NSFetchRequest<Courses>(entityName: "Courses")
    }

    @NSManaged public var course_Description: String?
    @NSManaged public var course_Name: String?
    @NSManaged public var course_Start_End: String?
    @NSManaged public var class_List: User?
    @NSManaged public var course_List: User?
    @NSManaged public var wish_List: User?

}

extension Courses : Identifiable {

}
