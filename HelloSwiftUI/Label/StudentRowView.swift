//
//  StudentRowView.swift
//  HelloSwiftUI
//
//  Created by son5c on 11/4/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI

struct StudentRowView: View {
    private(set) var userName: String!
    
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                Text(self.userName)
                    .foregroundColor(.red)
                Spacer()
                Text(self.userName)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .underline()
                Spacer()
            }
            
            Text("HELLO")
                .foregroundColor(.blue)
                .font(.title)
        }
    }
}

struct StudentRowView_Preview: PreviewProvider {
    static var previews: some View {
        StudentRowView(userName: "HOANG SON")
    }
}
