//
//  ContentView.swift
//  ChatSwiftUI
//
//  Created by Anton Zyabkin on 29.01.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagerManger = MessagerManger()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagerManger.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagerManger.lastMessage) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                            
                        }
                    }
                }
            }
            .background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagerManger)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
