//
//  ProductDetails.swift
//  PieceMasters
//
//  Created by Shahad on 17/11/1443 AH.
//

import SwiftUI
import Firebase
import Kingfisher


struct ProductDetails: View {

    
    
    
    var Product:product
    @State var shouldHide = false
    @State private var showAlert = false
    //private var numberOfimages = 2
   @State var names = 0
    @State var TextFieldQuantities: String = ""
    @State private var  checkAmount = 0.0
    @FocusState private var amountFocus: Bool
    @State var isPlaying : Bool = false
    @State private var didTapToBuyaProduct:Bool = false
    @State private var didTapDesignPruduct:Bool = false
    @State private var didTapSize4:Bool = false
    @State private var didTapSize8:Bool = false
    @State private var didTapSize12:Bool = false
    @State private var didTapSize16:Bool = false
    @State private var didTapGloss:Bool = false
    @State private var didTapMatt:Bool = false
    @State private var didTapContinueOrder:Bool = false
    @State private var disabled = true
   @ObservedObject private var Productviewmodel = ViewModel()
    var  BACGR1: Color = Color(red: 0.85, green: 0.85, blue: 0.85)
    
    
    func addToCart(){
        
        let quantity = Int(TextFieldQuantities) ?? 0
        
        var cardboard = ""
        if didTapGloss == true {
            cardboard = "Gloss"
        }else if didTapMatt == true {
            cardboard = "Matt"
        }
        

//        let newcart = cart(products: Product,
//                           Quantity: quantity,
//                           Cardboard: cardboard,
//                           size: <#T##String#>,
//                           url: <#T##String#>,
//                           locations: "",
//                           createdAt: <#T##Date#>,
//                           orderStatus: <#T##Int#>,
//                           orderType: <#T##Int#>)
//        Productviewmodel.addToCart(item: newcart)
    }
 

