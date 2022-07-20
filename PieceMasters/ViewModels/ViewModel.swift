//
//  ViewModel.swift
//  PieceMasters
//
//  Created by Shahad on 22/11/1443 AH.
//

import Foundation
import Firebase

class ViewModel: ObservableObject{
    
    static let shared  = ViewModel()
    @Published var list = [product]()
    @Published var filtered : [product] = []

     @Published var cartItems : [cart] = []
     @Published var ordered = false
    
    func getData(){
        
        let db = Firestore.firestore()
        db.collection("Products").getDocuments { snapshot, error in
            
            
            
            if error == nil{
                
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            
                            return product(id: d.documentID,
                                           title: d["title"] as? String ?? "",
                                           Description: d["Description"] as? String ?? "",
                                           size: d["size"] as? Array<String> ?? [],
                                           Cardboard: d["Cardboard"] as? Array<String> ?? [],
                                        is_Customizable: d["is_Customizable"] as? Array<String> ?? [],
                                           image: d["image"] as? String ?? "",
                                           amount: d["amount"] as? String ?? "",
                                         
                                           price: d["price"] as? NSNumber ?? 0,
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
    func totalcal(item: product, TextFieldQ: String)-> String{
    
        let total = ( Double(truncating: item.price) * (Double(TextFieldQ) ?? 0.0)) * ( 1 + 0.15 )
          
          let totalronded: String = String(format: "%.2f", total)
          
     return totalronded
 }
    
    
       
       

       //ADD TO CART
       func addToCart(item: cart){
           self.cartItems.append(item)
         //  self.filtered[getFilteredIndex(item: item, isCartIndex: false)].isSelected = !item.isSelected
//           if getIndex(item: item, isCartIndex: false) < self.list.count{
//           self.list[getIndex(item: item, isCartIndex: false)].isSelected = !item.isSelected
//           }
//           let filterIndex = self.filtered.firstIndex{ (item1) -> Bool in
//               return item.id == item1.id
//
//           } ?? 0
//
//           self.filtered[filterIndex].isSelected = !item.isSelected
//
//
//           if item.isSelected{
//
//               self.cartItems.remove(at: getIndex(item: item, isCartIndex: true))
//               return
//           }
//
//           self.cartItems.append(cart(products: item, Quantity: 1))
      }




       func getIndex(item: product,isCartIndex: Bool)->Int{

           let index = self.list.firstIndex{ (item1) -> Bool in
               return item.id == item1.id
           } ?? 0
           let CartIndex = self.cartItems.firstIndex{ (item1) -> Bool in
               return item.id == item1.products.id
           } ?? 0

           return isCartIndex ? CartIndex : index
       }

       
       
       
       //from coments
   //    func getFilteredIndex(item: product, isCartIndex: Bool)-> Int{
   //
   //    let filteredIndex = self.filtered.firstIndex{ (item1) -> Bool in
   //        return item.id == item1.id
   //    } ?? 0
   //
   //    let cartIndex = self.cartItems.firstIndex { (item1) -> Bool in
   //        return item.id == item1.id
   //    } ?? 0
   //
   //    return isCartIndex ? cartIndex : filteredIndex
   //}
   //
       

       
       func updateOrder(){
          
           let db = Firestore.firestore()
           guard let uid = Auth.auth().currentUser?.uid else {
               return
               
               
           }
           if ordered{
               ordered = false
               db.collection("Users").document(uid).delete{
                   
                   (err) in
                   if err != nil{
                       self.ordered = true
                   }
               }
           }
           
           var details : [[String: Any]] = [[:]]
           
           cartItems.forEach{ (cart) in
               details.append([
                   "item_name": cart.products.title,
                   "item_quantity": cart.Quantity,
                   "item_cost": cart.products.price
               ])
           }
           ordered = true
           db.collection("Users").document(uid).setData([
               "orderd_food": details,
               //"total_cost": calculateTotalPrice()
              // "location": GeoPoint(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
           
           ]){ (err) in
               
               if err != nil{
                   self.ordered = false
                   return
               }
               print("succses")
           }
       }
       

    
}
