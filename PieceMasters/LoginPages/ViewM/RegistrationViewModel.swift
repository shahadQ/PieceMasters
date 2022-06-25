//
//  RegistrationViewModel.swift
//  PieceMasters
//
//  Created by hanan on 26/11/1443 AH.
//


import Foundation
import Firebase
import FirebaseStorage
import SwiftUI
import FirebaseFirestore

final class  RegistrationViewModel : ObservableObject{
    
    @Published var firstName : String = ""
    @Published var lastName : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var isLoading : Bool = false
    var authViewModel = AuthViewModel.shared
    let users = "Users"
    
    
    func isValidProfile()->Bool{
        guard !self.firstName.isEmpty
                ,!self.lastName.isEmpty
                ,!self.email.isEmpty
                ,!self.password.isEmpty

        else {return false}

        return true
    }
    
    
    func createUser(){
        guard isValidProfile() else {
            print("Invalid Profile")
            return
        }


        self.showLoadingView()
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let _ = error {
                print("Create Profile Failure")
                self.hideLoadingView()
                return
            }
           
            else{
                print("Successfully created user \( result?.user.uid ?? "")")
                var userData : [String:String] = [
                    User.id:result!.user.uid,
                    User.firstName:self.firstName,
                    User.lastName:self.lastName,
                    User.email:self.email
                ]
                
                self.storeUserInformation(userData: userData)
                self.authViewModel.isAouthenticatting = true
            }

        }
        
    }


    func storeUserInformation(userData:[String:String]){

        guard let uid = Auth.auth().currentUser?.uid else { return  }

        Firestore.firestore().collection(users).document(uid).setData(userData) { error in
            print("HH")
            if let error = error {
                print(error)
                return
            }
            
            print("did store data")
            AuthViewModel.shared.fetchUser()
            AuthViewModel.shared.isAouthenticatting = false
            self.hideLoadingView()
        }
    }
    
 
    
    private func showLoadingView(){isLoading = true}
    private func hideLoadingView(){isLoading = false}
      
}

