//
//  Shakable.swift
//  Daystamp
//
//  Created by Kakao on 02/08/2019.
//  Copyright © 2019 hbull. All rights reserved.
//

import Foundation
import UIKit

protocol Shakable {
    var shakableTarget: UIView { get }
}

extension Shakable where Self: UIView {
    func shake() {
        let midX = shakableTarget.center.x
        let midY = shakableTarget.center.y
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: midX - 10, y: midY)
        animation.toValue = CGPoint(x: midX + 10, y: midY)
        
        shakableTarget.layer.add(animation, forKey: "position")
    }
}
