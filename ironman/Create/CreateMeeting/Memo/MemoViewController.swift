//
//  MemoViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit
import RxSwift
import RxKeyboard

class MemoViewController: UIViewController {
    let disposeBag = DisposeBag()
    let titleLabel = CreateDetailTitleLabel(text: "✏️ 메모 남기기")
    let xmarkButton = XmarkButton()
    let confirmButton = CreateDetailConfirmButton()
    let memoTextView = UITextView()
    var keyboardHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        bindUI()
    }
    
    func bindUI() {
        memoTextView.becomeFirstResponder()
        
        RxKeyboard.instance.visibleHeight
          .drive(onNext: { [weak self] height in
            self?.keyboardHeight = max(self!.keyboardHeight, height)
            self?.layout()
          })
          .disposed(by: disposeBag)
    }
}

// MARK: attribute & layout

extension MemoViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        memoTextView.do {
            $0.text = "올 때 노트북 충전기 꼭 챙겨오삼 \n저녁 드실분 미리 카톡좀~"
            $0.textColor = UIColor(red: 0.042, green: 0.042, blue: 0.042, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        }
    }
    
    func layout() {
        [titleLabel, xmarkButton, memoTextView, confirmButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview().offset(20)
        }
        xmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(25)
        }
        memoTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.bottom.equalTo(confirmButton.snp.top).offset(-20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        confirmButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-(keyboardHeight + 20))
            $0.width.equalTo(300)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
    }
}
