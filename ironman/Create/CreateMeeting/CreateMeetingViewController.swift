//
//  CreateMeetingViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/20.
//

import UIKit

class CreateMeetingViewController: UIViewController {
    let titleLabel = HeadingLabel(text: "약속 만들기")
    let xmarkButton = XmarkButton()
    let requiredInfoLabel = SubHeadingLabel(text: "필수 정보")
    let requiredInfoView = RequiredInfoView()
    let additionalInfoLabel = SubHeadingLabel(text: "추가 정보")
    let additionalInfoView = AdditionalInfoView()
    let confirmButton = CreateConfirmButton()
    
    override func viewDidLoad() {
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension CreateMeetingViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        confirmButton.do {
            $0.setTitle("필수 정보를 모두 입력해 주세요.", for: .normal)
        }
    }
    
    func layout() {
        [titleLabel,
         xmarkButton,
         requiredInfoLabel,
         requiredInfoView,
         additionalInfoLabel,
         additionalInfoView,
         confirmButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(35)
            $0.width.equalTo(110)
        }
        xmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.height.width.equalTo(40)
        }
        requiredInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30.75)
        }
        requiredInfoView.snp.makeConstraints {
            $0.top.equalTo(requiredInfoLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(212)
        }
        additionalInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(requiredInfoView.snp.bottom).offset(40)
        }
        additionalInfoView.snp.makeConstraints {
            $0.top.equalTo(additionalInfoLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(138)
        }
        confirmButton.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(57)
            $0.bottom.equalTo(view.snp.bottom).offset(-34)
        }
    }
}

