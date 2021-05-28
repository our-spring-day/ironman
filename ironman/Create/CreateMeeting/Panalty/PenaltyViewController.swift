//
//  PanaltyViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class PenaltyViewController: UIViewController {
    let titleLabel = CreateDetailTitleLabel(text: "💩 벌칙 정하기")
    let xmarkButton = XmarkButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension PenaltyViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
    }
    func layout() {
        [titleLabel, xmarkButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview().offset(20)
        }
        xmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(25)
        }
    }
}
