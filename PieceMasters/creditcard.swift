//
//  creditcard.swift
//  new new
//
//  Created by wafa ali on 21/11/1443 AH.
//

import SwiftUI

struct creditcard: View {
    @State private var CreditNumber: String = ""
    @State private var CreditName: String = ""
    @State private var Expiredate: String = ""
    @State private var CVVCode: String = ""
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
       Text("Credit card number")
       .fontWeight(.bold)

       HStack(alignment: .top, spacing:10){
                        
       
      TextField("XXXX", text: $CreditNumber)
                .frame(width: 45, height: 17)
                .padding()
                  .overlay(
                      RoundedRectangle(cornerRadius: 10)
                          .stroke(.gray, lineWidth: 1))
            
            TextField("XXXX", text: $CreditNumber)
                      .frame(width: 45, height: 17)
                      .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1))
            TextField("XXXX", text: $CreditNumber)
                      .frame(width: 45, height: 17)
                      .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1))
            TextField("XXXX", text: $CreditNumber)
                      .frame(width: 45, height: 17)
                      .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1))
        }

            }.padding(.trailing, 20)
                       
            VStack (alignment: .leading){
                Text("Cardholder Name")
      .fontWeight(.bold)
            TextField("Joel Mcloving", text: $CreditNumber)
                      .frame(width: 310, height: 17)
                      .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
            
            }
            .padding(.trailing, 20)
            .padding(.top, 10)
            
            VStack{
            HStack{
      Text("Expire date")
      .fontWeight(.bold)
      .padding(.leading)

                Spacer()
       Text("CVV Code")
       .fontWeight(.bold)
       .frame(width: 90)
          
            }
            HStack{
                TextField("XX", text: $CreditNumber)
                      .frame(width: 35, height: 17)
                      .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1))
                
                
            TextField("XX", text: $CreditNumber)
                .frame(width: 35, height: 17)
                .padding()
                  .overlay(
                      RoundedRectangle(cornerRadius: 10)
                          .stroke(.gray, lineWidth: 1))
                
                Spacer().frame(width: 120, height: 60)
                TextField("XXXX", text: $CreditNumber)
                          .frame(width: 45, height: 17)
                          .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1))
                         
            }
            }.padding(.trailing, 20)
                .padding(.top, 10)
            
            button_for_other_payment()
                .padding()
        
            }
        }
    }


struct creditcard_Previews: PreviewProvider {
    static var previews: some View {
        creditcard()
    }
}
