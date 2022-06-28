

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
import Kingfisher
import Firebase

struct AllProducts: View {
    var index = 0
    var body: some View {
        ProductView(categoryIndexzx: index)
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
//    var categoryIndexzx : Int
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    var categories = ["All", "Cups", "Boxes", "Bags"]
    @ObservedObject private var Productviewmodel = ViewModel()
    @State var categoryIndexzx : Int
    @State var text = ""
    @State var filterData : [product] = []
    @State private var searchQuery = ""
    init(categoryIndexzx:Int){
        self._categoryIndexzx = State(initialValue: categoryIndexzx)
        Productviewmodel.getData()
    }
    var body: some View {
      
        ZStack {
         

        
            VStack (alignment: .leading){
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    
                    Text("Packaging and boxes")
                        .padding(.top, -50)
                        .font(.title2)
                        .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.478))
                    SearchBar(text: $searchQuery)
                        .padding(.top, 10)

                    
                }
                Text("Browse by category")
                    .padding(.top, 40)
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
                // case1
                if searchQuery == ""{
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: columns, spacing:40){
                        ForEach(categoryIndexzx == 0 ? Productviewmodel.list : Productviewmodel.list.filter({ p in
                            categories[categoryIndexzx].contains(p.title)
                            
                        
                  //      p.offer ?? 0 >= 0
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
                                        KFImage(URL(string:product.image))
                                      //  Image("\(product.image)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 150)
                                            .padding()
                                        
                                        
                                        
                                        VStack{
                                            HStack {
                                                
                                                VStack (alignment: .leading){
                                                    Text(product.title)
                                                        .font(.system(size: 16, weight: .bold, design: .default))
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
                                                            .font(.system(size: 13, weight: .bold, design: .default))

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
                }

                
                 else if  searchQuery != ""{
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: columns, spacing:40){
                        ForEach( searchQuery == "" ? Productviewmodel.list:
                                        Productviewmodel.list.filter{ $0.title.lowercased().contains(searchQuery.lowercased())})
                        
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
                                                        .font(.system(size: 16, weight: .bold, design: .default))
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
                                                            .font(.system(size: 13, weight: .bold, design: .default))
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

                            .frame(width: 75, height: 40)

                            
                        }
                    }
                }
                .padding(.top, -2.0)
                }
                
                
                Spacer()
            }.padding(.top, 20)
        }.padding()
        .padding(.top ,-10)
        
        
        
        
    }
//    init(){
//        Productviewmodel.getData()
//    }
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
        }, label: { VStack(spacing:0){
            if (isfilterArray == false){
//
//
//                Text(categories[data])
//                    .font(.system(size: 22))
//                    .fontWeight(index == data ? .bold : .none)
//                    .foregroundColor(Color(index == data ? "mainfont" : "subfont"))
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(index == data ? "mainfont" : "BACGR1"))
                        .frame(width: 75, height: 36)
                Text(categories[data])
                    
                    .font(.system(size: 18))
                    .fontWeight(index == data ? .bold : .none)
                    .foregroundColor(Color(index == data ? .white : .gray))
                    


                }
            }
            else
            {
                
//                Text(categories[data])
//                    .font(.system(size: 22))
//                    .fontWeight(index == data ? .bold : .none)
//                    .foregroundColor(Color(index == data ? "mainfont" : "subfont"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(index == data ? "mainfont" : "BACGR1"))
                        .frame(width: 75, height: 40)
                Text(categories[data])
                    
                    .font(.system(size: 18))
                    .fontWeight(index == data ? .bold : .none)
                    .foregroundColor(Color(index == data ? .white : .gray))
                    


                }
                
            }
            
            
            
            
            
//            Capsule()
//                .fill(Color(.white))
//                .frame(width: 30, height: 4)
//
//                .opacity(index == data ? 1 : 0)
        }.onTapGesture {
           
            index = data
            
        }})
        
    }
}
