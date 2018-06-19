//
//  PathDrawingView.swift
//  UIPrototyping
//
//  Created by Vadym Yankovskiy on 6/18/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class PathDrawingView: UIView {
    
    typealias PathCalculatingClosure = (UIView) -> CGPath
    
    var calculatePath: PathCalculatingClosure?
    
    override class var layerClass : AnyClass {
        return CAShapeLayer.self
    }
    
    var pathLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let calculatePath = calculatePath else { return }
        pathLayer.path = calculatePath(self)
    }
}
