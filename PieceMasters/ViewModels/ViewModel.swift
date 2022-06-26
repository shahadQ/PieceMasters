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
                                           title: d["name"] as? String ?? "",
                                           Description: d["Description"] as? String ?? "",
                                           size: d["size"] as? Array<String> ?? [],
                                           Cardboard: d["Cardboard"] as? Array<String> ?? [],
                                        is_Customizable: d["is_Customizable"] as? Array<String> ?? [],
                                           image: d["image"] as? String ?? "",
                                           amount: d["amount"] as? String ?? "",
                                         
                                           price: d["price"] as? String ?? "",
                                           offer: d["offer"] as? Int ?? 0,
                                           isSelected: d["isSelected"] as? Bool ?? false
                                        )
                         
                    
                        }
                        
                    }
                   
                    
                }
            }
            else{
                
            }
        }
        
    }
    
}
