//
//  TodayMeetingTableViewCell.swift
//  ironman
//
//  Created by 정재인 on 2021/06/16.
//

import UIKit

class TodayMeetingTableViewCell: UITableViewCell {
    static let id = "TodayMeetingTableViewCell"
    let memberNameLabel = MeetingTitleLabel(text: "")
    var collectionView: UICollectionView!
    let tempLayout = UICollectionViewFlowLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: tempLayout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: attribute & layout

extension TodayMeetingTableViewCell {
    func attribute() {
        
    }
    
    func layout() {
        [memberNameLabel, collectionView].forEach { addSubview($0) }
        
        memberNameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(memberNameLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(43)
            $0.bottom.equalToSuperview()
        }
    }
}
