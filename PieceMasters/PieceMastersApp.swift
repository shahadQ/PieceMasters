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
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
