//
//  ViewController.swift
//  KeyboardTypeDemo
//
//  Created by Eden on 2021/8/27.
//

import UIKit

public class ViewController: UIViewController
{
    @IBOutlet fileprivate var accessoryView: DTInputAccessoryView!
    
    @IBOutlet fileprivate weak var textField: UITextField!
    
    @IBOutlet fileprivate weak var pickerView: UIPickerView!
    
    private var currentKeyboardType: UIKeyboardType = .default {
        
        willSet {
            
            self.textField.resignFirstResponder()
            self.textField.keyboardType = newValue
            self.textField.becomeFirstResponder()
        }
    }
    
    private let keyboardStyles: Array<UIKeyboardType> = [.default, .asciiCapable, .numbersAndPunctuation, .URL, .numberPad, .phonePad, .namePhonePad, .emailAddress, .decimalPad, .twitter, .webSearch, .asciiCapableNumberPad]
    
    // MARK: View Live Cycle
    
    public override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.textField.becomeFirstResponder()
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
    }
    
    public override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
    }
    
    public override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
    }
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.textField.inputAccessoryView = self.accessoryView
        self.textField.keyboardType = self.currentKeyboardType
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        self.accessoryView.doneActionHandler = {
            
            self.textField.resignFirstResponder()
        }
    }
    
    deinit
    {
        
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate
{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        self.keyboardStyles.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        self.keyboardStyles[row].description
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let keyboardType: UIKeyboardType = self.keyboardStyles[row]
        
        self.currentKeyboardType = keyboardType
    }
}
