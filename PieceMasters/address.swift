import SwiftUI


struct address: View {

   var body: some View {

       //struct address: View {

          //@StateObject private var viewModel = ContentViewModel()



           //var body: some View {

       NavigationView{





           VStack{





HStack(spacing: -40) {

   VStack{

     Text("Shipping")

       .fontWeight(.bold)

       .font(.system(size: 15))

       .foregroundColor(Color(red:0.394, green:0.81, blue: 0.74))

       .frame(width: 100)

       Circle()

     .fill(Color(red: 0.22745098039215686, green:
0.25882352941176473, blue: 0.4588235294117647))

     .frame(width:20 , height: 20 )

   }

   Rectangle()

       .foregroundColor(Color(red: 0.886, green: 0.886, blue: 0.886))

      .frame(width:100 , height: 5 )

      .padding(.top, 35.0)

   VStack{

     Text("Payment")

       .fontWeight(.bold)

       .font(.system(size: 15))

       .foregroundColor(Color(red: 0.22745098039215686, green:
0.25882352941176473, blue: 0.4627450980392157))

     .frame(width: 100)

     Circle()

           .foregroundColor(Color(red: 0.886, green: 0.886, blue: 0.886))

     .frame(width:20 , height: 20 )

   }








     Rectangle()

       .foregroundColor(Color(red: 0.886, green: 0.886, blue: 0.886))

     .frame(width:100 , height: 5 )

     .padding(.top, 35.0)

   VStack{

     Text("Confirmation")

       .fontWeight(.bold)


       .foregroundColor(Color(red: 0.22745098039215686, green:
0.25882352941176473, blue: 0.4627450980392157))

       .frame(width: 110)

       .position(x: 50, y:27)

   }

 VStack{

     Circle()

     .foregroundColor(Color(red: 0.886, green: 0.886, blue: 0.886))

     .frame(width:20 , height: 20 )

    .position(x: -10, y:19)


 }

 .position(x: 20, y: 50)

 .padding()








}










          HStack{

              VStack{

              Text( "Choose chipment Address")

                      .font(.system(size: 15))

                 .padding (.trailing, 140)

                 .padding (.top)

                  HStack{



                                   Image("plus")

                          .padding (.leading, -155)

                       Text ("Add Address").fontWeight(.light)

                           .foregroundColor(Color(red:0.394,
green:0.81, blue: 0.74))

                           .font(.system(size: 15))

                           .padding (.leading, -143)




          }






         }

             //

              .position(x:150, y: -1)

                .padding(.top , 20)




          }

          .padding()





           VStack {



               VStack {



                   ZStack{

                   RoundedRectangle(cornerRadius: 20)

                              .inset(by: 10)

                              .stroke(Color.gray, lineWidth: 0.5)

                              .frame(width: 355, height: 127)

                              .padding(.bottom , 30)

                              .padding(.bottom , -35)


                       HStack{



                           ZStack {

                               Circle()

                                   .fill(Color(red:0.394, green:0.81,
blue: 0.74))

                                   .frame(width: 13, height: 13)

                                   .position(x: 20, y: -15)


                               Circle()

                                   .stroke(.gray, lineWidth: 0.7)

                                   .frame(width: 20, height: 20)

                                   .position(x: 20, y: -15)

                                 //.padding()

                           }

                           .frame(width: 20, height: 20)



                           HStack{

                               VStack{

                           Text("Home").fontWeight(.light)

                               .font(.system(size: 13))

                               .padding (.leading, -63)

                               .position(x: 78, y:23)



                                   Text ("(205) 555-024").fontWeight(.bold)

                                   .font(.system(size: 12))

                                   .padding (.leading, -60)

                                   .position(x: 90, y:14)

                                   .foregroundColor(Color(red: 0.673,
green: 0.683, blue: 0.755))

                              Text("1786 WheelerBridge")

                                .fontWeight(.bold)

                                       .font(.system(size: 12))

                                       .padding (.leading, -25)

                                       .position(x: 90, y:7)


                                       .foregroundColor(Color(red:
0.673, green: 0.683, blue: 0.755))



                               }



                             // Spacer()

                           Image ("pin")

                                   .padding (.trailing, 17)

                                   .position(x: 130, y:20)







                           }

                           .padding(.bottom , 10)


                       }

                       .padding()



                   }




                       VStack {



                           ZStack{

                           RoundedRectangle(cornerRadius: 20)

                                      .inset(by: 10)

                                      .stroke(Color.gray, lineWidth: 0.5)

                                      .frame(width: 355, height: 127)

                                      .padding(.bottom , 40)





                               HStack{



                                       Circle()

                                           .stroke(.gray, lineWidth: 0.7)

                                           .frame(width: 20, height: 20)

                                           .position(x: 20, y: 20)

                                         .padding()









                                       HStack{

                                           VStack(alignment: .trailing) {

                                   Text("Office").fontWeight(.light)

                                                   .font(.system(size: 12))

                                                   .padding (.leading, -190)

                                                   .position(x: 70, y:40)

                                                  // .padding (.trailing, 20)

                                               Text ("(205)555-024")

                                                .fontWeight(.bold)

                                                   .font(.system(size: 13))

                                                   .padding (.leading, -210)

                                                   .position(x: 90, y:8)


.foregroundColor(Color(red: 0.673, green: 0.683, blue: 0.755))

                                                  // .padding(.leading)

                                               Text("1786 w Dallas Stunderfield")

                                                .fontWeight(.bold)

                                                   .font(.system(size: 12))

                                                   .padding (.leading, -210)

                                                   .position(x: 90, y:-23)


.foregroundColor(Color(red: 0.673, green: 0.683, blue: 0.755))



                                                   //.padding (.trailing, 240)

                                           }

                                           //Spacer()

                                   Image ("pin")

                                               .padding (.trailing, 12)

                                               .position(x: 50, y:40)












                           }

                                       .padding(.bottom , 10)

                       }



               }



                       Button {

                           print("Button pressed")

                       } label: {

                           Text("Procced  To Checkout")

                               .fontWeight(.bold)

                               .frame(width: 308, height: 65)



                               .background(Color(red:0.22,
green:0.26, blue: 0.478))

                                           .foregroundColor(Color.white)

                                           .cornerRadius(10)



                                           .padding(.bottom,70)

//                                            .padding()

                       }

                       .padding()

                   }

           }

   }

           .padding(.bottom , 30)

           //.padding()

   }



      .navigationTitle("Checkout")

      .navigationBarTitleDisplayMode(.inline)



               }



       .padding()

   }

       struct address_Previews: PreviewProvider {

           static var previews: some View {

               address()

           }



       }


}
