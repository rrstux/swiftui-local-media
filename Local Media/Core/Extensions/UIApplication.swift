//
//  UIApplication.swift
//  Local Media
//
//  Created by Robert Sandru on 5/14/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
