//
//  TestClass.swift
//  ironman
//
//  Created by 정재인 on 2021/06/16.
//

import UIKit

class CustomView: UIView {
    let myLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class WebToonCollectionViewCell: UICollectionViewCell {
    
}
