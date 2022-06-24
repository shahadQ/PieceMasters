//
//  boxProductDetails.swift
//  PieceMasters
//
//  Created by Shahad on 24/11/1443 AH.
//

import SwiftUI

struct boxProductDetails: View {
var Product:Product
    var body: some View {
        VStack{
            Text(Product.title)
            Image(Product.image)
        }
    }
}

struct boxProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        AllProducts()
    }
}
