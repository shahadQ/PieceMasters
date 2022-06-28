//
//  Splash.swift
//  PieceMasters
//
//  Created by EMAN MOHAMMED on 28/06/2022.
//

import SwiftUI

struct Splash: View {
    @State var isActive : Bool = false
    var  BACGR1: Color = Color(red: 0.85, green: 0.85, blue: 0.85)
    var body: some View {
        VStack{
            if self.isActive{
                tab_bar()
            }
            else{
                ZStack{
//                    Image("logoapp")
//                        .resizable()

                    Color.white
                    .ignoresSafeArea()
                    Image("logoapp")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .padding(.leading,-20)
                        
    
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.00){
                withAnimation{
                    self.isActive = true
                }
            }
        }
        
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}

