//
//  RequiredInfoView.swift
//  ironman
//
//  Created by 정재인 on 2021/05/26.
//

import UIKit

class RequiredInfoView: UIView {
    let datePickButton = ChevronGrayButton(icon: "🗓", text: "날짜 및 시간")
    let placeButton = ChevronGrayButton(icon: "⛳️", text: "장소")
    let memberButton = ChevronGrayButton(icon: "👫", text: "참석 인원")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: attribute & layout

extension RequiredInfoView {
    func layout() {
        [datePickButton, placeButton, memberButton].forEach { addSubview($0) }
        
        datePickButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(64)
            $0.top.equalToSuperview()
        }
        placeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(64)
            $0.top.equalTo(datePickButton.snp.bottom).offset(10)
        }
        memberButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(64)
            $0.top.equalTo(placeButton.snp.bottom).offset(10)
        }
    }
}
