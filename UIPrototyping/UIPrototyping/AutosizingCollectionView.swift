//
//  AutosizingCollectionView.swift
//  UIPrototyping
//
//  Created by vyankovskyi on 6/19/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class AutosizingCollectionView: UICollectionView {
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        print(self.contentSize)
        return self.contentSize
    }
}
