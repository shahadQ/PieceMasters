//
//  PieceMastersApp.swift
//  PieceMasters
//
//  Created by Shahad on 02/11/1443 AH.
//

import SwiftUI
import Firebase
@main
struct PieceMastersApp: App {
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            Splash()
            
            
        }
         
//            WindowGroup {
//            signIN()
//                .environmentObject(registrationViewModel)
//            .environmentObject(AuthViewModel.shared)
//
//
//        }
        
    }
}
