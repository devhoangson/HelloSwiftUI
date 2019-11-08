//
//  MessageViewModel.swift
//  HelloSwiftUI
//
//  Created by son5c on 11/4/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol MessageViewContract  {
    func sendingMessage()
    func refreshMessages(completion: @escaping () -> ())
}

class MessageViewModel: ObservableObject {
    @Published fileprivate(set) var text: String = "HELLO"
    @Published fileprivate(set) var dataSources: [Message] = [
        Message(text: "HOANG SON"),
        Message(text: "HOANG NHU Y"),
        Message(text: "NGUYEN THI LEN"),
        Message(text: "HOANG GIANG")
    ]
}

extension MessageViewModel: MessageViewContract {
    func sendingMessage() {
        self.text = ("HELLO SWIFT MVVM...")
    }
    
    func refreshMessages(completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.dataSources = [
                self.dataSources.randomElement()!,
                self.dataSources.randomElement()!
            ]
            completion()
        }
    }
}
