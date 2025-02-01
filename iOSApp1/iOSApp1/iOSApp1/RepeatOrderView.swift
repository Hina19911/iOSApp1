//
//  RepeatOrderView.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-02-01.
//

import SwiftUI

struct RepeatOrderView: View {
    let lastOrder: String  // Receive last order as input

    var body: some View {
        VStack {
            Text("Your Last Order")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text(lastOrder)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding()
        .navigationTitle("Repeat Order")
    }
}

struct RepeatOrderView_Previews: PreviewProvider {
    static var previews: some View {
        RepeatOrderView(lastOrder: "2 x Coffee, 1 x Bagel")
    }
}
