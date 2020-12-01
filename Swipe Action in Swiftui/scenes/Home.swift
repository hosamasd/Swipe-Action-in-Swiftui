//
//  Home.swift
//  Swipe Action in Swiftui
//
//  Created by Hossam on 11/30/20.
//

import SwiftUI

struct Home: View {
    
    @State var size = "Medium"
    @State var currentTab = "All"
    
    @State var items = [
        
        Item(title: "Stylish Table Lamp", price: "$20.00", subTitle: "We have amazing quality Lamp wide range.", image: "lamp"),
        Item(title: "Modern Chair", price: "$60.00", subTitle: "New style of tables for your home and office.", image: "chair"),
        Item(title: "Wodden Stool", price: "$35.00", subTitle: "Amazing Stylish in multiple Most selling item of this.", image: "stool"),
    ]
    
    @GestureState var isDragging = false
    @State var changeSwipeOrientation:Bool = true
    // adding cart items...
    
    @State var cart : [Item] = []
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Button(action: {self.changeSwipeOrientation.toggle()}) {
                    
                    Image(systemName: changeSwipeOrientation ? "arrow.uturn.left.circle" : "arrow.uturn.forward.circle")
                        .font(.title)
                        .foregroundColor(.black)
                        
                }
                
                Spacer()
                
                Button(action: {}) {
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .overlay(
                    
                    // Cart Count....
                    Text("\(cart.count)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 20, height: 20)
                        .background(Color("tab"))
                        .clipShape(Circle())
                        .offset(x: 15, y: -22)
                        // disbling if no items...
                        .opacity(cart.isEmpty ? 0 : 1)
                )
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom,10)
            
            ScrollView{
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Furniture in \nUnique Style")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .lineLimit(3)
                            
                            Text("WE have wide range of furnitures")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                        }
                        
                        // Menu Button...
                        
                        Menu(content: {
                            
                            Button(action: {size = "Small"}) {
                                
                                Text("Small")
                            }
                            
                            Button(action: {size = "Medium"}) {
                                
                                Text("Medium")
                            }
                            
                            Button(action: {size = "Large"}) {
                                
                                Text("Large")
                            }
                            
                        }) {
                            
                            Label(title: {
                                Text(size)
                                    .foregroundColor(.white)
                            }) {
                                
                                Image(systemName: "slider.vertical.3")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical,20)
                            .padding(.horizontal,10)
                            .background(Color.black)
                            .clipShape(Capsule())
                        }
                    }
                    .padding()
                    
                    HStack(spacing: 0){
                        
                        ForEach(tabs,id: \.self){tab in
                            
                            Button(action: {currentTab = tab}) {
                                
                                Text(tab)
                                    .fontWeight(.bold)
                                    .foregroundColor(currentTab == tab ? .black : .gray)
                            }
                            
                            if tab != tabs.last{
                                Spacer(minLength: 0)
                            }
                        }
                    }
                    .padding()
                    
                    ForEach(items.indices){index in
                        
                        //if changeSwipeOrientation = flase then right
                        //if changeSwipeOrientation = true then left
                        
                        
                        OrderOrientation(cart: $cart, items: $items, index: index, isDragging: isDragging, leftOrRight: $changeSwipeOrientation)
                            
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    
                    
                }
                .padding(.bottom,100)
            }
            
            Spacer()
            
        }
        
        
    }
    
}

var tabs = ["Tables","Chairs","Lamps","All"]



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
