//
//  ContentView.swift
//  swiftui-drage
//
//  Created by andyhaz on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var postion:CGSize = .zero
    @State private var lastPostion: CGSize = .zero
    
    var body: some View {
        ZStack{
            Text("Drag area")
                .frame(width: 300, height: 200)
                .border(Color.blue)
            
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .size(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
               // .frame(width: 100, height: 100)
                .offset(postion)
                .foregroundColor(.gray)
                .offset(
                        x: lastPostion.width,
                        y: lastPostion.height
                    )
                    // Moved gesture to the parent view
                .gesture(dragGesture)
        }
        
    }
//
    var dragGesture: some Gesture {
            DragGesture()
                .onChanged { value in
                    postion = value.translation
                }
                .onEnded { value in
                    lastPostion.width += value.translation.width
                    lastPostion.height += value.translation.height
                    postion = .zero
                }
        }
}

#Preview {
    ContentView()
}
