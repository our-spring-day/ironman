//
//  ProfileResultViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class ProfileResultViewController: IntroBaseViewController {
    
    lazy var reviseButton       = UIButton()
    lazy var profileImage       = UIImageView()
    
    @objc private func goNext() {
        let view = ServiceViewController()
        view.modalPresentationStyle = .fullScreen
        
        // 아직 탭바나 이런게 정해지지 않아서 일단 프레젠트로
        self.present(view, animated: true)
    }
   
    override func attribute() {
        super.attribute()
        self.descript.do {
            $0.text = "멋진 사진이네요!\n이대로 진행할까요?"
        }
        self.completeButton.do {
            $0.setTitle("다음 단계로", for: .normal)
            $0.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        }
        self.reviseButton.do {
            $0.setTitle("다시 수정할래요", for: .normal)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.setTitleColor(#colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1), for: .normal)
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 30
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
        self.profileImage.do {
            $0.image = UIImage(named: "profile")
            $0.layer.cornerRadius = 70
            $0.layer.masksToBounds = true
        }
    }
    
    override func layout() {
        super.layout()
        [reviseButton, profileImage].forEach{ self.view.addSubview($0) }

        self.reviseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.completeButton.snp.top).offset(-12)
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
        self.profileImage.snp.makeConstraints {
            $0.top.equalTo(self.descript.snp.bottom).offset(98)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
}
