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
    private var inputText: String = ""

    @State
    private var keyboardStyle: UIKeyboardType = .default

    private let keyboardStyles: Array<UIKeyboardType> = [.default, .asciiCapable, .numbersAndPunctuation, .URL, .numberPad, .phonePad, .namePhonePad, .emailAddress, .decimalPad, .twitter, .webSearch, .asciiCapableNumberPad]
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer(minLength: 15.0)
                
                TextField("", text: self.$inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(self.$keyboardStyle.wrappedValue)
                
                Spacer(minLength: 15.0)
                
                Button("Hide Keyboard", action: self.hideKeyboard)
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
            .pickerStyle(MenuPickerStyle())
        }
    }
}

private extension View
{
    func hideKeyboard()
    {
        let application = UIApplication.shared
        application.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

