//
//  MessageView.swift
//  HelloSwiftUI
//
//  Created by son5c on 11/4/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI

struct MessageDetailView: View {
    let message: Message!
    
    var body: some View {
        Text(self.message.text)
            .font(.largeTitle)
    }
}

struct MessageRow: View {
    let text: String!
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack {
                   Image("first")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 10)
                   VStack (alignment: .leading, spacing: 5){
                        Text(self.text)
                        Text("HELLO!")
                   }
            }
            Text("MY NAME'S \(self.text)").padding(.bottom, 10)
        }
    }
}

struct MessageView: View {
    @ObservedObject private var viewModel = MessageViewModel()
    @State private var isRequest: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if self.isRequest {
                    Text("Sending request")
                        .foregroundColor(.red)
                        .animation(.easeInOut(duration: 3))
                }
                List {
                    ForEach(self.viewModel.dataSources, id: \.text) { message in
                        NavigationLink(destination: MessageDetailView(message: message)) {
                            MessageRow(text: message.text)
                        }
                    }
                }
                Button("Refresh messages") {
                    self.isRequest = true
                    self.viewModel.refreshMessages {
                        self.isRequest = false
                    }
                }.padding(.top, 20)
                .navigationBarTitle("Family")
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
