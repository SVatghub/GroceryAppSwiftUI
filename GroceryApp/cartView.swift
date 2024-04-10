//
//  cartView.swift
//  GroceryApp
//
//  Created by Sahil on 08/04/24.
//

import SwiftUI

struct cartView: View {
    @State var totalPrice: Double = 0.00
    var body: some View {
        VStack{
            Text("My Cart")
                .font(.system(size: 44, weight: .semibold,design: .rounded))
                .frame(width: 320,alignment: .leading)
            List{
                ForEach(0..<cartItems.count,id: \.self){
                    item in
                    HStack{
                        Image(cartItems[item][0] as! String)
                            .resizable()
                            .frame(width: 40,height: 40)
                        
                        VStack{
                            Text(cartItems[item][1] as! String)
                            Text( "$\(String(format:"%.2f",cartItems[item][3] as! Double))"
                            )
                            .foregroundColor(.gray)
                        }
                    }
                    
                }
                .onDelete{
                    index in cartItems.remove(atOffsets: index)
                    calculateTotalPrice()
                }
            }
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.green)
                    .opacity(0.8)
                    .frame(width: 350,height: 120)
                
                VStack{
                    Text("Total Price")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(width: 350,alignment: .leading)
                        .padding(.leading,60)
                    
                    Text("$\(String(format:"%.2f",totalPrice))")
                        .foregroundColor(.white)
                        .font(.system(size: 26,weight: .bold))
                        .frame(width: 350,alignment: .leading)
                        .padding(.leading,60)
                }
                
                Button{
                    //todo
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white,lineWidth: 2)
                            .frame(width: 120,height: 50)
                        
                        Text("Pay Now >")
                            .foregroundColor(.white)
                    }.offset(x:80)
                }
            }
        }.onAppear(perform: {
            calculateTotalPrice()
        })
    }
    func calculateTotalPrice(){
        var price : Double = 0.00
        for i in 0..<cartItems.count{
            price += cartItems[i][3] as! Double
        }
        totalPrice = price
    }
}

#Preview {
    cartView()
}
