//

//  ContentView.swift

//  map-swift

//

//  Created by Anwar Al nasi on 01/11/1443 AH.

//

import MapKit

import SwiftUI


struct map: View {



    var PrimaryColor : Color = (Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))



   @StateObject private var viewModel = ContentViewModel()





   var body: some View {

       NavigationView{

      


           VStack{

              // ZStack{



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

       .font(.system(size: 15))

       .foregroundColor(Color(red: 0.22745098039215686, green:
0.25882352941176473, blue: 0.4627450980392157))

       .frame(width: 110)

       .position(x: 60, y:-15 )

   }

 VStack{

     Circle()

     .foregroundColor(Color(red: 0.886, green: 0.886, blue: 0.886))

     .frame(width:20 , height: 20 )

    .position(x: 9, y:15)



 }

 }



//.position(x: 190, y: 250)

.padding()

       Map(coordinateRegion:$viewModel.region,showsUserLocation: true)

           .accentColor(Color(.systemBlue))

           .onAppear{

           viewModel.checkifuserlocationisenabled()



           }



           .frame(width: 390, height: 400)

//           .navigationTitle("Checkout")
//
//           .navigationBarTitleDisplayMode(.inline)



//            .padding (.top)






           VStack {



               VStack {



                   ZStack{

                   RoundedRectangle(cornerRadius: 20)

                              .inset(by: 10)

                              .stroke(Color.black, lineWidth: 0.5)

                              .frame(width: 360, height: 80)

                   HStack{

                Image ("map")

              Text("2821 al azhari, 6290, An Nuzhah, Riyadh12471,Saudi Arabia")

                        .fontWeight(.light)

                           .font(.system(size: 10))

                           .padding (.trailing, 10)

                       }

                   }

                   .padding(.bottom , 9)





               }

               NavigationLink(destination: paymentPage()
                              
               ) {          Text("Procced  To Checkout").fontWeight(.bold)
                   
                       .frame(width: 340, height: 65)



                       .background(Color(red:0.22, green:0.26, blue: 0.478))

                                   .foregroundColor(Color.white)

                                   .cornerRadius(10)
               }


               .padding(.bottom , 90)

           }

       }



                       .navigationBarTitleDisplayMode(.large)
                       .navigationBarItems(
                        leading:
                            
                               Button(action: {
                                   print("Button Pressed")
                               })
                        

                        
                        {
                            NavigationLink(destination: Cart(Product: product( id: "11", title: "cuup", Description: "Double wall paper cups are made from two-layer cardboard. These cups are perfect for using with cold or hot drinks.The double wall paper cups fit especially well for serving hot beverages. ", image: "Cup1", amount: "PAPER CUP",  price: 90, offer: 1, isSelected: false))
                            ){
                                
                                
                            HStack{
                             
                            Image(systemName: "chevron.backward")
                                Text("Back")
                                
                            }.foregroundColor(PrimaryColor).font(Font.body.bold())
                           }
                                           }
                       )


     



               }


           }






struct ContentView_Previews: PreviewProvider {

   static var previews: some View {

       map()



   }

}

final class ContentViewModel: NSObject, ObservableObject,
CLLocationManagerDelegate{

   @Published var region = MKCoordinateRegion (center:
CLLocationCoordinate2D(latitude: 24.8613, longitude: 46.7255), span:
MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))


   var locationManager : CLLocationManager?



   func checkifuserlocationisenabled(){

       if CLLocationManager.locationServicesEnabled(){

           locationManager = CLLocationManager()

           locationManager!.delegate = self

       }else{

           print ("please enable your location")





       }

}

  private func checklocationauthorization(){

       guard let locationManager = locationManager else {return}



       switch locationManager.authorizationStatus {



       case .notDetermined:

           locationManager.requestWhenInUseAuthorization()

       case .restricted :

           print ("your location is restricted.")

       case .denied:

           print ("your location is denied.")

       case .authorizedAlways,.authorizedWhenInUse:

           guard let location = locationManager.location else {

               print("No value ")

               return

           }

           region = MKCoordinateRegion(center:location.coordinate,

                                       span:
MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

           @unknown default:

           break







       }

       }


   func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

       checklocationauthorization()

   }


   }


}
