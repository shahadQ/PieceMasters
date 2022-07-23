//
//  CONTACTS.swift
//  Brandit
//
//  Created by hanan on 24/12/1443 AH.
//

import SwiftUI

struct CONTACTS: View {
    var body: some View {
        NavigationView{
        ZStack{
            backgroundRectangle()
            VStack {
                Label {
                    Text("Email us : branditksa@gmail.com ")
                        .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                } icon: {
                    Image(systemName: "envelope")
                    
                        .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                        .padding(.trailing)
                }
                .frame(width: 320, alignment: .bottomLeading)
                
                Label {
                    Text("Twitter : @ branditksa ")
                        .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                } icon: {
                    Image(systemName: "network")
                    
                        .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                        .padding(.trailing)
                }
                .frame(width: 320, alignment: .bottomLeading)
                .padding(.top,20)
                
                Label {
                    Text("Instagram : @ branditksa ")
                        .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                } icon: {
                    Image(systemName: "network")
                    
                        .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                        .padding(.trailing)
                }
                .frame(width: 320, alignment: .bottomLeading)
                .padding(.top,20)
            }
 
              
                
            }
        }
    }
    }


struct CONTACTS_Previews: PreviewProvider {
    static var previews: some View {
        CONTACTS()
    }
}
