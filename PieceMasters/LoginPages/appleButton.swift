//
//  appleButton.swift
//  profile
//
//  Created by hanan on 13/11/1443 AH.
//

import SwiftUI
import AuthenticationServices

struct appleButton: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lasttName") var lasttName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        if userId.isEmpty {
            
            SignInWithAppleButton(.continue) {request in
                
                request.requestedScopes = [.email,.fullName]
            } onCompletion: { result in
                switch result {
                case .success(let auth):
                    switch auth.credential{
                    case let credential as ASAuthorizationAppleIDCredential:
                        // User Id
                        let userId = credential.user
                        // User info
                        let email = credential.email
                        let firstName = credential.fullName?.givenName
                        let lastName = credential.fullName?.familyName
                        
                        self.email = email ?? ""
                        self.userId = userId
                        self.firstName = firstName ?? ""
                        self.lasttName = lasttName ?? ""
                        
                        
                    default:
                        break
    
                    }
                case .failure(_) :
                    print ("Error")
                }
            }
            .signInWithAppleButtonStyle(
                colorScheme == .dark ? .white : .black
            )
           
            .frame(width: 289 , height: 63 )
            //.padding()
            .cornerRadius(8)
            
      
        
        }
        else {
        // signed in
            Text ("welcome back")
        }
    }
    }


struct appleButton_Previews: PreviewProvider {
    static var previews: some View {
        appleButton()
    }
}
