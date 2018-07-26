//
//  GradientTruncatingLabel.swift
//  UIElementsPrototyping
//
//  Created by vyankovskyi on 6/15/18.
//  Copyright © 2018 vyankovskyi. All rights reserved.
//

import UIKit

class GradientTruncatingLabel: UILabel {
    
    struct GradientDirection {
        
        static let horizontal = GradientDirection(start: CGPoint(x:0, y:0.5), end: CGPoint(x:1, y:0.5))
        
        let start : CGPoint
        let end : CGPoint
    }
    
    static let defaulLocations = [0.7, 0.95]
    static let defaultColors = [UIColor.black, UIColor.clear].map { $0.cgColor }
    
    // MARK: Private properties
    
    private lazy var gradientLayer = CAGradientLayer()
    
    // MARK: Public properties
    // MARK: Customization
    
    var direction : GradientDirection?
    var locations : [NSNumber]?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradientLayer()
        lineBreakMode = .byClipping
        numberOfLines = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        truncateIfNeeded()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        truncateIfNeeded()
    }
    
    private func addGradientLayer(){
        gradientLayer.frame = bounds
        gradientLayer.locations = self.locations ?? GradientTruncatingLabel.defaulLocations.map { NSNumber(value: $0) }
        gradientLayer.isHidden = true
        gradientLayer.colors = GradientTruncatingLabel.defaultColors
        applyDirection(direction ?? GradientDirection.horizontal)
        layer.mask = gradientLayer
    }
    
    private func applyDirection(_ direction: GradientDirection){
        gradientLayer.startPoint = direction.start
        gradientLayer.endPoint = direction.end
    }
    
    private func truncateIfNeeded(){
        gradientLayer.isHidden = true
        guard let labelText = text else { return }
        let textSize = labelText.size(withAttributes: [NSAttributedStringKey.font: font] )
        guard textSize.width > bounds.width else { return }
        gradientLayer.frame = bounds
        gradientLayer.isHidden = false
    }
}
