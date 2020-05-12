//
//  UIImage.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

extension UIImage {
    func rotateImage() -> UIImage? {
        if (self.imageOrientation == UIImage.Orientation.up ) {
            return self
        }
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))
        let copy = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return copy
    }

}
