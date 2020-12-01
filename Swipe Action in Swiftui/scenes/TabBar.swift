//
//  TabBar.swift
//  Swipe Action in Swiftui
//
//  Created by Hossam on 11/30/20.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "Home"
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
            
            TabView (selection: $current) {
                
                Home()
                    .tag("Home")
                
                Text("Messages")
                    .tag("Messages")
                
                Text("Account")
                    .tag("Account")
                
            }
            
            HStack(spacing:15) {
                
                //tabbutton
                TabButton(title: "Home", image: "home", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Messages", image: "messenger", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Account", image: "user", selected: $current)
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(Color("tab"))
            .clipShape(Capsule())
            .padding(.horizontal,25)
            
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
