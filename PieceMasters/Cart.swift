
import SwiftUI
import Kingfisher
struct Cart: View {
   // var Product:product
    @EnvironmentObject var viewModel: AuthViewModel
    var SecondaryColor: Color = (Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
    var body: some View {
      
       // NavigationView{
            ZStack {
                Cart3D()
                // product detailes
                
                VStack{
                    ForEach(ViewModel.shared.cartItems){ item in
                HStack (spacing: 20){
                 
                    ZStack{
                        KFImage(URL(string:item.products.image))
                            .resizable()
                            .frame(width: 80, height: 86.56)
                         
                  //  Image(Product.image)
                     //   .resizable()
                    }.padding(.leading ,20)
                    VStack(alignment: .leading){
                        Text(item.products.title)
                            .bold()
                        Text(item.products.amount)
                           .font(.system(size:13))
                         
                            .foregroundColor(Color.gray)
                        Text("149.50 SR")
                       // Text("\(Product.price) SR")
                            .bold()
                    }.frame(width: 100, height: 20)
                    }.padding(.top ,-130)

                .padding(.top,-230)
                .padding(.trailing,200)
                    }
                Divider()
                    .padding(.horizontal)
                    .padding(.top,-260)
                VStack{
                    Text("Payment Summary")
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        .padding(.top,-240)
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
                        
                        Text("149.50 SR")
                       // Text("\(Product.price) SR")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        Text("- 0.0")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        Text("-0.0")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                        Text("Free")
                            .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                    }
                }
                .padding(.top, -220)
                    
                    
                    
                }
              
                Divider()
                    .padding(.horizontal)
                    .padding(.top,-70)
                VStack{
                HStack( spacing:245){
                    Text("Total")
                        .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                    Text("149.50 SR")
                   // Text("\(Product.price) SR")
                        .foregroundColor(Color(red: 0.034, green: 0.06, blue: 0.279))
                    
                }
                    
                   .padding(.top,-70)
//                .padding(.top, 220)
                }
                }
                .padding(.top,100)
              
                    VStack{
                        
                        NavigationLink {
                            
                            if viewModel.isAouthenticatting {
                                map()
                            }
                            else {
                                LoginView()
                            }
                        } label: {
                            Text("Proceed to checkout")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                //.padding(.horizontal, 100)
                                    .frame(width: 328 , height: 63 )
                                    .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
                                
                                    .cornerRadius(10.0)
                          
                        }


                        NavigationLink(destination: MainPackaging()
                                       
                        ) {    Text("Continue shopping ")
                            
                                .foregroundColor(SecondaryColor)
                                .fontWeight(.bold)
                                .padding(.vertical)
                           
                                .frame(width: 328 , height: 63 )
                            
                                .background(.white)
                            
//                                .border(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1 )
                                            .foregroundColor(SecondaryColor)
                                )
                             
                        }
                    }
                    .padding(.top,350)

                }
            .navigationBarBackButtonHidden(true)
                }
                   // }

                }
    
    


struct Cart_Previews: PreviewProvider {
    static var previews: some View {
       Cart()
            .environmentObject(AuthViewModel())
    }
}
