//
//  UITextField+Extension.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
  
  func getText() -> String {
    if let text = self.text {
      return text
    }
    return ""
  }
  
  func setBottomBorder() {
    borderStyle = .none
    layer.backgroundColor = UIColor.white.cgColor
    
    layer.masksToBounds = false
    
    layer.shadowColor = UIColor.green.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    layer.shadowOpacity = 1.0
    layer.shadowRadius = 0.0
  }
  
  @IBInspectable var doneAccessory: Bool{
    get{
      return self.doneAccessory
    }
    set (hasDone) {
      if hasDone{
        addDoneButtonOnKeyboard()
      }
    }
  }
  
  func addDoneButtonOnKeyboard()
  {
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    doneToolbar.barStyle = .default
    
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
    
    let items = [flexSpace, done]
    doneToolbar.items = items
    doneToolbar.sizeToFit()
    
    self.inputAccessoryView = doneToolbar
  }
  
  @objc func doneButtonAction()
  {
    self.resignFirstResponder()
  }
  
}
