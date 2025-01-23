//
//  ContentView.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-01-23.
//

import SwiftUI

struct ContentView: View {
    @State var changeScreen = false
    var body: some View {
        NavigationStack {
            VStack(spacing:50) {
                Image("tim_horton")
                    .resizable()
                    .scaleEffect()
                    .frame(width: 300, height: 300)
                Text("Welcome\n  to Tim Hortons")
                    .font(.system(size: 42,weight:.bold,design: .rounded))
                    .multilineTextAlignment(.center)
                Button(){
                    changeScreen = true
                }label: {
                    ZStack{ RoundedRectangle(cornerRadius: 50)
                        Text("get started")
                            .font(.system(size: 30,weight:.bold,design: .rounded))
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width:200, height:80)
                    .foregroundColor(.gray)
            }
            .navigationDestination(isPresented:$changeScreen){
                OrderMenuView()
            }
        }
    }}
    //content preview should be outside the content view struct ..
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

