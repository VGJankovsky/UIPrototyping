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
        
        static let leftToRight = GradientDirection(start: CGPoint(x:0, y:0.5), end: CGPoint(x:1, y:0.5))
        static let rightToLeft = GradientDirection(start: CGPoint(x:1, y:0.5), end: CGPoint(x:0, y:0.5))
        static let bottomToTop = GradientDirection(start: CGPoint(x:0.5, y:0.0), end: CGPoint(x:0.5, y:1))
        static let topToBottom = GradientDirection(start: CGPoint(x:0.5, y:1), end: CGPoint(x:0.5, y:0))
        
        let start : CGPoint
        let end : CGPoint
    }
    
    static let defaulLocations = [0.7, 0.95]
    static let defaultColors = [UIColor.black, UIColor.clear].map { $0.cgColor }
    var string: String? { return (attributedText?.string ?? text) }
    
    // MARK: Private properties
    
    private lazy var maskLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = self.locations ?? GradientTruncatingLabel.defaulLocations.map { NSNumber(value: $0) }
        gradientLayer.colors = GradientTruncatingLabel.defaultColors
        return gradientLayer
    }()
    
    // MARK: Public properties
    // MARK: Customization
    
    var direction : GradientDirection?
    var locations : [NSNumber]?

    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    private func applyDirection(_ direction: GradientDirection){
        maskLayer.startPoint = direction.start
        maskLayer.endPoint = direction.end
    }
    
    private func truncateIfNeeded(){
        layer.mask = nil
        guard let labelText = text else { return }
        let textSize = labelText.size(withAttributes: [NSAttributedStringKey.font: font] )
        guard textSize.width > bounds.width else { return }
        maskLayer.frame = bounds
        applyDirection(textDirection())
        layer.mask = maskLayer
    }

    private func textDirection() -> GradientDirection {
        guard let languageDirection = string?.languageDirection() else { return .leftToRight }
        switch languageDirection {
        case .leftToRight: return .leftToRight
        case .rightToLeft: return .rightToLeft
        case .bottomToTop: return .bottomToTop
        case .topToBottom: return .topToBottom
        default: return .leftToRight
        }
    }
}

extension String {
    func languageDirection() -> NSLocale.LanguageDirection
    {
        let tagger = NSLinguisticTagger(tagSchemes: [.language], options: 0)
        tagger.string = self
        guard let dominantLanguage = tagger.dominantLanguage else { return .leftToRight }
        
        return NSLocale.characterDirection(forLanguage: dominantLanguage)
    }
}
