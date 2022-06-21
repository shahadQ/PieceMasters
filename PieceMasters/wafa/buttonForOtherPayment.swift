//
//  buttonForOtherPayment.swift
//  PieceMasters
//
//  Created by wafa ali on 22/11/1443 AH.
//

import SwiftUI

struct buttonForOtherPayment: View {
    var body: some View {
        Button(action: { }) {
            Text("Complete order ")
                .foregroundColor(Color.white)
        }
        .frame(width: 289, height: 50)
        .background(Color(red: 0.225, green: 0.26, blue: 0.461))
        .cornerRadius(10)
    }
}

struct buttonForOtherPayment_Previews: PreviewProvider {
    static var previews: some View {
        buttonForOtherPayment()
    }
}
