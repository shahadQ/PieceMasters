//
//  ViewModel.swift
//  PieceMasters
//
//  Created by Shahad on 22/11/1443 AH.
//

import Foundation
import Firebase

class ViewModel: ObservableObject{
    
    @Published var list = [product]()
    
    func getData(){
        
        let db = Firestore.firestore()
        db.collection("Products").getDocuments { snapshot, error in
            
            
            
            if error == nil{
                
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            
                            return product(id: d.documentID,
                                           name: d["name"] as? String ?? "",
                                           Description: d["Description"] as? String ?? "",
                                           size: d["size"] as? String ?? "",
                                           Cardboard: d["Cardboard"] as? String ?? "",
                                           image: d["image"] as? String ?? "",
                                           Category: d["Category"] as? String ?? "",
                                           price: d["price"] as? Double ?? 0,
                                           is_Customizable: d["is_Customizable"] as? String ?? "")
                        }
                        
                    }
                   
                    
                }
            }
            else{
                
            }
        }
        
    }
    
}
