
//
//  shap.swift
//  profile
//
//  Created by EMAN MOHAMMED on 02/06/2022.
//

import SwiftUI

struct backgroundRectangle: View {
    
    var body: some View {
                    Rectangle()
        
                        .fill(Color.white)
                        .frame(width: 390
                               , height: 800)
        
                        .cornerRadius(20, corners: [.topLeft, .bottomRight])
                        .padding(.top,300)
        

                        .background(Color(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431))
        
        
                        .ignoresSafeArea(.all)
                        .shadow(radius: 0.1)
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




struct shap_Previews: PreviewProvider {
    static var previews: some View {
        backgroundRectangle()
    }
}
