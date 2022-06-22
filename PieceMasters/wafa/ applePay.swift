//
//   applePay.swift
//  PieceMasters
//
//  Created by wafa ali on 22/11/1443 AH.
//

import SwiftUI
import iPaymentButton

struct _applePay: View {
    var body: some View {
        iPaymentButton{
            
//            payment code
            iPaymentButton.applePayDemo()
        }.cornerRadius(10)
            .padding()
    }
}

struct _applePay_Previews: PreviewProvider {
    static var previews: some View {
        _applePay()
    }
}
