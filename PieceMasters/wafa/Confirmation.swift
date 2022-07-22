//
//  Confirmation.swift
//  Test 2
//
//  Created by wafa ali on 12/11/1443 AH.
//

import SwiftUI

struct Confirmation: View {
   

        var body: some View {

//            return  NavigationView {
                
                VStack(alignment: .center){
           
                    HStack(spacing: -40) {
        
        VStack{
            Text("Shipping")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                .frame(width: 100)
         
            
            Circle()
            
            .fill(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4588235294117647))
            .frame(width:20 , height: 20 )
        }
        Rectangle()
             .fill(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4588235294117647))
             .frame(width:100 , height: 5 )
             .padding(.top, 35.0)
        
        VStack{
            Text("Payment")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
            .frame(width: 100)

        
       
            Circle()
            .fill(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4588235294117647))
            .frame(width:20 , height: 20 )
        }
            
            Rectangle()
             .fill(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4588235294117647))
            .frame(width:100 , height: 5 )
            .padding(.top, 35.0)
           
        VStack{
            Text("Confirmation")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                .frame(width: 110)
                .position(x: 50, y: 90)
        }
    VStack{
       
            Circle()
            .fill(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4588235294117647))
            .frame(width:20 , height: 20 )
            .position(x: -10, y: 125)
                            
            
        
    }
    }
    .position(x: 220, y: 40)
 
                
                    VStack{
                Image("Cnfirm")
                        .frame(width: 245.18, height: 196.57)
                        
                    
                    Text("Thank you")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.217, green: 0.252, blue: 0.449))
                       
                    
                    Text("Your Order will be delivered with invoice\n #9ds69hs. You can track the delivery \n in the order section.")
                        .fontWeight(.light)
                        .foregroundColor(Color(red: 0.217, green: 0.252, blue: 0.449))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 100)
                    }.position(x: 190, y: 0)
                        .padding(.top, 80)
                    HStack{
                     
//                        Button(action: { }) {
                        NavigationLink(destination: MainPackaging()){
                            Text("Continue shopping ")
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 340, height: 65)
                        .background(Color(red: 0.225, green: 0.26, blue: 0.461))
                        .cornerRadius(10)
                     
                  
                        }.position(x: 195, y: 85)
                    
                    
                }.padding(.top ,-60)
               // .navigationTitle("Checkout")
                
//    }

    }

struct Confirmation_Previews: PreviewProvider {
    static var previews: some View {
        Confirmation()
    }
}
}

