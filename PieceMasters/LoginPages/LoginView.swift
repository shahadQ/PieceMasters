//
//  ContentView.swift
//  profile
//
//  Created by hanan on 02/11/1443 AH.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
                .environmentObject(AuthViewModel())
            
        }
    }
    
    
    var body: some View{
        
      
        ZStack{
            //            backgroundRectangle()
            Image("JJ")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
               .padding(.top ,-100)
            VStack{
                VStack{

                    Text ("Sign in")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                        .padding(.trailing,220)
                        .padding(.bottom ,5)
                        .padding(.top ,20)
                    Text (" Welcome back to Brand it👋")
                        .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                        .font(.system(size: 14))
                        .padding(.trailing,140)
                        .padding(.bottom ,20)
                    
                    
                    
                    
                }.padding(.bottom ,50)
                    .padding(.top ,10)
                
                HStack(spacing: 25){
                    

                    
                    Label {
                        TextField("Email Address", text: $email)
                            .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                    } icon: {
                        Image(systemName: "envelope")
                        
                            .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                            .padding(.trailing)
                    }
                    .frame(width: 320, alignment: .bottomLeading)
                    
                }
                .padding(.top, -50)
                Divider()
                    .padding(.horizontal)
                    .padding(.top, -15)
                
                HStack(){

                    
                    
                    Label {
                        SecureField("Password", text: $password)
                            .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                    } icon: {
                        
                        Image("lock")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                            .padding(.trailing)
                    }
                    .frame(width: 320, alignment: .bottomLeading)
                    
                }
                Divider()
                    .padding(.horizontal)
                
                
                
                ForgetPassView()
                
                NavigationLink(destination: map()) {
                Button(action:{
                    viewModel.logInUser(email: email, password: password)
                    
                }) {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 100)
                        .frame(width: 289 , height: 63 )
                        .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    //
                    
                        .cornerRadius(10.0)
                }
                }
                
                
                        .padding(.top,30)
                
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }
            label:{
                HStack {
                    Text (" Don't have an account ?")
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    
                    Text("Sign up")
                        .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
                }
            }
            .padding(.top,10)
            .padding(.bottom ,140)
                
            }
            if viewModel.isLoading{
                LoadingView()
            }
            
        }
        
//        .fullScreenCover(isPresented: $viewModel.isAouthenticatting) {
//            map()
//        }
        .navigationBarHidden(true)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
            Button("OK", role: .cancel) { }
        }
      
       
        
        
    }
}
struct ForgetPassView:  View {
    
    var body: some View {
        
        HStack{
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }) {
                
                Text("Forget Password?")
                
                    .font(.system(size: 14))
                    .onTapGesture {
                        x()
                    }
                    .foregroundColor(Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
            }
        }
        .padding(.horizontal)
        .padding()
    }
    
    func x() {
        
        print("FRFF")
    }
}


