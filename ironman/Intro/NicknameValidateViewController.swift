//
//  NicknameValidateViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import RxKeyboard

class NicknameValidateViewController: IntroBaseViewController {
    let disposeBag              = DisposeBag()
    
//    lazy var backButton         = UIButton()
//    lazy var descript           = UILabel()
    lazy var underLine          = UIView()
    lazy var inputNickname      = UITextField()
//    lazy var completeButton     = UIButton()
    lazy var successLabel       = UILabel()
    lazy var successIcon        = UIImageView()
    lazy var failureLabel       = UILabel()
    lazy var failureIcon        = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        attribute()
//        layout()
        bind()
    }
    
    private func bind() {
        inputNickname.rx.controlEvent(.editingDidEnd)
            .asObservable()
            .subscribe(onNext: { _ in
                
            })
            .disposed(by: disposeBag)
        
        inputNickname.rx.text.orEmpty
            .map(checkName)
            .subscribe(onNext: { b in
                self.completeButton.backgroundColor = b
                    ? #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
                    : #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
                self.underLine.backgroundColor = b
                    ? #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
                    : #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
                
                self.successIcon.isHidden = !b
                self.successLabel.isHidden = !b
                
                self.completeButton.isEnabled = b
                
                if b {
                    self.underLine.snp.updateConstraints {
                        $0.height.equalTo(2)
                    }
                } else {
                    self.underLine.snp.updateConstraints {
                        $0.height.equalTo(1)
                    }
                }
            })
            .disposed(by: disposeBag)
        
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [weak self] keyboardVisibleHeight in
                guard let `self` = self else { return }
                self.completeButton.snp.updateConstraints {
                    $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardVisibleHeight)
                }
                self.view.setNeedsLayout()
                UIView.animate(withDuration: 0) {
                    self.view.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)
        
        RxKeyboard.instance.isHidden
            .filter { $0 == true }
            .drive(onNext: { isHidden in
                UIView.animate(withDuration: 0.5) {
                    self.completeButton.snp.updateConstraints {
                        $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                            .offset(-30)
                    }
                    self.view.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)
    }
    
    @objc func goSelectProfile() {
        let view = ProfileSelectViewController()
        view.modalPresentationStyle = .fullScreen
        
        // 아직 탭바나 이런게 정해지지 않아서 일단 프레젠트로
        self.present(view, animated: true)
    }
    
    private func checkName(_ nickname: String) -> Bool {
        return !nickname.isEmpty
    }
    
    override func attribute() {
        super.attribute()
        
        self.descript.do {
            $0.text = "6자 이내로\n이름을 알려주세요."
        }
        self.underLine.do {
            $0.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        }
        self.inputNickname.do {
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 18)
            $0.attributedPlaceholder = NSAttributedString(string: "김만나",
                                                          attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7764705882, alpha: 1)])
        }
        self.completeButton.do {
            $0.setTitle("다음 단계로", for: .normal)
            $0.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
            $0.isEnabled = false
            $0.addTarget(self, action: #selector(goSelectProfile), for: .touchUpInside)
        }
        self.successLabel.do {
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
            $0.textColor = #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
            $0.text = "사용 가능합니다."
            $0.isHidden = true
        }
        self.successIcon.do {
            $0.image = UIImage(named: "success")
            $0.isHidden = true
        }
        self.failureLabel.do {
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
            $0.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            $0.isHidden = true
        }
        self.failureIcon.do {
            $0.image = UIImage(named: "failure")
            $0.isHidden = true
        }
    }
    
    override func layout() {
        super.layout()
        [underLine, inputNickname, successLabel, successIcon , failureLabel, failureIcon]
            .forEach { self.view.addSubview($0) }
        
        self.underLine.snp.makeConstraints {
            $0.top.equalTo(self.descript.snp.bottom).offset(74)
            $0.leading.equalTo(31)
            $0.trailing.equalTo(-32)
            $0.height.equalTo(1)
        }
        self.successIcon.snp.makeConstraints {
            $0.top.equalTo(self.underLine.snp.bottom).offset(11)
            $0.leading.equalTo(self.underLine)
            $0.width.height.equalTo(13)
        }
        self.successLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.successIcon)
            $0.leading.equalTo(self.successIcon.snp.trailing).offset(4)
        }
        self.failureIcon.snp.makeConstraints {
            $0.top.equalTo(self.successIcon)
            $0.leading.equalTo(self.successIcon)
            $0.width.height.equalTo(self.successIcon)
        }
        self.failureLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.successIcon)
            $0.leading.equalTo(self.successIcon.snp.trailing).offset(4)
        }
        self.inputNickname.snp.makeConstraints {
            $0.bottom.equalTo(self.underLine.snp.top).offset(-7)
            $0.leading.equalTo(31)
            $0.trailing.equalTo(-32)
            $0.height.equalTo(26)
        }
    }
}
