//
//  CartViewModel.swift
//  PieceMasters
//
//  Created by Shahad on 28/11/1443 AH.
//

import Foundation
import Firebase


class CartViewModel: ObservableObject{

@Published var carts = [cart]()

//func getData(){
//    
//    let db = Firestore.firestore()
//    db.collection("cart").getDocuments { snapshot, error in
//
//
//
//        if error == nil{
//
//            if let snapshot = snapshot{
//                DispatchQueue.main.async {
//
//                    self.carts = snapshot.documents.map { d in
//
//                        return cart(id: d.documentID,
//                                    self.user = User
//                                    Quantity: d["Quantity"] as? Double ?? 0,
//                                    TotalPrice: d["TotalPrice"] as? Double ?? 0
//
//                                    )
//
//
//                    }
//
//                }
//
//
//            }
//        }
//        else{
//
//        }
//    }
//
//}

}
