//
//  ContentView.swift
//  KeyboardTypeDemo
//
//  Created by Eden on 2021/8/27.
//

import SwiftUI

import SwiftUI

struct ContentView: View
{
    @State
    private 
    var inputText: String = ""
    
    @FocusState
    private
    var isFouced: Bool
    
    @State
    private
    var keyboardStyle: UIKeyboardType = .default
    
    private let keyboardStyles: Array<UIKeyboardType> = UIKeyboardType.allTypes
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer(minLength: 15.0)
                
                TextField("", text: self.$inputText)
                    .focused(self.$isFouced)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(self.$keyboardStyle.wrappedValue)
                
                Spacer(minLength: 15.0)
                
                Button("Hide Keyboard") {
                    
                    self.isFouced = false
                }
                    .buttonStyle(DefaultButtonStyle())
                    .padding([.top, .bottom], 7.0)
                    .padding([.leading, .trailing], 10.0)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 5.0).foregroundColor(Color.blue))
                    .clipped()
                
                Spacer(minLength: 15.0)
            }
            
            Picker(selection: self.$keyboardStyle, label: Text("Keyboard Style"), content: {
                
                ForEach(self.keyboardStyles) {
                    
                    Text($0.description).tag($0)
                }
            })
            .onChange(of: self.keyboardStyle) {
                
                _, _ in
                
                self.isFouced = false
                self.isFouced = true
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

