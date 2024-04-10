//
//  cardView.swift
//  GroceryApp
//
//  Created by Sahil on 08/04/24.
//

import SwiftUI

struct cardView: View {
    var imageName : String
    var title : String
    var color : Color
    var price : Double
    var selfIndex: Int
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .opacity(0.25)
                .frame(width: 170,height: 230)
            VStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 80,height: 80)
                Text(title)
                Button{
                    cartItems.append(shopItems[selfIndex])
                }label: {
                    Text("$\(String(format:"%.2f",price))")
                        .frame(width: 100,height: 40)
                        .foregroundColor(.white)
                        .background(color)
                }
            }
        }
    }
}

#Preview {
    cardView(imageName: "avocado", title: "Avocado", color: Color.green, price: 4.00,selfIndex: 0)
}
