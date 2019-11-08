//
//  MessageModel.swift
//  HelloSwiftUI
//
//  Created by son5c on 11/4/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation
import Combine

struct Message  {
    private(set) var text: String! = ""
    
    init(text: String) {
        self.text = text
    }
}
