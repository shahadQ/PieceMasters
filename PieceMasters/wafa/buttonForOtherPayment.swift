//
//  buttonForOtherPayment.swift
//  PieceMasters
//
//  Created by wafa ali on 22/11/1443 AH.
//

import SwiftUI

struct buttonForOtherPayment: View {
    var body: some View {
        
        NavigationLink(destination: Confirmation()
                       
        ) {      Text("Complete order ")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
            //.padding(.horizontal, 100)
                .frame(width: 328 , height: 63 )
                .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
            
                .cornerRadius(10.0)
        }.padding(.top,-20)
        
        
//        Button(action: { }) {
//            Text("Complete order ")
//                .foregroundColor(Color.white)
//        }
//        .frame(width: 350, height: 65)
//        .background(Color(red: 0.225, green: 0.26, blue: 0.461))
//        .cornerRadius(10)
//
  }
}

struct buttonForOtherPayment_Previews: PreviewProvider {
    static var previews: some View {
        buttonForOtherPayment()
    }
}
