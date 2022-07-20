//
//  paymentPage.swift
//  PieceMasters
//
//  Created by wafa ali on 22/11/1443 AH.
//

import SwiftUI

struct paymentPage: View {
    
    @State private var didTapCreditCard:Bool = false
    @State private var didTapCash:Bool = false
    @State private var didTapApplePay:Bool = false
    @State private var UserPayment: Int = 1
    
    
    var body: some View {
        // NavigationView {
        VStack{
            ZStack{
                backgroundRectangle()
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
                            .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                            .frame(width: 100)
                        
                        
                        
                        Circle()
                            .fill(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4588235294117647))
                            .frame(width:20 , height: 20 )
                    }
                    
                    Rectangle()
                        .fill(Color(red: 0.8862745098039215, green: 0.8862745098039215, blue: 0.8862745098039215))
                        .frame(width:100 , height: 5 )
                        .padding(.top, 35.0)
                    
                    VStack{
                        Text("Confirmation")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.225, green: 0.26, blue: 0.457))
                            .frame(width: 110)
                            .position(x: 50, y: 518)
                    }
                    VStack{
                        
                        Circle()
                            .fill(Color(red: 0.886, green: 0.886, blue: 0.886))
                            .frame(width:20 , height: 20 )
                            .position(x: 10, y: 550)
                        
                        
                    }
                }.position(x: 190, y: 250)
                    .padding()
                
                HStack( spacing: -30){
                    ZStack{
                        
                        Button(
                            action: {
                                self.didTapCreditCard = true
                                self.didTapApplePay = false
                                self.didTapCash = false
                                self.UserPayment = 1
                            }) {
                                Text("Credit Card")
                                
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor((self.didTapCreditCard ? Color.white  : Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157)))
                                    .position(x: 40, y: 45)
                                
                                    .frame(width: 80 , height:60)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(self.didTapCreditCard ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white )
                                            .foregroundColor(self.didTapCreditCard ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                            .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 10, y: 10)
                                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                        
                                    )
                                
                            }
                        Image("Mada")
                            .position(x: 80, y: 540)
                        
                        
                    }
                    ZStack{
                        Button(action: {
                            self.didTapCreditCard = false
                            self.didTapApplePay = false
                            self.didTapCash = true ;
                            self.UserPayment = 2
                            
                        }) {
                            Text("Cash")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor((self.didTapCash ? Color.white  : Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157)))
                                .position(x: 40, y: 45)
                                .frame(width: 80 , height:60)                                    .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(self.didTapCash ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white )
                                        .foregroundColor(self.didTapCash ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                        .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 10, y: 10)                                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    
                                    
                                )
                            
                        }
                        Image("Wallet")
                            .position(x: 80, y: 540)
                        
                    }
                    
                    
                    ZStack{
                        Button(action: {
                            self.didTapCreditCard = false
                            self.didTapApplePay = true
                            self.didTapCash = false
                            ; self.UserPayment = 3
                        }) {
                            Text("Apple Pay")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor((self.didTapApplePay ? Color.white  : Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157)))
                                .position(x: 40, y: 45)
                                .frame(width: 80 , height:60)                                    .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)  .foregroundColor(self.didTapApplePay ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white )
                                        .foregroundColor(self.didTapApplePay ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                        .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 10, y: 10)                                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    
                                )
                        }
                        Image(self.didTapApplePay ? "apple pay" : "apple pay" )
                        
                            .position(x: 80, y: 540)
                        
                    }
                    
                }
                
                
                .position(x: 195, y: 400)
                // .padding(.vertical)
                
                //
                //
                //  VStack(alignment: .leading){
                //
                //      VStack(alignment: .leading){
                // Text("Credit card number")
                // .fontWeight(.bold)
                //
                // HStack(alignment: .top, spacing:10){
                //
                //
                //TextField("XXXX", text: $CreditNumber)
                //          .frame(width: 45, height: 17)
                //          .padding()
                //            .overlay(
                //                RoundedRectangle(cornerRadius: 10)
                //                    .stroke(.gray, lineWidth: 1))
                //
                //      TextField("XXXX", text: $CreditNumber)
                //                .frame(width: 45, height: 17)
                //                .padding()
                //                  .overlay(
                //                      RoundedRectangle(cornerRadius: 10)
                //                          .stroke(.gray, lineWidth: 1))
                //      TextField("XXXX", text: $CreditNumber)
                //                .frame(width: 45, height: 17)
                //                .padding()
                //                  .overlay(
                //                      RoundedRectangle(cornerRadius: 10)
                //                          .stroke(.gray, lineWidth: 1))
                //      TextField("4578", text: $CreditNumber)
                //                .frame(width: 45, height: 17)
                //                .padding()
                //                  .overlay(
                //                      RoundedRectangle(cornerRadius: 10)
                //                          .stroke(.gray, lineWidth: 1))
                //  }
                //
                //      }.padding(.trailing, 20)
                //
                //      VStack (alignment: .leading){
                //          Text("Cardholder Name")
                //.fontWeight(.bold)
                //      TextField("Wafa ali", text: $CreditName)
                //                .frame(width: 310, height: 17)
                //                .padding()
                //                  .overlay(
                //                      RoundedRectangle(cornerRadius: 16)
                //                          .stroke(.gray, lineWidth: 1))
                //
                //      }
                //      .padding(.trailing, 20)
                //      .padding(.top, 10)
                //
                //      VStack{
                //      HStack{
                //Text("Expire date")
                //.fontWeight(.bold)
                //
                //          Spacer()
                // Text("CVV Code")
                // .fontWeight(.bold)
                // .frame(width: 90)
                //
                //      }
                //      HStack{
                //          TextField("10", text: $Expiredate)
                //                .frame(width: 35, height: 17)
                //                .padding()
                //                  .overlay(
                //                      RoundedRectangle(cornerRadius: 10)
                //                          .stroke(.gray, lineWidth: 1))
                //
                //
                //      TextField("28", text: $Expiredate)
                //          .frame(width: 35, height: 17)
                //          .padding()
                //            .overlay(
                //                RoundedRectangle(cornerRadius: 10)
                //                    .stroke(.gray, lineWidth: 1))
                //
                //          Spacer().frame(width: 120, height: 60)
                //          TextField("123", text: $CVVCode)
                //                    .frame(width: 45, height: 17)
                //                    .padding()
                //                      .overlay(
                //                          RoundedRectangle(cornerRadius: 10)
                //                              .stroke(.gray, lineWidth: 1))
                //
                //      }
                //      }.padding(.trailing, 20)
                //          .padding(.top, 10)
                //  }
                //  .position(x: 190, y: 600)
                //.padding()
                //.padding(.top, 10)
                //
                //applePay()
                //                    .position(x: 200, y: 850)
                //
                
                if UserPayment == 1
                {
                    creditcard()
                        .position(x: 200, y: 670)
                }
                else{
                    if UserPayment == 2
                    { buttonForOtherPayment()    .position(x: 190, y: 800)
                        //  Confirmation()
                    }
                    else{
                        _applePay()
                            .position(x: 190, y: 800)
                        
                    }
                    
                }
            }
            
            
            
            
            
            
            
            
        }
        .padding()
        //  .navigationTitle("Checkout")
        
        // }
        
    }
}



struct paymentPage_Previews: PreviewProvider {
    static var previews: some View {
        paymentPage()
    }
}

