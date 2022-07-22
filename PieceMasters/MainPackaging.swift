//
//  MainPackaging.swift
//  PieceMasters
//
//  Created by raghad Mohammed on 20/11/1443 AH.
//



import SwiftUI

struct ImageModel: Identifiable{
    var id = UUID()
    let title: String
    let ImageName: String
    let ImageBrand: String
    var offer : Int?
    
}

struct MainPackaging: View {
    @State var IData = [
        ImageModel(title: "All Products", ImageName: "img1", ImageBrand: ""),
    
        ImageModel(title: "Cups", ImageName: "img2" ,ImageBrand: ""),
        ImageModel(title: "Boxes", ImageName: "img3", ImageBrand: ""),
        ImageModel(title: "Bags", ImageName: "bag1", ImageBrand: "")
    ]
    
    @State var IData2 = [
        ImageModel(title: "", ImageName: "img5", ImageBrand: "brand"),
        ImageModel(title: "", ImageName: "img6", ImageBrand: "brand"),
        ImageModel(title: "", ImageName: "img5", ImageBrand: "brand")
    ]
  
    @State var text = ""
    var body: some View {
        
      // NavigationView{
            ScrollView(.vertical) {
            ZStack{
              

                Color("iColor")
                    .ignoresSafeArea()
            VStack{
                
                Text("Packaging and Boxes").font(.system(size: 23).bold())
                    .padding(.top ,-50)
                    .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                    
              .padding(.leading ,-125)

                SearchBar(text: $text)
                    .frame(width: 350, height: 38 )
                    .padding(.bottom ,-15)
             
                Group{
                    TabView {
                        ZStack{
                        Image("ad2")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                            VStack{
                                Text("40%")
                                    .font(.title)
                                    .bold()
                                Text("First order")

                                Button("Book") {
                                                
                                            }
                                .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                                .padding(.horizontal)
                                        .background(Color.white)
                                .cornerRadius(10)
                                .frame(width: 96, height: 23)

                            }
                            .foregroundColor(.white)
                            .padding(.leading, 201.0)
                        }
                    
                        ZStack{
                        Image("ad3")
                        VStack{
                            Text("40%")
                                .font(.title)
                                .bold()
                            Text("First order")
                            Button("Book") {
                                            
                                        }
                            .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                            .padding(.horizontal)
                                    .background(Color.white)
                            .cornerRadius(10)
                            .frame(width: 96, height: 23)

                        }
                        .foregroundColor(.white)
                        .padding(.leading, 201.0)
                    }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                    .accentColor(Color.pink)
                              .tabViewStyle(.page)

                }.padding(.top ,-5)

                Group{
                VStack(alignment:.leading){
                    Text("Packaging")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.top ,-30)
                        .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                        
                        .padding(.trailing, 239.0)
                    HStack{
                        Text("Browse by categories")
                           
                        Spacer()
                        Text("see all")
                        
                        
                    }
                   
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                    
                    ScrollView(.horizontal ,showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(self.text.isEmpty ? IData : []) {iidata in
                                let index = index(title: iidata.title)
//                             let index = iidata.title == "All Products" ? 0 : 1
                                NavigationLink(destination: {
                                    
                                    
                                    AllProducts(index:index)
                                    
                                    
                                    
                                }, label: {VStack{
                                    
                                    Image(iidata.ImageName)
                                        .resizable()
                                        .frame(width: 77, height: 75)
                                    
                                    Text("\(iidata.title)")
                                        .font(.caption)
                                        .frame(width: 80.18, height: 19.47)
                                        .foregroundColor(Color(red: 0.42, green: 0.42, blue: 0.42))
                                        
                                }
                                
                                    .frame(width: 140, height: 104)
                                    .background(.white)
                                .cornerRadius(15)})
                           
                                
                                
                            }
                            
                            
                            
                            }
                        
                        }
                   
                    }
                .padding()
                    
                    
                    Group{
                    HStack{
                    Text("Special occasions")
                    Spacer()
                    Text("see all")
                        
                    }
                    
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                   
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(IData2) { iiidata in
                                
                                    VStack{
                                        
                                        ZStack{
                                        Image(iiidata.ImageName)
                                            .resizable()
                                            .frame(width: 88, height: 85)
                                        
                                        Text("\(iiidata.title)")
                                            .font(.caption)
                                            .frame(width: 80.18, height: 19.47)
                                            .foregroundColor(Color(red: 0.42, green: 0.42, blue: 0.42))
                                            
                                            
                                        Image(iiidata.ImageBrand)
                                            .resizable()
                                            .position(x: 40, y: 21 )
                                        
                                            Text("Add your brand")
                                               
                                                .fontWeight(.bold)
                                                .font(.system(size: 7))
                                                .rotationEffect(Angle(degrees: 320))
                                                .foregroundColor(.white)
                                                .position(x: 27, y: 22)
                                            
                                            
                                        }
                                    }
                                    
                                        .frame(width: 140, height: 104)
                                        .background(.white)
                                    .cornerRadius(15)
                                    
                                }
                      
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    }
                }
                }
                
            .navigationBarBackButtonHidden(true)
        }
            }
    
    
    func index(title:String)->Int{
        switch title{
        case "All Products":
            return 0
        case "Cups":
            return 1
        case "Boxes":
            return 2
        case "Bags":
            return 3
        default:
            return 0
            
  
            
        }
    }
    }


struct MainPackaging_Previews: PreviewProvider {
    static var previews: some View {
        MainPackaging()
    }
}



