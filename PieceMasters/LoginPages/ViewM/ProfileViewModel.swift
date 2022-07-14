//
//PieceMasters
//
//  Created by hanan on 26/11/1443 AH.

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

final class ProfileViewModel : ObservableObject{
    
    @Published var firstName : String = ""
    @Published var lastName : String = ""
   
    @Published var isLoading : Bool = false
    @Published  var user : User?
    
    var authViewModel = AuthViewModel.shared
    
    init(){fetchUser()}

    func fetchProfile (){
        AuthViewModel.shared.fetchUser()
        self.user = AuthViewModel.shared.user
        self.firstName = self.user?.firstName ?? ""
       self.lastName = self.user?.lastName ?? ""
//        fetchUser {
//            self.firstName = self.user?.firstName ?? ""
//            self.lastName = self.user?.lastName ?? ""
//
//        }
    }
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid  else {return}
        Firestore.firestore().collection("Users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else{
                print("No data")
                return
            }
            self.user = User(dictionary: data)
            self.firstName = self.user?.firstName ?? ""
            self.lastName = self.user?.lastName ?? ""
            
           // print("Hello \(self.user?.firstName)","❤️")
        }
    }

    
    
//    func updateProfile(){
//        // CHALLENGE
//    }
    
    func fetchUser(completion:@escaping(()->())){
        
      //  Firestore.firestore().collection("users").document(uid)
    }
    
    
    func isValidProfile()->Bool{
        guard !self.firstName.isEmpty,!self.lastName.isEmpty
        else {return false}
        return true
    }

    
    private func showLoadingView(){isLoading = true}
    private func hideLoadingView(){isLoading = false}
    
    

}


