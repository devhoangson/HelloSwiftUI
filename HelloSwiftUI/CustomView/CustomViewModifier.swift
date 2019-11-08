//
//  CustomViewModifier.swift
//  HelloSwiftUI
//
//  Created by son5c on 11/6/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomViewModifier: View {
    @State private var isPresented: Bool = false
    
    private func showAlert() {}
    
    private func requestData() {
        print("INIT DATA")
    }
    
    var body: some View  {
        HStack(alignment: .center, spacing: 20) {
            Button(action: {
                self.isPresented = true
            }, label: {
                return Text("HELLO")
                    .modifier(CustomButtonViewModifier(.red))
            })
            .alert(isPresented: self.$isPresented, content: {
               return Alert(title: Text("Hello"),
                            message: Text("My name's Son"),
                            dismissButton: .default(Text("OK")))
            })
            Button(action: {
                         
            }, label: {
                return Text("HOANG")
                    .modifier(CustomButtonViewModifier(.blue))
            })
            
            Button(action: {
                         
            }, label: {
                return Text("SON")
                     .modifier(CustomButtonViewModifier(.yellow))
            })
        }
        .onAppear(perform: {
            self.requestData()
        })
        .onDisappear(perform: {
            print("REMOVED DATA")
        })
    }
}

struct CustomViewModifier_Preview: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}

struct CustomButtonViewModifier: ViewModifier {
    private(set) var backgroundColor: Color = .red
    
    init(_ color: Color) {
        self.backgroundColor = color
    }
    
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 16))
            .padding(10)
            .foregroundColor(.white)
            .background(self.backgroundColor)
            .cornerRadius(5)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 0, y: 0)
    }
}

struct CustomAlertViewModifier: ViewModifier {
    @State var isPresented: Bool = false
    
    func body(content: Content) -> some View {
        return content.alert(isPresented: self.$isPresented, content: {
             Alert(title: Text("Hello"),
                                    message: Text("My name's Son"),
                                    dismissButton: .default(Text("OK")))
        })
    }
}
