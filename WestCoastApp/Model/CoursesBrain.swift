//
//  CoursesBrain.swift
//  WestCoastApp
//
//  Created by Atlal Basha on 2021-02-26.
//

import Foundation
import UIKit


struct CoursesBrain {
    
 
    
   let title = "Choose Course"
   let image = UIImage(systemName: "books.vertical.fill")
    
     let web = [
        CoursesModel(courseName: "HTML and CSS", courseDescribe: """
WestCoast Education is an education company located on the west coast just north of Gothenburg. We have been in the education industry for almost 40 years. Our business goal is and has been to provide technical training in the IT area. We have been very successful all these years. We specialize primarily in system development training in web and mobile solutions.
""", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Advanced CSS", courseDescribe: "course Describe", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "JavaScript for beginners", courseDescribe: "course Describe", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Advanced JavaScript and server programming", courseDescribe: "HTML AND CSS", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "JavaScript for the web", courseDescribe: "course Describe", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "ASP.NET Core MVC", courseDescribe: "course Describe", courseStartEnd: "2.V-22.V")
    ]
    
    let programming = [
        CoursesModel(courseName: "Introduction to Android programming", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Advanced Android programming", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "iOS development with Objective-C", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "iOS development with Swift", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Design and layout for mobile devices", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Web Api with .NET Core", courseDescribe: "des", courseStartEnd: "2.V-22.V")
                      
    ]
    
    let backend = [
        
        CoursesModel(courseName: "REST Api with node.js", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Backend programming", courseDescribe: "des", courseStartEnd: "2.V-22.V")
       
    ]
    let database = [
        CoursesModel(courseName: "Manage MS SQL Server", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Database design", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "Build systems with MongoDB", courseDescribe: "des", courseStartEnd: "2.V-22.V"),
        CoursesModel(courseName: "What is ORM? How to use such a tool", courseDescribe: "des", courseStartEnd: "2.V-22.V")
    ]
    
}

