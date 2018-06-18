//
//  PathDrawingView.swift
//  UIPrototyping
//
//  Created by Vadym Yankovskiy on 6/18/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class PathDrawingView: UIView {
    @IBOutlet var startImageView: UIImageView!
    @IBOutlet var endImageView: UIImageView!
    
    override class var layerClass : AnyClass {
        return CAShapeLayer.self
    }
    
    private var pathLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShapeLayer()
    }
    
    private func setupLayer() {
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.lineDashPattern = [2, 2]
        pathLayer.lineWidth = 0.5
    }
    
    private func updateShapeLayer() {
        
        func convertCenter(ivLayer: CALayer?) -> CGPoint {
            guard let ivLayer = ivLayer else { return .zero }
            return self.layer.convert(ivLayer.position, from: ivLayer.superlayer)
        }

        let path = CGMutablePath()
        
        let start = convertCenter(ivLayer: startImageView.layer)
        let end = convertCenter(ivLayer: endImageView.layer)
        path.move(to: start)
        path.addLine(to: end)
        
        pathLayer.path = path
        
    }
}
