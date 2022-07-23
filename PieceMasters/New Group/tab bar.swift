//
//  tab bar.swift
//  PieceMasters
//
//  Created by EMAN MOHAMMED on 21/06/2022.
//

import SwiftUI

struct tab_bar: View {
    var SecondaryColor: Color = (Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
    
    var body: some View {
        VStack{



            
                TabView {

                    NavigationView{

//                  MainPackaging()
//                      AllProducts()
 threeDModel()
                        

                    }

                    .tabItem {
                        Image(systemName: "shippingbox")
                        Text("Services")



                    }




                    // Screen2

                    NavigationView{
                        if ViewModel.shared.cartItems.isEmpty{
                            VStack{
                                Image("Group 330324")
                                    .resizable()
                                      .frame(width: 300, height: 300)
                               
                                
                            Text("Your cart is empty")
                                    .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                                    .fontWeight(.bold)
                                    .frame( height: 50)
                                NavigationLink(destination: MainPackaging()
                                               
                                ) {    Text("Continue shopping ")
                                    
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.vertical)
                                    //.padding(.horizontal, 100)
                                        .frame(width: 328 , height: 63 )
                                        .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                                    
                                        .cornerRadius(10.0)
                                     
                                }

                            }
                        }
                        else{
                            Cart()
                            
                        }
                    }
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                    // Screen3
                    NavigationView{

                        profile()
                    }

                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }





                }
        

                .accentColor((Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157)))
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemChromeMaterialLight)


            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
}

struct tab_bar_Previews: PreviewProvider {
    static var previews: some View {
        tab_bar()
    }
}
