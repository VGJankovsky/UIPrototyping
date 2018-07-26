//
//  ImageRenderer.swift
//  UIPrototyping
//
//  Created by vyankovskyi on 7/9/18.
//  Copyright © 2018 Vadym Yankovskiy. All rights reserved.
//

import UIKit

class ImageRenderer {
//    
//    enum ImageType {
//        case avatarBackground(baseColor: UIColor, shadowColor: UIColor, size: CGSize)
//        case notificationBadge(baseColor: UIColor, fillColor: UIColor, shadowColor: UIColor, size: CGSize)
//    }
//
////    func render(_ imageType: ImageType) -> UIImage {
////        switch imageType {
////        case .avatarBackground(baseColor: baseColor, shadowColor: shadowColor, size: size):
////            renderAvatarBackground(with: baseColor, shadowColor: shadowColor, size: CGSizesize)
////        default:
////            <#code#>
////        }
////    }
//    
//    private func renderAvatarBackground(with baseColor: UIColor = .white,
//                                        shadowColor: UIColor = .lightGray,
//                                        size: CGSize = CGSize(width: 24, height: 24)) -> UIImage {
//        let baseLayer = CALayer()
//        baseLayer.frame = CGRect(origin: .zero, size: size)
//        baseLayer.backgroundColor = baseColor.cgColor
//        baseLayer.cornerRadius = baseLayer.frame.size.height / 2
//        baseLayer.shadowOffset = CGSize(width: 0, height: 0)
//        baseLayer.shadowOpacity = 1
//        baseLayer.shadowColor = shadowColor.cgColor
//        baseLayer.shadowRadius = 4
//        
//        let backgroundLayer = CALayer()
//        backgroundLayer.frame = baseLayer.frame.insetBy(dx: 1, dy: 1)
//        backgroundLayer.backgroundColor = shadowColor.cgColor
//        baseLayer.addSublayer(backgroundLayer)
//    }
//    
//    private func render(_ layer: CALayer, size: CGSize, completion: @escaping (UIImage) -> Void) {
//        let dispatchQueue = DispatchQueue.global(qos: .userInitiated)
//        dispatchQueue.async {
//            let renderer = UIGraphicsImageRenderer(size: size)
//            let image = renderer.image { context in
//                return layer.render(in: context.cgContext)
//            }
//            
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//        
//    }
 }
