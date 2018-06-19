//
//  ViewController.swift
//  UIPrototyping
//
//  Created by Vadym Yankovskiy on 6/18/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    enum BottomLayoutConstraintConstant: CGFloat {
        case high = 100
        case low = 50
    }
    
    @IBOutlet var startImageView: UIImageView!
    @IBOutlet var endImageView: UIImageView!
    @IBOutlet var pathDrawingView: PathDrawingView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var colletionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colletionView.dataSource = self
        colletionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
        
        bottomConstraint.constant = BottomLayoutConstraintConstant.high.rawValue
        
        setUpPathView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colletionView.invalidateIntrinsicContentSize()
        colletionView.layoutIfNeeded()
    }

    @IBAction func toggleButtonTouchUpInside() {
        var constant = bottomConstraint.constant
        
        constant = constant == BottomLayoutConstraintConstant.high.rawValue ? BottomLayoutConstraintConstant.low.rawValue : BottomLayoutConstraintConstant.high.rawValue
        
        bottomConstraint.constant = constant
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setUpPathView() {
        let shapeLayer = pathDrawingView.pathLayer
        shapeLayer.lineDashPattern = [2, 2]
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 0.5
        pathDrawingView.calculatePath = { [weak self] pathView in
            func convertCenter(ivLayer: CALayer?) -> CGPoint {
                guard let ivLayer = ivLayer else { return .zero }
                return pathView.layer.convert(ivLayer.position, from: ivLayer.superlayer)
            }
            let path = CGMutablePath()
            let start = convertCenter(ivLayer: self?.startImageView.layer)
            let end = convertCenter(ivLayer: self?.endImageView.layer)
            path.move(to: start)
            path.addLine(to: end)
            return path
        }
    }
    
    // MARK: - CollectionView datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath)
        cell.backgroundColor = UIColor.red
        
        return cell
    }
}

