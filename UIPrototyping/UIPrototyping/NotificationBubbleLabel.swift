//
//  NotificationBubbleLabel.swift
//  UIPrototyping
//
//  Created by vyankovskyi on 6/29/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class NotificationBubbleLabel: UILabel {

    // MARK: - Public properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private var edgeInsets = UIEdgeInsets.zero {
        didSet { if oldValue != edgeInsets { invalidateIntrinsicContentSize() } }
    }
    private var persistentBackgroundColor: UIColor?
    override var backgroundColor: UIColor?{
        set {
            super.backgroundColor = persistentBackgroundColor
        }
        get {
            return persistentBackgroundColor
        }
    }
    override var intrinsicContentSize: CGSize{
        var size = super.intrinsicContentSize
        size.width += ceil(edgeInsets.left + edgeInsets.right)
        size.height += ceil(edgeInsets.top + edgeInsets.bottom)
        return size
    }
    
    public func setPersistentBackgroundColor(_ color: UIColor?) {
        persistentBackgroundColor = color
        backgroundColor = nil
    }
    
    public func setBorderColor(_ color: UIColor?) {
        layer.borderColor = color?.cgColor
    }
    
    public func setBorderWidth(_ width: CGFloat) {
        layer.borderWidth = width
    }
    
    public func setNotificationsCount(_ count: Int) {
        guard count > 0 else { text = ""; return }
        text = "\(count)"
    }
    
    private func setup() {
        clipsToBounds = true
        setBorderColor(.white)
        setBorderWidth(1)
        setPersistentBackgroundColor(.red)
        textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        let horizontalInset = bounds.height / 4
        edgeInsets = UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, edgeInsets))
    }
}
