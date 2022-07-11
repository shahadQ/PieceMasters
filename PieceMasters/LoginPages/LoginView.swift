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
    
    func checkIfUserLoggedIn() {
        
        if Auth.auth().currentUser?.uid != nil {
            LoginView()
            
        } else {

            RegistrationView()
        }
    }
//    var body: some View {
//
//        LoginView()
//            .environmentObject(AuthViewModel())
//    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
                  .environmentObject(AuthViewModel())

    }
}
//struct LoginView : View {
//    @EnvironmentObject var viewModel: AuthViewModel
//    @AppStorage("email") var email = ""
//    @AppStorage("password") var password = ""
//
    
    var body: some View{
        
        NavigationView{
        ZStack{
            backgroundRectangle()
         
        VStack{
                Text ("LOG IN")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                    .multilineTextAlignment(.leading)
                 
                    .padding(.trailing,240)
                    .padding(.top,-75)
            
                    HStack(spacing: 25){
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 19 ,height: 21)
                            .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                            .padding(.leading,28)
                        TextField("Email Address", text: $email)
                    }
                    .padding(.top, 50)
                    Divider()
                .padding(.horizontal)
                .padding(.top, 10)
                HStack(){
                    Image( "lock")
                        .resizable()
                        .frame(width: 25 ,height: 25)
                        .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0))
                        .padding(.leading,25)
                    SecureField("Password", text: $password)
                        .padding(.leading,15)
                    
                }
                Divider()
                    .padding(.horizontal)
                    .padding(.top, 5)

               ForgetPassView()
              
                
                Button(action:{
                    viewModel.logInUser(email: email, password: password)

                }) {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 100)
                        .frame(width: 289 , height: 63 )
                        .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
//
                       
                        .cornerRadius(10.0)
                }
                .padding()
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
                
                VStack {
                    appleButton()
                        .padding(.top,20)

              
                    NavigationLink {
                        RegistrationView().navigationBarBackButtonHidden(true)
                    }
                    label:{
HStack {
                    Text (" Don't have an account ?")
        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                        Text("Sign up")
                    }
                }
                .padding(.top,10)
                }
            }
            if viewModel.isLoading{
                LoadingView()
            }
            
            }
        .navigationBarHidden(true)
//       // .alert(alertTitle, isPresented: $showingAlert) {
//            Button("OK", role: .cancel) { }
        }
        .fullScreenCover(isPresented: $viewModel.isAouthenticatting) {
            MainPackaging()
        }
        .onAppear {
            checkIfUserLoggedIn()
        }
    }



struct ForgetPassView: View {
    
    var body: some View {
        
        HStack{
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }) {
                
                Text("Forget Password?")
                    .onTapGesture {
                        x()
                    }
                    .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
            }
        }
        .padding(.horizontal)
        .padding()
    }
    
    func x() {
        
        print("FRFF")
    }
}
}