    var body: some View {
        
       // NavigationView {
          //  ScrollView{
        
            ZStack {
               // backgroundRectangle()
                Color(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
//                    GeometryReader { proxy in
//                        TabView{
//                                ForEach(0..<numberOfimages){ num in
//                                    Image("\(num)")
//                                        .frame(width: 120, height: 210)
//                                        .scaledToFill()
//
//                                        .tag(num)
//                                }
//                            }.tabViewStyle(PageTabViewStyle())
//                            .clipShape(RoundedRectangle(cornerRadius: 5))
//
//                            .frame(width: proxy.size.width, height: proxy.size.height  )
//
//                        }
                    KFImage(URL(string:Product.image))
                        .resizable()
                                   .scaledToFit()
                                   .frame(width: 200, height: 200)
                      //  .padding(.top,80)
                       
                    
                   // Spacer()
                    ScrollView{
                    VStack(alignment: .leading){
                   //     ForEach(Productviewmodel.list){ pro in
                            
                        //    Text(pro.name)
                        Text(Product.amount)
                       // Text("hhhh")
                            .font(.system(size: 18))
                              //  .font(.title3)
                               
                            .fontWeight(.semibold)
                            .padding([.top, .bottom, .trailing])
                            //Spacer()
                        //}
                           
                        
//                        Text("Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ")
                        Text(Product.Description)
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color(hue: 0.0, saturation: 0.031, brightness: 0.391))
                          
                            
                           // .padding(.vertical,8)
                        Divider()
                           
                            //.padding(.leading)
                           
                           
                        Text("Packaging Type")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                       
                        HStack(spacing: 15){
                            
                            
                            Button(action: {
                               // self.didTap = true
                                self.didTapToBuyaProduct.toggle()
                            }, label: {
                                Text("To buy a product")
                                    .fontWeight(self.didTapToBuyaProduct ?  .bold : .semibold)

                                    .font(.system(size: 12))
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 16)
                                   

                                    .background(self.didTapToBuyaProduct ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapToBuyaProduct ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                            
                                  
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapToBuyaProduct.toggle()
                                        
                                        if didTapToBuyaProduct {
                                            didTapDesignPruduct = false
                            
                                        }
                                    }
                                
                            })
                          
                            if( Product.title == "Cup"){
                            Button(action: {
                                self.didTapDesignPruduct.toggle()
                                self.shouldHide = true
                            }, label: {
                                Text("Design your products")
                                    .fontWeight(self.didTapToBuyaProduct ?  .bold : .semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 16)
                                
                                    .background(self.didTapDesignPruduct ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapDesignPruduct ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                 
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapDesignPruduct.toggle()
                                        self.shouldHide = true
                                        
                                        if didTapDesignPruduct {
                                            didTapToBuyaProduct = false
                                            self.shouldHide = true
                                        }
                                    }
                                  
                            })
                           
                        }
                        }
                        .padding(.bottom)
                        
                        
                        
                        Divider()
                        Text("Quantities")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355)
                            )
                        
                     
                        //  Spacer()
                           
                        VStack(alignment: .leading ){
                          
                            TextField("Enter your Quantities", text: $TextFieldQuantities)
                                .font(.system(size: 12))
                                .keyboardType(.decimalPad)
                                .focused($amountFocus)
                            
                           
                                .toolbar{
                                    
                                    ToolbarItemGroup(placement: .keyboard){
                                        Button("Done"){
                                            amountFocus = false
                                            
                                        }.padding(.leading,270)
                                        
                                    }
                                }
                                
                            
                             
                       // .textFieldStyle(RoundedBorderTextFieldStyle())
                           
                                //.cornerRadius(10)
                                //.keyboardType(.numberPad)
                              
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                    
                                )
                                         
                            Text("Please Enter a Number >  100 ")
                                .font(.system(size: 12))
                                //.font(.caption)
                                .foregroundColor(Color(.systemGray))
                                .padding(.leading)
                            Divider()
                        }
                   
                    
                     
                      

         
                     
                         
                            Text("Size")
                            .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355)
                                )
                            
                        VStack(alignment: .leading){
                        HStack(spacing: 15){
                            
                            Button(action: {
                                self.didTapSize4.toggle()
                            }, label: {
                                Text((Product.size?[0])!)
                                    .font(.system(size: 12))
                                    .fontWeight(self.didTapSize4 ?  .bold : .semibold)
                                  //  .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                
                                    .padding()
                                
                                    .background(self.didTapSize4 ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapSize4 ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                
                                    //.background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 10)
//                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 ))
                                    .onTapGesture {
                                        didTapSize4.toggle()
                                        
                                        if didTapSize4 {
                                            didTapSize8 = false
                                            didTapSize12 = false
                                            didTapSize16 = false
                                        }
                                    }

                            })
                            
                            
                            Button(action: {
                                self.didTapSize8.toggle()
                            }, label: {
                                Text((Product.size?[1])!)
                                    .font(.system(size: 12))
                                    .fontWeight(self.didTapSize8 ?  .bold : .semibold)
                                   // .font(.system(size: 16))
                                       // .fontWeight(.semibold)

                                    .padding()
                                  //  .padding(.horizontal)
                                
                                    .background(self.didTapSize8 ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapSize8 ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                
                                   
                                
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapSize8.toggle()
                                        
                                        if didTapSize8 {
                                            
                                            didTapSize4 = false
                                            didTapSize12 = false
                                            didTapSize16 = false
                                        }
                                    }
                                
                                        
                            })
                            Button(action: {
                                self.didTapSize12.toggle()
                            }, label: {
                                Text((Product.size?[2])!)
                              //  Text(viewmodel.list.filter(self.))
                                    .font(.system(size: 12))
                                    .fontWeight(self.didTapSize12 ?  .bold : .semibold)
                                   
                                    .padding()
                                    .background(self.didTapSize12 ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapSize12 ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
//
//                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapSize12.toggle()
                                        
                                        if didTapSize12 {
                                            didTapSize8 = false
                                            didTapSize4 = false
                                            didTapSize16 = false
                                        }
                                    }
                            })
                            Button(action: {
                                self.didTapSize16.toggle()
                            }, label: {
                                Text((Product.size?[3])!)
                                    .font(.system(size: 12))
                                    .fontWeight(self.didTapSize16 ?  .bold : .semibold)
                                    .padding()
                           
                                    .background(self.didTapSize16 ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapSize16 ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapSize16.toggle()
                                        
                                        if didTapSize16 {
                                            didTapSize8 = false
                                            didTapSize12 = false
                                            didTapSize4 = false
                                        }
                                    }
                              
                            })
                      
                        }
                        .padding(.bottom)
                            Divider()
                              
                            Text("Cardboard")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355)
                                )
                            HStack(spacing: 15){
                               
                            Button(action: {
                                self.didTapGloss.toggle()
                            }, label: {
                                Text("Gloss")
                                    .font(.system(size: 12))
                                    .fontWeight(self.didTapGloss ?  .bold : .semibold)
                                    .padding()
                                  //  .padding(.horizontal)
                                
                                    .background(self.didTapGloss ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapGloss ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapGloss.toggle()
                                        
                                        if didTapGloss {
                                            didTapMatt = false
                                          
                                        }
                                    }
                                
                                        
                            })
                            Button(action: {
                                self.didTapMatt.toggle()
                            }, label: {
                                Text("Matt")
                                
                                    .font(.system(size: 12))
                                    .fontWeight(self.didTapMatt ?  .bold : .semibold)
                                    .padding()
                                  //  .padding(.horizontal)
                                
                                    .background(self.didTapMatt ? Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157) : Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(self.didTapMatt ? Color.white : Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                                
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.8431372549019608, green: 0.8352941176470589, blue: 0.8352941176470589),lineWidth: 1 )
                                        
                                    )
                                    .onTapGesture {
                                        didTapMatt.toggle()
                                        
                                        if didTapMatt {
                                            didTapGloss = false
                                         
                                        }
                                    }
                                
                                        
                            })
                            }
                            .padding(.bottom, 90.0)
                        }
                     // .padding()
                        
                        .padding(.bottom, 90.0)
                        
                        
                        
                    }
                        
                    .padding()
                    .padding(.top)
                    .background(Color.white)
                    .cornerRadius(40,corners: .topLeft)
                        
                    }
                   
                   
                    }
                
                HStack{
                    
                    VStack {
                        Text("Total Price :")
                            .foregroundColor(Color(red: 0.5098039215686274, green: 0.49411764705882355, blue: 0.49411764705882355))
                        if TextFieldQuantities == ""{
                            Text("\(Product.price) SR")
                                .font(.title)
                                .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                            
                        }
                        else{
                           
                           // Text("\(totalcal()) SR")

                            Text("\(Productviewmodel.totalcal(item: Product, TextFieldQ: TextFieldQuantities)) SR")
                            .font(.title)
                            .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                        }
                    }
                    Spacer()
                    NavigationLink(destination: {
                        
                        if self.didTapToBuyaProduct == true{
                      Cart()
                            
                            
                        
                         //view 3Dmodel
                        }
                        else if self.didTapDesignPruduct == true || self.didTapDesignPruduct == false
                        {
                            
                         threeDModel()
                            Text("")
                                .navigationBarTitle("")
                                .navigationBarTitleDisplayMode(.large)
                                .navigationBarItems(
                                    trailing:
                                        Button(action:
                                                { showAlert = true}
                                               // Actions
                                               , label: {Image(systemName: "info.circle.fill")})
                                        
                                        .foregroundColor(.gray)
                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("TIPS"),
                                                message: Text("\n"+"Only for preview display" + "Product Color May Slightly Vary when printing.")
                                            )
                                        }                                )
                            
                            
             
                      
                        }
                    })
                    
                    {
                        
                        
                        
                        if didTapToBuyaProduct == false && didTapDesignPruduct ==  false || didTapSize4 == false && didTapSize8 == false && didTapSize12 == false  && didTapSize16 == false
                            || didTapGloss == false    && didTapMatt == false  || TextFieldQuantities == ""
                            
                            
                            
                            
                            {
                            
                            

                            Button("Continue Order", action: {})
                                .disabled(false)
                                .padding()
                                .padding(.horizontal)
                                .background(BACGR1)
                                .foregroundColor(.gray)
                                .cornerRadius(10)

                           }
                        
                        
                        
                        else{
                         
                            Button("Continue Order", action: {
                                
                                
                                
                                
                                //Productviewmodel.addToCart(item: <#T##cart#>)
                                
                                
                            })
                            .disabled(disabled)
                            .padding()
                            .padding(.horizontal)
                            .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                            .cornerRadius(10.0)
                            .foregroundColor(Color.white)
                            
                            
                            
                            
                        }
                    }
                   
                   
                   
                }
                .padding()
                
                .background(Color(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922))
                .cornerRadius(40,corners: .topLeft)
                .frame( maxHeight: 550, alignment: .bottom)
               
             
                
                Button(action: {
                                      self.isPlaying.toggle()
                                   }) {
                                       Image(systemName: self.isPlaying == true ? "bookmark.fill" : "bookmark")
                                           .resizable()
                                           .foregroundColor(Color(red: 0.4980392156862745, green: 0.792156862745098, blue: 0.7372549019607844))
                                          
                                             .frame(width: 17.33, height: 22.86)
                                   }
                
                
                    .frame(width: 50, height: 50 )
                   
                    .background()
                    .cornerRadius(10)
                    .position(x: 320, y: 210)
                    .shadow(radius: 0.1)
                    
            }//.onAppear(){
             //   Productviewmodel.getData()
           // }
            .edgesIgnoringSafeArea(.bottom)
    
        
        
        
        
        
        
  //  }
        
        
    }//END body
   // init(){
   //     Productviewmodel.getData()
   // }
}//END ContentView



struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(Product: product( id: "11", title: "cuup", Description: "Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ", image: "Cup1", amount: "PAPER CUP",  price: 90, offer: 1, isSelected: false))
    }
}






