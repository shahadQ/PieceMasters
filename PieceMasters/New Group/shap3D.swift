//
//  shap3D.swift
//  profile1
//
//  Created by EMAN MOHAMMED on 11/06/2022.
//



import SwiftUI

struct shap3D: View {
    
    var body: some View {
                    Rectangle()
        
                        .fill(Color.white)
                        .frame(width: 397
                               , height: 800)
        
                        .cornerRadius1(20, corners: [.topLeft, .bottomRight])
                        .padding(.bottom,-580)
                 

                        .background(Color(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431))
        
        
                        .ignoresSafeArea(.all)
                        .shadow(radius: 0.1)
    }
}

extension View {
    func cornerRadius1(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner1(radius: radius, corners: corners) )
    }
}
struct RoundedCorner1: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}




struct shap3D_Previews: PreviewProvider {
    static var previews: some View {
        shap3D()
    }
}
