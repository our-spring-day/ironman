//
//  MemberViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit
import RxSwift
import RxKeyboard

class MemberViewController: UIViewController {
    let disposeBag = DisposeBag()
    let backButton = BackButton()
    let titleLabel = CreateDetailTitleLabel(text: "참여 인원")
    let countTextField = UITextField()
    let guideLabel = CreateMeetingGuideButton(text: "나중에도 인원을 수정할 수 있어요")
    let confirmButton = UIButton()
    var keyboardHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        bindUI()
    }
    
    func bindUI() {
        countTextField.becomeFirstResponder()
        
        RxKeyboard.instance.visibleHeight
          .drive(onNext: { [weak self] height in
            self?.keyboardHeight = max(self!.keyboardHeight, height)
            self?.layout()
          })
          .disposed(by: disposeBag)
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
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 50)
            $0.textColor = .black
            $0.textAlignment = .center
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
            $0.bottom.equalTo(guideLabel).offset(-103)
            $0.width.equalTo(117)
            $0.height.equalTo(60)
        }
        guideLabel.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().offset(-(keyboardHeight + 15))
            $0.centerX.equalToSuperview()
        }
    }
}
