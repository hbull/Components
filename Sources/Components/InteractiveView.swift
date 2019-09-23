//
//  InteractiveView.swift
//  Activity Tracker
//
//  Created by Kakao on 21/02/2019.
//  Copyright © 2019 hbull. All rights reserved.
//

import Foundation
import UIKit

protocol InteractiveView {
    var interactiveView: UIView { get }
}

extension InteractiveView where Self: UIView {
    func updateHighlighted(_ highlighted: Bool) {
        let changeStatus = {
            [weak self] in
            let transform = highlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform.identity
            self?.interactiveView.transform = transform
            self?.interactiveView.alpha = highlighted ? 0.95 : 1
        }
        
        if #available(iOS 10.0, *) {
            let parameters = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.25, y: 0.1), controlPoint2: CGPoint(x: 0.25, y: 1))
            let animator = UIViewPropertyAnimator(duration: 0.15, timingParameters: parameters)
            animator.addAnimations(changeStatus)
            animator.startAnimation()
        } else {
            UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: changeStatus, completion: nil)
        }
    }
}

