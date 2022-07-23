
//
//PieceMasters
//
//  Created by hanan on 26/11/1443 AH.
//
import Foundation
import Firebase
import FirebaseFirestore

final class AuthViewModel:ObservableObject{
    @Published var isAouthenticatting = false
    @Published var user : User?
    @Published var isLoading : Bool = false
    @Published var islogIn : Bool = false
    let users = "Users"
    static let shared = AuthViewModel()
    @Published   var showingAlert: Bool = false
    @Published   var alertTitle: String = ""

    init(){
        checkIfUserLoggedIn()
    }
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid  else {return}
        Firestore.firestore().collection(users).document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else{
                print("No data")
                return
            }
            self.user = User(dictionary: data)
        }
    }
    
    
    func logInUser(email:String, password: String){
        self.showLoadingView()
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                self.showAlert("\(error.localizedDescription)")
                print("not logged in ")
                self.hideLoadingView()
            }
            else{
                self.hideLoadingView()
                self.fetchUser()
                self.isAouthenticatting.toggle()
                print("logged in ")
                print("isAouthenticating\(self.isAouthenticatting)")
                
            }
        }
    }
    
    
    func handleSignout (){
        try? Auth.auth().signOut()
        self.isAouthenticatting.toggle()
        self.user=nil
        self.showAlert("Sucessfuly sign out ")
    }
    func checkIfUserLoggedIn() {
        
        if Auth.auth().currentUser?.uid != nil {
            
            self.isAouthenticatting = true
        }
    }

    func showAlert(_ title: String){
        alertTitle = title
        showingAlert = true
    }

    
    private func showLoadingView(){isLoading = true}
    private func hideLoadingView(){isLoading = false}
    private func showLogInPage(){islogIn = true}
}

