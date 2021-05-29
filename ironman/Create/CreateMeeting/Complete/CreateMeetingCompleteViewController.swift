//
//  CreateMeetingCompleteViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/29.
//

import UIKit

class CreateMeetingCompleteViewController: UIViewController {
    let checkImageView = UIImageView()
    let titleLabel = HeadingLabel(text: "약속 만들기 완료!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension CreateMeetingCompleteViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        checkImageView.do {
            $0.image = UIImage(named: "check")
        }
        titleLabel.do {
            $0.textAlignment = .center
        }
    }
    func layout() {
        [checkImageView, titleLabel].forEach { view.addSubview($0) }
        
        checkImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(74)
            $0.width.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(checkImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
        }
    }
}
