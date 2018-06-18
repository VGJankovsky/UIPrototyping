//
//  ViewController.swift
//  UIPrototyping
//
//  Created by Vadym Yankovskiy on 6/18/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum BottomLayoutConstraintConstant: CGFloat {
        case high = 100
        case low = 50
    }
    
    @IBOutlet var pathDrawingView: PathDrawingView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomConstraint.constant = BottomLayoutConstraintConstant.high.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleButtonTouchUpInside() {
        var constant = bottomConstraint.constant
        
        constant = constant == BottomLayoutConstraintConstant.high.rawValue ? BottomLayoutConstraintConstant.low.rawValue : BottomLayoutConstraintConstant.high.rawValue
        
        bottomConstraint.constant = constant
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }

}

