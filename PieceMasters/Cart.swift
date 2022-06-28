

import SwiftUI
import Kingfisher
struct Cart: View {
    var Product:product
    var body: some View {
        
        NavigationView{
            ZStack {
                Cart3D()
                // product detailes
                
                HStack (spacing: 20){
                    ZStack{
                        KFImage(URL(string:Product.image))
                            .resizable()
                            .frame(width: 80, height: 86.56)
                         
                  //  Image(Product.image)
                     //   .resizable()
                    }.padding(.leading ,20)
                    VStack(alignment: .leading){
                        Text(Product.title)
                            .bold()
                        Text(Product.amount)
                           .font(.system(size:13))
                         
                            .foregroundColor(Color.gray)
                        Text("\(Product.price) $")
                            .bold()
                    }.frame(width: 100, height: 20)
                    }.padding(.top ,-130)

                .padding(.top,-230)
                .padding(.trailing,200)
                Divider()
                    .padding(.horizontal)
                    .padding(.top, -120)
                
                    Text("Payment Summary")
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        .padding(.top,-100)
                        .padding(.trailing,200)
                HStack( spacing:150){
                    VStack(alignment:.leading, spacing: 12 ){
                        Text("Order Total")
                            .foregroundColor(Color(red: 0.03529411764705882, green: 0.058823529411764705, blue: 0.2784313725490196, opacity: 0.43))
                           
                        Text("Items Discount")
                            .foregroundColor(Color(red: 0.03529411764705882, green: 0.058823529411764705, blue: 0.2784313725490196, opacity: 0.43))
                           
                        Text("Coupon Discount")
                            .foregroundColor(Color(red: 0.03529411764705882, green: 0.058823529411764705, blue: 0.2784313725490196, opacity: 0.43))
                            
                        Text("Shipping")
                            .foregroundColor(Color(red: 0.03529411764705882, green: 0.058823529411764705, blue: 0.2784313725490196, opacity: 0.43))
                            
                        
                        
                    }
                    VStack(spacing: 12 ){
                        // مؤقته > يجب تعديلها كمتغيرات مربوطة
                        
                        Text("\(Product.price) $")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        Text("- $0.0")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        Text("-$0.0")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        Text("Free")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                    }
                    
                    
                    
                    
                }
                Divider()
                    .padding(.horizontal)
                    .padding(.top,170)
                HStack( spacing:245){
                    Text("Total")
                        .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                    Text("\(Product.price) $")
                        .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                    
                    
                    
                }
                .padding(.top, 220)
               
                Button(action:{

                }) {
                    Text("Proceed to checkout")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        //.padding(.horizontal, 100)
                        .frame(width: 328 , height: 63 )
                        .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
//
                       
                        .cornerRadius(10.0)
                }
                .padding(.top, 360)
                Button(action:{

                }) {
                    Text("Continue shopping ")
                        
                        .foregroundColor(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                        .fontWeight(.bold)
                        .padding(.vertical)
                        //.padding(.horizontal, 100)
                        .frame(width: 328 , height: 63 )
                        .background(.white)
                        .border(.black)
                        .cornerRadius(3.0)
                    
                       // .cornerRadius(10.0)
                }
                .padding(.top, 530)
                    
              
                }
                    }
//            .navigationTitle("Shopping Cart")
//            .navigationBarTitleDisplayMode(.inline)
                }
                }
    


struct Cart_Previews: PreviewProvider {
    static var previews: some View {
       AllProducts()
    }
}




