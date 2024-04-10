//
//  shopView.swift
//  GroceryApp
//
//  Created by Sahil on 08/04/24.
//

import SwiftUI

struct shopView: View {
    
    @State private var goToCart = false
    var coloum = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var items : [[Any]] = shopItems
    
    var body: some View {
        VStack(spacing: 5){
            VStack(){
                Text("Good morning")
                    .foregroundColor(.gray)
                    .frame(width: 320,alignment: .leading)
                
                Text("Let's order fresh\nitems for you")
                    .font(.system(size: 38,weight: .semibold,design: .rounded))
                    .frame(width: 320,alignment: .leading)
                
                Spacer().frame(height: 75)
                Text("Fresh items")
                    .foregroundColor(.gray)
                    .frame(width: 320,alignment: .leading)
            }
            .padding(20)
            
            ScrollView{
                LazyVGrid(columns: coloum,spacing: 30){
                    
                    ForEach(0..<items.count,id: \.self){
                        item in cardView(imageName: items[item][0] as! String, title: items[item][1] as! String, color: items[item][2] as! Color, price: items[item][3] as! Double, selfIndex: item)
                    }
                }
            }
            .padding(15)
        }
        .navigationDestination(isPresented: $goToCart){
            cartView()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    goToCart = true
                }label: {
                    Image(systemName: "cart")
                }
            }
        }
    }
}

#Preview {
    shopView()
}
