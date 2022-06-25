//
//  Product.swift
//  PieceMasters
//
//  Created by Shahad on 22/11/1443 AH.
//

import Foundation

//struct product : Identifiable{
    
 //   var id : String
    //var name: String
   // var Description: String
   // var size: [String]? = nil
  //  var Cardboard: [String]? = nil
 //   var image: String
    //var Category: String
   // var price: Double
 //   var is_Customizable: [String]? = nil
//}


struct product: Identifiable {
    var id : String
    var title: String
    var Description: String
    var size: [String]? = nil
    var Cardboard: [String]? = nil
    var is_Customizable: [String]? = nil
    var image: String
    var amount: String
    var cardColor: String
    var price: String
    var offer : Int?
    var isSelected: Bool
}
