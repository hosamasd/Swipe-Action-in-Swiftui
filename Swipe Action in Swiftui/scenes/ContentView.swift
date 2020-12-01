//
//  ContentView.swift
//  Swipe Action in Swiftui
//
//  Created by Hossam on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    
    // hiding tab bar...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
