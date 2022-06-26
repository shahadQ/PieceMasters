//
//  AllProducts.swift
//  PieceMasters
//
//  Created by raghad Mohammed on 21/11/1443 AH.
//
//
//  ContentView.swift
//  Product Piece
//
//  Created by raghad Mohammed on 10/11/1443 AH.
//

import SwiftUI
import Firebase

struct AllProducts: View {
    var body: some View {
        ProductView()
    }
}

struct AllProducts_Previews: PreviewProvider {
    static var previews: some View {
        AllProducts()
    }
}


struct ProductView: View {
    
    @State var ProductData = [
        product(id: "11", title: "Cup",Description: "Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ", image: "Cup1", amount: "Double wall paper cup", price: "100", offer: 15, isSelected: true),
        product(id: "22", title: "Ice cream Cup", Description: "Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ",image: "Cup2", amount: "The ice cream cups", price: "150",isSelected: false),
        product(id: "33", title: "Box", Description: "Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ",image: "box", amount: "Double wall paper cup",  price: "210", isSelected: false),
        product(id: "44", title: "Bags",Description: "Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ", image: "bag", amount: "Double wall paper cup", price: "100", isSelected: false),
        
    ]
    
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    var categories = ["All", "Cups", "Boxes", "Bags"]
    @ObservedObject private var Productviewmodel = ViewModel()
    @State var categoryIndexzx = 0
    @State var text = ""
    @State var filterData : [product] = []
    
    var body: some View {
      
        ZStack {
         

        
            VStack (alignment: .leading){
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    
                    Text("Packaging and boxes")
                    
                        .font(.title2)
                        .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                    SearchBar(text: $text)
                        .padding(.top, 30)
                    
                }
                Text("Browse by category")
                    .foregroundColor(Color(red: 0.42, green: 0.416, blue: 0.42))
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30){
                        ForEach(0..<categories.count, id: \.self){data in
                            
                            Categories(ProductData: $ProductData, data: data, index: $categoryIndexzx, filterData: $filterData)
                        }
                    }
                }
         
                .padding()
                HStack{
                    
                    Text("Products")
                        
                }
                .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: columns, spacing:40){
                        ForEach(categoryIndexzx == 0 ? Productviewmodel.list : Productviewmodel.list.filter({ p in
                            
                        
                           p.offer ?? 0 >= 0
                        }))
                        
                        { product in
                            NavigationLink(destination: ProductDetails(Product: product)){
                            ZStack{
                                
                                
                                Button(action: {

                                }){
                                    HStack{
                                        Image(systemName: product.isSelected ? "bookmark.fill": "bookmark")
                                        
                                            .foregroundColor(Color(red: 0.5, green: 0.8, blue: 0.736))
                                    }
                                }
                                .position(x: 130, y: 25)
                                
                                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                                    VStack {
                                        //
                                        Image("\(product.image)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 150)
                                            .padding()
                                        
                                        
                                        
                                        VStack{
                                            HStack {
                                                
                                                VStack (alignment: .leading){
                                                    Text(product.title)
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color("mainfont"))
                                                       
                                                    Text(product.amount)
                                                        .font(.caption)
                                                        .foregroundColor(Color("subfont"))
                                                        .minimumScaleFactor(0.9)
                                                        .lineLimit(2)
                                                        
                                                    
                                                    HStack{
                                                        Text("Start from")
                                                            .font(.subheadline)
                                                            .foregroundColor(Color(red: 0.5, green: 0.8, blue: 0.736))
                                                            .fontWeight(.light)
                                                        
                                                        Spacer()
                                                        Text("\(product.price) RS")
                                                            .font(.caption)
                                                            .foregroundColor(Color("mainfont"))
                                                            .fontWeight(.semibold)
                                                    }
                                                    
                                                }
                                                
                                                Spacer()
                                            }
                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.vertical,20)
                                        
                                        .background(.white)
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                ZStack{
                                    
                                    
                                    Image(product.offer != nil ? "offer" : "")
                                        .padding()
                                        .position(x: 30, y: 30)
                                }
                                }
                                }
                              
                            
                            
                            .background(Color("iColor1"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color("iColor1").opacity(1.5), radius: 5, x:0, y: 5)

                            .frame(width: 150, height: 290)

                            
                        }
                    }
                }
                .padding(.top, -2.0)
                
                Spacer()
            }.padding(.top, 20)
        }
        .padding()
        
        
        
        
    }
    init(){
         Productviewmodel.getData()
    }
}

struct Categories: View {
    @ObservedObject private var Productviewmodel = ViewModel()
    @Binding var ProductData : [product]
    var data: Int
    @Binding var index: Int
    @Binding var filterData : [product]
    var categories = ["All", "Cups", "Boxes", "Bags"]
    
    @State var isfilterArray = false
    var body: some View{
        Button(action: {
            switch (data) {
            case 0 :
                isfilterArray = false
                break
            case 1 :
                isfilterArray = true
                
                filterData = Productviewmodel.list.filter {p in
                    p.title == "Cup"}
                print(filterData)
                break
            case 2 :
                isfilterArray = true
                
                filterData = Productviewmodel.list.filter {p in
                    p.title == "Box"}
                print(filterData)
                break
            case 3:
                isfilterArray = true
                
                filterData = Productviewmodel.list.filter {p in
                    p.title == "Bags"}
                print(filterData)
                break
                
            default:
                isfilterArray = false
            }
        }, label: { VStack(spacing: 8 ){
            if (isfilterArray == false){
                
                
                Text(categories[data])
                    .font(.system(size: 22))
                    .fontWeight(index == data ? .bold : .none)
                    .foregroundColor(Color(index == data ? "mainfont" : "subfont"))
            }
            else
            {
                
                Text(categories[data])
                    .font(.system(size: 22))
                    .fontWeight(index == data ? .bold : .none)
                    .foregroundColor(Color(index == data ? "mainfont" : "subfont"))
                
            }
            
            
            
            
            
            Capsule()
                .fill(Color("mainfont"))
                .frame(width: 30, height: 4)
                
                .opacity(index == data ? 1 : 0)
        }.onTapGesture {
           
            index = data
            
        }})
        
    }
}
