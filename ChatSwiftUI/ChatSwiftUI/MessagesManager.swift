//
//  MessagesManager.swift
//  ChatSwiftUI
//
//  Created by Anton Zyabkin on 30.01.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class MessagerManger: ObservableObject {
    @Published private(set) var  messages: [Message] = []
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetch documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp }
        }
    }
    
    func sendMessage(text: String) {
        
    }
}
