//
//  navig.swift
//  profile1
//
//  Created by EMAN MOHAMMED on 20/06/2022.
//



import SwiftUI

struct navig: View {
    @State private var showAlert = false
    var PrimaryColor : Color = (Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
    var body: some View {
        
        
        
        
        
        
        
        
        
        ZStack{
            
        }
        
        .navigationBarTitle(Text("Design"), displayMode: .inline)
        .background(Color.red)
        .navigationBarItems(leading:
                                
                                HStack {
            Button(action: {
                // Actions
            }, label: {Image(systemName: "chevron.backward").foregroundColor(PrimaryColor).font(Font.body.bold())})
            
            Button(action: {}, label: {Text("Back").foregroundColor(PrimaryColor).position(x: 8, y: 12)})
        },
                            
                            trailing: VStack {
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
            }
            
        })
    }
    
    
    
    
    
}


struct navig_Previews: PreviewProvider {
    static var previews: some View {
        navig()
    }
}
