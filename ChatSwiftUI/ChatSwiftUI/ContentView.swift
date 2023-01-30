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
                ScrollView {
                    ForEach(messagerManger.messages, id: \.id) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            MessageField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
