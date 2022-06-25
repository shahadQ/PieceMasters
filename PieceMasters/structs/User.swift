//
//  User.swift
//  profile
//
//  Created by hanan on 15/11/1443 AH.
//

import Foundation

struct User {
    
        let id : String
        let firstName : String
        let lastName : String
        let email : String
        
        init(dictionary:[String:Any]){
            self.id = dictionary[User.id]  as! String
            self.firstName = dictionary[User.firstName]  as? String ?? "N/A"
            self.lastName = dictionary[User.lastName]  as? String ?? "N/A"
            self.email = dictionary[User.email]  as? String ?? "N/A"
        }
        func getUserData()->([String:String]){
            
            var data :[String:String] = [:]
            
            data[User.id] = self.id
            
            data[User.firstName]  = self.firstName
            
            data[User.lastName]  = self.lastName
            
            data[User.email]  = self.email
            
            return data
            
        }
        static let id              = "id"
        static let firstName       = "firstName"
        static let lastName        = "lastName"
        static let email           = "email"

    static let user = User(dictionary: [User.id:"123",
                                  User.firstName:"Sara",
                                  User.lastName:"Ameen",
                                        User.email:"Sara@twq.edu.sa"])
   
                                           }
