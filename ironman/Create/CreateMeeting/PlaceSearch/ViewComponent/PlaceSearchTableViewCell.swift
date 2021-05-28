//
//  PlaceSearchTableViewCell.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class PlaceSearchTableViewCell: UITableViewCell {
    static let id = "PlaceSearchTableViewCell"
    let placeName = UILabel()
    let detailAddress = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaceSearchTableViewCell {
    func attribute() {
        placeName.do {
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
            $0.text = "카카오 판교오피스"
        }
        detailAddress.do {
            $0.textColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
            $0.text = "경기 수원시 팔달구 덕영대로924"
        }
    }
    func layout() {
        [placeName, detailAddress].forEach { addSubview($0) }
        
        placeName.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(8.5)
        }
        detailAddress.snp.makeConstraints {
            $0.top.equalTo(placeName.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
