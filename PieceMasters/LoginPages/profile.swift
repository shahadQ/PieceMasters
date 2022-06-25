//
//  profile.swift
//  profile
//
//  Created by EMAN MOHAMMED on 02/06/2022.
//

import SwiftUI

struct profile: View {
    var PrimaryColor : Color = (Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
    
    
    var SecondaryColor: Color = (Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
    @StateObject var prifileViewModel = ProfileViewModel()
    @EnvironmentObject var authViewModel : AuthViewModel

    var body: some View {



        NavigationView {
     

           
        ZStack{
            
     // background shape --------------------------------------------------------------
            backgroundRectangle()
                
     // header           --------------------------------------------------------------
            VStack{
                HStack{
                Text("Hello , ")
                        .font(.title2).bold()
                        .font(.largeTitle)
                        .foregroundColor(PrimaryColor)
                //.padding(.bottom, 700.0)
                TextField("First Name", text: $prifileViewModel.firstName)
                        .offset(x: 0, y: 0)
                        .foregroundColor(PrimaryColor)
                    TextField("Last Name", text: $prifileViewModel.lastName)
                        .offset(x: -80, y: 0)
                        .foregroundColor(PrimaryColor)
//                    .font(.title2).bold()
//                    .padding(.bottom, 700.0)
   
//                    .font(.largeTitle)
//                    .foregroundColor(PrimaryColor)
//                    .frame(width: 380, alignment: .bottomLeading)

                }
                .offset(x: 50, y: -350)
             
            }
            
            
 
            
            VStack{
       //section   Orders&Saved      --------------------------------------------------------------
                
                VStack{

                    HStack( spacing: 30){
                        //1)Orders
                        
                        ZStack (alignment: .topLeading) {
                            
                            
                            Rectangle()
                                .foregroundColor(.white)
                            
                            Rectangle()
                            
                                .fill(Color(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431))
                            
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 67, alignment: .top)
                            
                            
                            Button(action: {
                            }) {
                                Image("Orders")
                                    .resizable()
                                    .offset(x: 22.0, y: -5.0)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 92)
                                                      
                            
                            }
                            
                            Text(" Orders")
                                .font(.system(size: 12).bold())
                                .offset(x: 17.0, y: 70)
                                .foregroundColor(PrimaryColor)


                            
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                        // << here !!
                        .frame(width: 84, height: 92, alignment: .center)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)


                        
                        
                        //2)Saved
                        ZStack (alignment: .topLeading) {
                            
                            Rectangle()
                                .foregroundColor(.white)
                            
                            Rectangle()
                            
                                .fill(Color(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431))
                            
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 67, alignment: .top)

                            
                            Button(action: {
                            }) {
                                Image("Saved")
                                    .resizable()
                                    .offset(x: 33, y: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 40)
                            
                            
                            }
                            
                            Text("Saved items")
                                .font(.system(size: 12).bold())
                                .offset(x: 8.0, y: 70)
                                .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))

                            
                            
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        // << here !!
                        .frame(width: 84, height: 92, alignment: .center)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)

                        
                        
                    }
                    
                    
                    
                }
                .padding(EdgeInsets(top: 15, leading: 36, bottom: 30, trailing: 36))

                
       //section  list info   --------------------------------------------------------------
             //   1)profile
                VStack{
                    HStack {

                        Label {
                            Text("My profile")
                        .foregroundColor(PrimaryColor)
                        } icon: {
                            Image(systemName: "person")

                                .foregroundColor(SecondaryColor)

                        }
                        .frame(width: 320, alignment: .bottomLeading)
                        
                        
                        
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 16 ).bold())
                                .foregroundColor(.gray)
                            
                        }
                        
                    }
                    //line
                    Divider()
                    
                }
                .padding(EdgeInsets(top: -10, leading: 36, bottom: 10, trailing: 36))
                
                
                //2)location
                VStack{
                    HStack {

                        Label {
                            Text("My location")
                        .foregroundColor(PrimaryColor)
                        } icon: {
                            Image(systemName: "location")

                                .foregroundColor(SecondaryColor)

                        }
                        
                        .frame(width: 320, alignment: .bottomLeading)

                        Button(action: {
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 16 ).bold())
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    //line
                    Divider()
                    
                }
                .padding(EdgeInsets(top: 0, leading: 36, bottom: 10, trailing: 36))

                // 3)Language
                VStack{
                    HStack {

                        Label {
                            Text("Language")
                        .foregroundColor(PrimaryColor)
                        } icon: {
                            Image(systemName: "globe")

                                .foregroundColor(SecondaryColor)

                        }
                        .frame(width: 320, alignment: .bottomLeading)
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 16 ).bold())
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    //line
                    Divider()
                    
                }
                .padding(EdgeInsets(top: 0, leading: 36, bottom: 10, trailing: 36))

                //3)subscription
                VStack{
                    
                    HStack {

                        Label {
                            Text("How to get a subscription")
                        .foregroundColor(PrimaryColor)
                        } icon: {
                            Image(systemName: "person.crop.rectangle.stack")

                                .foregroundColor(SecondaryColor)

                        }
                        .frame(width: 320, alignment: .bottomLeading)
                        
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 16 ).bold())
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    //line
                    Divider()
                    
                }
                .padding(EdgeInsets(top: 0, leading: 36, bottom: 10, trailing: 36))

                //4)Terms and conditions
                VStack{
                    HStack {
                        Label {
                            Text("Terms and conditions")
                        .foregroundColor(PrimaryColor)
                        } icon: {
                            Image(systemName: "doc.plaintext")

                                .foregroundColor(SecondaryColor)

                        }
                        .frame(width: 320, alignment: .bottomLeading)
                        
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 16 ).bold())
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    //line
                    Divider()
                    
                }
                .padding(EdgeInsets(top: 0, leading: 36, bottom: 10, trailing: 36))

                //5)Call us
                VStack{
                    HStack {
                        
                        Label {
                            Text("Call us ")
                        .foregroundColor(PrimaryColor)
                        } icon: {
                            Image(systemName: "phone.arrow.up.right")

                                .foregroundColor(SecondaryColor)

                        }
                        .frame(width: 320, alignment: .bottomLeading)
                        
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 16 ).bold())
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    //line
                    Divider()
                    
                }
                .padding(EdgeInsets(top: 0, leading: 36, bottom: 10, trailing: 36))

                
                
                
                
                
            }
            
        
        }
        
            
            
        }.navigationTitle("profile")
        
        
    }
    

    
}





struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()
    }
}
