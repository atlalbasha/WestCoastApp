//
//  Courses+CoreDataProperties.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-03-02.
//
//

import Foundation
import CoreData


extension Courses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Courses> {
        return NSFetchRequest<Courses>(entityName: "Courses")
    }

    @NSManaged public var course_Name: String?
    @NSManaged public var course_Description: String?
    @NSManaged public var course_List: User?

}

extension Courses : Identifiable {

}
