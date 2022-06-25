
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
    let users = "Users"
    static let shared = AuthViewModel()

    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid  else {return}
        Firestore.firestore().collection(users).document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else{
                print("No data")
                return
            }
            self.user = User(dictionary: data)
            print("Hello \(self.user?.firstName)","❤️")
        }
    }
    
    
    func logInUser(email:String, password: String){
        self.showLoadingView()
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("wrong passward or mail ",error)
                self.hideLoadingView()
            }
            else{
                self.hideLoadingView()
                self.fetchUser()
                self.isAouthenticatting.toggle()
            }
        }
    }
    
    
    func handleSignout (){
        try? Auth.auth().signOut()
        self.isAouthenticatting.toggle()
        self.user=nil
    }

    
    private func showLoadingView(){isLoading = true}
    private func hideLoadingView(){isLoading = false}
}

