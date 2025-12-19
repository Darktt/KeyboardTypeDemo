//
//  UIKeyboardTypeExtension.swift
//
//  Created by Eden on 2021/8/27.
//
//

import UIKit

extension UIKeyboardType: @retroactive CustomStringConvertible
{
    public static
    var allTypes: Array<UIKeyboardType> {
        
        [.default, .asciiCapable, .numbersAndPunctuation, .URL, .numberPad, .phonePad, .namePhonePad, .emailAddress, .decimalPad, .twitter, .webSearch, .asciiCapableNumberPad]
    }
    
    public
    var description: String {
        
        var description: String
        
        switch self {
                
            case .default:
                description = "default"
                
            case .asciiCapable:
                description = "asciiCapable"
                
            case .numbersAndPunctuation:
                description = "numbersAndPunctuation"
                
            case .URL:
                description = "URL"
                
            case .numberPad:
                description = "numberPad"
                
            case .phonePad:
                description = "phonePad"
                
            case .namePhonePad:
                description = "namePhonePad"
                
            case .emailAddress:
                description = "emailAddress"
                
            case .decimalPad:
                description = "decimalPad"
                
            case .twitter:
                description = "twitter"
                
            case .webSearch:
                description = "webSearch"
                
            case .asciiCapableNumberPad:
                description = "asciiCapableNumberPad"
                
            @unknown default:
                description = ""
        }
        
        return description
    }
}

extension UIKeyboardType: @retroactive Identifiable
{
    public var id: Int {
        
        self.rawValue
    }
}
