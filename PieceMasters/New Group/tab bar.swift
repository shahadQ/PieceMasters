//
//  tab bar.swift
//  PieceMasters
//
//  Created by EMAN MOHAMMED on 21/06/2022.
//

import SwiftUI

struct tab_bar: View {

    
    var body: some View {
        VStack{



            
                TabView {

                    NavigationView{

//                        MainPackaging()
                        AllProducts()

                    }

                    .tabItem {
                        Image(systemName: "shippingbox")
                        Text("Services")



                    }




                    // Screen2

                    Text("Cart")
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
