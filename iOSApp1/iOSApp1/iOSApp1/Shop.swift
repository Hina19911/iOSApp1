//
//  Shop.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-01-23.
//

import SwiftUI

struct ShopItem: View {
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.red)
                .opacity(0.25)
                .frame(width:170,height:230)
               
            VStack{
                Image("coffee_cup")
                    .resizable()
                    .frame(width: 80,height: 80)
                Text("Coffee")
                    .font(.headline)
                    .foregroundColor(.black)
                Button(){
                }label: {
                    Text("$2.00")
                        .foregroundColor(.black)
                        .frame(width:100,height:30)
                        .background(Color.white)
                    
                }
            }
        }
    }}
    
    struct ShopItem_Previews: PreviewProvider {
        static var previews: some View {
            ShopItem()
        }
    }

