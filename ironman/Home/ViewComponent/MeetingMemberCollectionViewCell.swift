//
//  MeetingMemberCollectionViewCell.swift
//  ironman
//
//  Created by 정재인 on 2021/06/16.
//

import UIKit

class MeetingMemberCollectionViewCell: UICollectionViewCell {
    let profileImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: attribute & layout

extension MeetingMemberCollectionViewCell {
    func attribute() {
        profileImageView.do {
            $0.setRadiusWithMasksToBounds(19)
            $0.contentMode = .scaleAspectFill
        }
    }
    
    func layout() {
        [profileImageView].forEach { addSubview($0)}
        
        profileImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
