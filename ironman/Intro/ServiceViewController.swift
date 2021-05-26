//
//  ServiceViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class ServiceViewController: IntroBaseViewController {
    var checkState: Bool = false {
        didSet {
            if self.checkState {
                self.checkImage.setImage(UIImage(named: "iconCheck"), for: .normal)
            } else {
                self.checkImage.setImage(UIImage(named: "iconUncheck"), for: .normal)
            }
        }
    }
    
    lazy var checkImage          = UIButton()
    lazy var descriptValid       = UILabel()
    
    @objc func tapCheck() {
        checkState.toggle()
    }
    
    override func attribute() {
        super.attribute()
        
        self.descript.do {
            $0.text = "서비스 이용약관에\n동의해주세요."
        }
        self.completeButton.do {
            $0.setTitle("동의하고 가입하기", for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
        self.checkImage.do {
            $0.setImage(UIImage(named: "iconUncheck"), for: .normal)
            $0.contentMode = .scaleAspectFill
            $0.addTarget(self, action: #selector(tapCheck), for: .touchUpInside)
        }
        self.descriptValid.do {
            $0.text = "위 이용약관에 동의합니다(필수)"
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            $0.textColor = .black
        }
    }
    
    override func layout() {
        super.layout()
        [checkImage, descriptValid].forEach{ self.view.addSubview($0) }
        
        self.checkImage.snp.makeConstraints {
            $0.bottom.equalTo(self.completeButton.snp.top).offset(-67)
            $0.leading.equalToSuperview().offset(33)
            $0.width.height.equalTo(21)
        }
        self.descriptValid.snp.makeConstraints {
            $0.leading.equalTo(self.checkImage.snp.trailing).offset(8)
            $0.centerY.equalTo(self.checkImage.snp.centerY)
        }
    }
}
