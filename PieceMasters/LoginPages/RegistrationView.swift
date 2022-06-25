//  ContentView.swift
// 
//
//  Created by hanan on 02/11/1443 AH.


import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var registrationViewModel : RegistrationViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    
  
    var body: some View {
        
        ZStack{
            backgroundRectangle()
          
        VStack{
                Text("SignUp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    .multilineTextAlignment(.leading)
                    .padding(.top,-100)
                    .padding(.trailing,250)
            Group{
             
                HStack(spacing: 15){
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 19 ,height: 21)
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    .padding(.leading,10)
                    TextField("First Name", text: $registrationViewModel.firstName) }
                .padding(.horizontal)
              
                Divider()
        .padding(.horizontal)
                HStack(spacing: 15){
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 19 ,height: 21)
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    .padding(.leading,10)
                    TextField("Last Name", text: $registrationViewModel.lastName)
                                 }
                .padding(.horizontal)
              
                Divider()
        .padding(.horizontal)
                HStack(spacing: 15){
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .frame(width: 19 ,height: 21)
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    .padding(.leading,10)
                    TextField("Email Address", text: $registrationViewModel.email)
                                 }
                .padding(.horizontal)
                Divider()

                HStack(){
                    Image( "lock")
                        .resizable()
                        .frame(width: 24 ,height: 25)
                        .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0))
                        .padding(.leading,25)
                    SecureField("Password", text: $registrationViewModel.password)
                     
                    
                }
                Divider()
                    .padding(.horizontal)
                    .padding(.top, 10)


               
                HStack{
                    Text("By sign up,you’re agree to")
                        .font(.footnote)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                    Button(action: {
                        
                    }) {
                        Text("our Terms & Conditions")
                            .font(.footnote)
                            .lineLimit(1)
                            .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                            .font(.footnote)
                            .lineLimit(1)
                            .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                    }
                }
                .padding()
            }
               
                
                Button(action:{
                    registrationViewModel.createUser()
                }) {
                    Text("SignUp")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 100)
                        .frame(width: 289 , height: 63 )
                        .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))

                        .cornerRadius(10.0)
                }
            
                HStack(spacing: 15){
                    Rectangle()
                        .fill(Color.gray)
                    .frame(height: 1)
                    
                    Text("Or Login with")
                        .font(.callout)
                    
                    
                    Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                }
             .padding(.horizontal, 20)
             .padding(.top,20)
                VStack{
                    appleButton()
                        .padding(.top,20)


                    NavigationLink {
                        signIN().navigationBarBackButtonHidden(true)
                    }
                    label : {
                HStack {
                    Text ("Join us before ?")
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))


                        Text("Sign in ")
                    }
                    }

               // .padding()
                }
            }
           
            if registrationViewModel.isLoading{LoadingView()}
            
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $viewModel.isAouthenticatting) {MainPackaging() }
      
     
    }
        }
    


    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationView()
             .environmentObject(RegistrationViewModel())
             .environmentObject(AuthViewModel())
        }
    }

