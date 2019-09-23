//
//  IdentifiableView.swift
//  Activity Tracker
//
//  Created by Kakao on 14/02/2019.
//  Copyright © 2019 hbull. All rights reserved.
//

import Foundation
import UIKit

protocol IdentifiableView {
    static var nib: UINib { get }
    static var identifier: String { get }
}

extension IdentifiableView where Self: UIView {
    static var nib: UINib { return UINib(nibName: self.identifier, bundle: nil) }
    static var identifier: String { return  String(describing: self) }
}

extension UICollectionView {
    func dequeuReusableCell<T: IdentifiableView>(type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as! T
    }
}

extension UITableView {
    func dequeueReusableCell<T: IdentifiableView>(type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}

extension UITableView {
    func registerForHeaderFooterView<T: IdentifiableView>(_ type: T.Type)  {
        register(type.nib, forHeaderFooterViewReuseIdentifier: type.identifier)
    }
    
    func dequeueReusableHeaderFooterView<T: IdentifiableView>(type: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: type.identifier) as! T
    }
}
