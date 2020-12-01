//
//  OrderOrientation.swift
//  Swipe Action in Swiftui
//
//  Created by Hossam on 12/1/20.
//

import SwiftUI

struct OrderOrientation: View {
   
    @Binding var cart : [Item]
    @Binding var items:[Item]
    var index:Int
    @GestureState var isDragging = false
    @Binding var leftOrRight:Bool
    var isShown = false
    
    
    var body: some View {
        
        ZStack{
            
            if leftOrRight {
                
                Color("tab")
                    .cornerRadius(20)
                
                Color("Color")
                    .cornerRadius(20)
                    .padding(.trailing,65)
                
                // Button...
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "suit.heart")
                            .font(.title)
                            .foregroundColor(.white)
                            // default frame...
                            .frame(width: 65)
                    }
                    
                    Button(action: {
                        addCart(index: index)
                    }) {
                        
                        // changing cart image..
                        Image(systemName: checkCart(index: index) ? "cart.badge.minus" :  "cart.badge.plus")
                            .font(.title)
                            .foregroundColor(.white)
                            // default frame...
                            .frame(width: 65)
                    }
                }
                
                CardView(item: items[index])
                    // drag gesture....
                    .offset(x: items[index].offset)
                    .gesture(
                        DragGesture()
                            .updating($isDragging, body: { (value, state, _) in
                                
                                // so we can validate for correct drag..
                                state = true
                                onChanged(value: value, index: index)
                            }).onEnded({ (value) in
                                onEnd(value: value, index: index)
                            }))
                
            }else {
                
                
                
                Color("tab")
                    .cornerRadius(20)
                
                Color("Color")
                    .cornerRadius(20)
                    .padding(.leading,65)
                
                // Button...
                
                HStack{
                    
                    Button(action: {
                        addCart(index: index)
                    }) {
                        
                        // changing cart image..
                        Image(systemName: checkCart(index: index) ? "cart.badge.minus" :  "cart.badge.plus")
                            .font(.title)
                            .foregroundColor(.white)
                            // default frame...
                            .frame(width: 65)
                    }
                    
                    Button(action: {}) {
                        
                        Image(systemName: "suit.heart")
                            .font(.title)
                            .foregroundColor(.white)
                            // default frame...
                            .frame(width: 65)
                    }
                    
                    
                    Spacer()
                }
                
                CardView(item: items[index])
                    // drag gesture....
                    .offset(x: items[index].offset)
                    .gesture(
                        DragGesture()
                            .updating($isDragging, body: { (value, state, _) in
                                
                                // so we can validate for correct drag..
                                state = true
                                onChanged(value: value, index: index)
                            }).onEnded({ (value) in
                                onEnd(value: value, index: index)
                            }))
                //            .opacity(isShown ? 1 : 0)
                
                
            }
        }
        
        
    }
    
    func onChanged(value: DragGesture.Value,index: Int){
        print(isDragging)
        print(value.translation.width)
        if !leftOrRight {
            
            if value.translation.width > 0 && isDragging{
                
                items[index].offset = value.translation.width
                //                self.isShown.toggle()
            }
        }else {
            
            if value.translation.width < 0 && isDragging{
                
                items[index].offset = value.translation.width
            }
            
        }
    }
    
    // onEnd is not working properly...
    // may be its bug...
    // to avoid this we using update property on Drag Gesture...
    func onEnd(value: DragGesture.Value,index: Int){
        
        if !leftOrRight {
            
            withAnimation{
                
                // 65 + 65 = 130....
                if value.translation.width >= 100{
                    
                    items[index].offset = 130
                }
                else{
                    
                    
                    items[index].offset = 0
                }
            }
            
        }else {
            
            withAnimation{
                
                // 65 + 65 = 130....
                if -value.translation.width >= 100{
                    
                    items[index].offset = -130
                }
                else{
                    
                    
                    items[index].offset = 0
                }
            }
        }
    }
    
    // checking cart and adding item...
    
    func checkCart(index: Int)-> Bool{
        
        return cart.contains { (item) -> Bool in
            
            return item.id == items[index].id
        }
    }
    
    func addCart(index: Int){
        
        if checkCart(index: index){
            
            cart.removeAll { (item) -> Bool in
                return item.id == items[index].id
            }
        }
        else{
            
            cart.append(items[index])
        }
        
        // closing after added...
        withAnimation{
            
            items[index].offset = 0
        }
    }
    
}
