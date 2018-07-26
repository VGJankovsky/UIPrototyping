//
//  TextOffsetButton.swift
//  UIPrototyping
//
//  Created by vyankovskyi on 7/9/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class TextOffsetButton: UIButton {

    override var titleEdgeInsets: UIEdgeInsets {
        get {
            var insets = super.titleEdgeInsets
            insets.left += 10
            return insets
        }
        set {
            super.titleEdgeInsets = titleEdgeInsets
        }
    }
    
    override var imageEdgeInsets: UIEdgeInsets {
        get {
            var insets = super.imageEdgeInsets
            insets.right += 10
            return insets
        }
        set {
            super.imageEdgeInsets = imageEdgeInsets
        }
    }

}
