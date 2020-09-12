//
//  View+Extension.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  var id: String? {
    get {
      return self.accessibilityIdentifier
    }
    set {
      self.accessibilityIdentifier = newValue
    }
  }
  
  func view(withId id: String) -> UIView? {
    if self.id == id {
      return self
    }
    for view in self.subviews {
      if let view = view.view(withId: id) {
        return view
      }
    }
    return nil
  }
  
  func disableButtonsOnView(disable: Bool) {
    for view in self.subviews {
      if let button = view as? UIButton {
        button.isEnabled = !disable
      }else {
        view.disableButtonsOnView(disable: disable)
      }
    }
  }
  
}
