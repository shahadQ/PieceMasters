//
//  backgroundRectangle.swift
//  ProductDetails
//
//  Created by Shahad on 03/11/1443 AH.
//

import SwiftUI

struct backgroundRectangle: View {
    
        @State var topleft:CGFloat = 0
        var body: some View {
            
            Rectangle()
            
                .fill(Color.white)
                .frame(width: 390
                       , height: 700)
            
                .cornerRadius(40, corners: [.topLeft, .bottomRight])
                .padding(.top,300)

                .background(Color(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922))
            
                .ignoresSafeArea(.all)
            
        }
            
    }
    extension View {
        func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
            
            clipShape( RoundedCorner(radius: radius, corners: corners) )
        }
    }
    struct RoundedCorner: Shape {

        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

struct backgroundRectangle_Previews: PreviewProvider {
    static var previews: some View {
        backgroundRectangle()
    }
}
