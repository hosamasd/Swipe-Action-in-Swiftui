//
//  CardView.swift
//  Swipe Action in Swiftui
//
//  Created by Hossam on 11/30/20.
//

import SwiftUI

struct CardView: View {
    
    var item : Item = Item(title: "Wodden Stool", price: "$35.00", subTitle: "Amazing Stylish in multiple Most selling item of this.", image: "stool")
    
    var body: some View {
        
        HStack{
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3.2)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(item.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(item.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
