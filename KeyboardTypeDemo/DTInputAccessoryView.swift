//
//  DTInputAccessoryView.swift
//
//  Created by Eden on 2021/8/27.
//

import UIKit

public class DTInputAccessoryView: UIView
{
    // MARK: - Properties -
    
    public var doneActionHandler: (() -> Void)?
    
    @IBOutlet fileprivate weak var doneItem: UIBarButtonItem!
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.doneItem.target = self
        self.doneItem.action = #selector(self.doneAction(_:))
    }
    
    deinit
    {
        
    }
}

private extension DTInputAccessoryView
{
    @objc
    func doneAction(_ sender: UIBarButtonItem)
    {
        self.doneActionHandler?()
    }
}
