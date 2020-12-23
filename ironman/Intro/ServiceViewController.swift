//
//  ServiceViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class ServiceViewController: IntroBaseViewController {
    
    override func attribute() {
        super.attribute()
        
        self.descript.do {
            $0.text = "서비스 이용약관에\n동의해주세요."
        }
        self.completeButton.do {
            $0.setTitle("동의하고 가입하기", for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
    }
}
