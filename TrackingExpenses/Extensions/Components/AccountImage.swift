//
//  AccountImage.swift
//  TrackingExpenses
//
//  Created by Влад on 10/25/23.
//

import SwiftUI

struct AccountImage: View {
    var body: some View {
        Image("sticker")
            .resizable()
            .frame(width: 140, height: 140)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 8)
    }
}

struct AccountImage_Previews: PreviewProvider {
    static var previews: some View {
        AccountImage()
    }
}
