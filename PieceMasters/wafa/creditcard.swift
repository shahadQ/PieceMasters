//
//  creditcard.swift
//  new new
//
//  Created by wafa ali on 21/11/1443 AH.
//

import SwiftUI

struct creditcard: View {
    @State private var CreditNumber: String = ""
    @State private var CreditNumber2: String = ""
    @State private var CreditNumber3: String = ""
    @State private var CreditNumber4: String = ""
    @State private var CreditName2: String = ""
    @State private var Expiredate: String = ""
    @State private var Expiredate2: String = ""
    @State private var CVVCode2: String = ""
    var PrimaryColor : Color = (Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                Text("Credit card number")
                    .font(.system(size: 16))
                    .foregroundColor(PrimaryColor)
                HStack(alignment: .top, spacing:10){
                    
                    
                    TextField("XXXX", text: $CreditNumber)
                        .frame(width: 45, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.3))
                    
                    TextField("XXXX", text: $CreditNumber2)
                        .frame(width: 45, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.3))
                    TextField("XXXX", text: $CreditNumber3)
                        .frame(width: 45, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.3))
                    TextField("XXXX", text: $CreditNumber4)
                        .frame(width: 45, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.3))
                }
                
            }.padding(.trailing, 20)
            
            VStack (alignment: .leading){
                Text("Cardholder Name")
                    .font(.system(size: 16))
                    .foregroundColor(PrimaryColor)
                TextField("Joel Mcloving", text: $CreditName2)
                    .frame(width: 310, height: 17)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 0.3))
                
            }
            .padding(.trailing, 20)
            .padding(.top, 10)
            
            VStack{
                HStack{
                    Text("Expire date")
                        .font(.system(size: 16))
                        .foregroundColor(PrimaryColor)
                        .padding(.leading)
                    
                    Spacer()
                    Text("CVV Code")
                        .font(.system(size: 16))
                        .foregroundColor(PrimaryColor)
                        .frame(width: 90)
                    
                    
                }
                HStack{
                    TextField("XX", text: $Expiredate)
                        .frame(width: 35, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                     
                        .stroke(.gray, lineWidth: 0.3))
                    VStack{
                    Text("/")
                        .font(.system(size: 15).bold())
                        .foregroundColor(PrimaryColor)
                    }
                    TextField("XX", text: $Expiredate2)
                        .frame(width: 35, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.3))
                    
                    Spacer().frame(width: 120, height: 60)
                    TextField("XXXX", text: $CVVCode2)
                        .frame(width: 45, height: 17)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.3))
                    
                }
            }.padding(.trailing, 20)
                .padding(.top, 10)
            
            buttonForOtherPayment()
                .padding()
            
        }
    }
}


struct creditcard_Previews: PreviewProvider {
    static var previews: some View {
        creditcard()
    }
}

