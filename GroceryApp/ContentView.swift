//
//  ContentView.swift
//  GroceryApp
//
//  Created by Sahil on 08/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeScreen = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 50){
                Image("avocado")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
            
                Text("We deliver \ngrocery at your \ndoorstep")
                    .font(.system(size: 42,weight: .bold,design: .rounded))
                    .multilineTextAlignment(.center)
                
                Text("Grocerr gives you fresh vegetables and fruits,\nOrder fresh at grocerr")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                Button{
                    changeScreen = true
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                        Text("Get Started")
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 200,height: 70)
            }
            .navigationDestination(isPresented: $changeScreen){
                shopView()
            }
        }
    }
}

#Preview {
    ContentView()
}
