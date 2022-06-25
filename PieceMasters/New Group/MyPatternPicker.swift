
//
//  MyPatternPicker.swift
//  profile1
//
//  Created by EMAN MOHAMMED on 07/06/2022.
//

import SwiftUI
struct ImageModel3: Identifiable {
let id: Int
let imageName: String
   
}

struct MyPatternPicker: View {
    @Binding var selectedPicker: String

    let imageModel3: [ImageModel3] = [
     .init(id: 0, imageName: "coffee8"),
    .init(id: 1, imageName: "coffee1"),
    .init(id: 2, imageName: "coffee2"),
    .init(id: 3, imageName: "coffee3"),
    .init(id: 4, imageName: "coffee4"),
    .init(id: 5, imageName: "coffee5"),
    .init(id: 6, imageName: "coffee6"),
    .init(id: 7, imageName: "coffee11")

    ]

    
    var body: some View {
 
        ScrollView(.horizontal ,showsIndicators: false) {
            HStack {
                
                ForEach(imageModel3, id: \.id) { image in
                    Image(image.imageName)
                    .resizable()

                    .frame(width: 70, height: 70)
                    
                    .clipShape(Circle())
                  
              
                    .opacity(  (image.imageName) == selectedPicker ? 0.5 : 1.0)
                    .scaleEffect(  (image.imageName) == selectedPicker ? 1.1 : 1.0)
                    .onTapGesture {
                        selectedPicker = (image.imageName)
                        
                    }.padding(.top , 10)
                       

                }


                
            }

                
                
                
        }
 
}

}
struct MyPatternPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyPatternPicker(selectedPicker: .constant("coffee1"))
    }
}
