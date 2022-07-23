//
//  CartModel.swift
//  PieceMasters
//
//  Created by Shahad on 28/11/1443 AH.
//

import Foundation

struct cart: Identifiable {
    var id = UUID().uuidString
   //let user : User
    let products : product
    var Quantity : Int
    //var TotalPrice: Double
    
    var Cardboard : String
    var size : String
    var url : String
    
    var locations : String
    var createdAt : Date
    var orderStatus : Int
    var orderType : Int
   
    
    
}
