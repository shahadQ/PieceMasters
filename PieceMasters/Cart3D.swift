//
//  Cart3D.swift
//  Brandit
//
//  Created by EMAN MOHAMMED on 28/06/2022.
//

import SwiftUI

struct Cart3D: View {

var body: some View {
    Rectangle()
        .fill(Color.white)
        .frame(width: 390
               , height: 1040)
    
        .cornerRadius(20, corners: [.topLeft, .bottomRight])
        .padding(.top,300)

        .background(Color(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431))
        .ignoresSafeArea(.all)
}
    
}
extension View {
func cornerRadius2(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape( RoundedCorner(radius: radius, corners: corners) )
}
}
struct Cart3D1: Shape {

var radius: CGFloat = .infinity
var corners: UIRectCorner = .allCorners

func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
}
}




//        Button(action: {
//
//        })
struct Cart3D_Previews: PreviewProvider {
static var previews: some View {
    backgroundRectangle()
}
}
