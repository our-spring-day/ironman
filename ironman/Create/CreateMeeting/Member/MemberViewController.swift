//
//  MemberViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class MemberViewController: UIViewController {
    let backButton = BackButton()
    let titleLabel = CreateDetailTitleLabel(text: "참여 인원")
    let countTextField = UITextField()
    let guideLabel = CreateMeetingGuideButton(text: "나중에도 인원을 수정할 수 있어요")
    let confirmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension MemberViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        countTextField.do {
            $0.text = "3"
            $0.inputAccessoryView = confirmButton
            $0.keyboardType = .numberPad
        }
        confirmButton.do {
            $0.setTitle("완료", for: .normal)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
        }
    }
    func layout() {
        [backButton, titleLabel, countTextField, guideLabel].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(66)
            $0.leading.equalTo(backButton.snp.trailing).offset(14.49)
        }
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalToSuperview().offset(20)
        }
        countTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(117)
            $0.height.equalTo(60)
        }
    }
}
