//
//  TitleRoww.swift
//  ChatSwiftUI
//
//  Created by Anton Zyabkin on 29.01.2023.
//

import SwiftUI

struct TitleRow: View {
    var imageURl = URL(string: "https://images.unsplash.com/photo-1578489758854-f134a358f08b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
    var name = "Sarah James"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageURl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                Text("Onlain")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
                
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleRow()
                .background(Color("Peach"))
        }
    }
}
