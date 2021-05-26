//
//  CreateMeetingViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/20.
//

import UIKit

class CreateMeetingViewController: UIViewController {
    let titleLabel = TitleLabel(text: "약속 만들기")
    let xmarkButton = XmarkButton()
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
    }
    
    func layout() {
        [titleLabel, xmarkButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        xmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
}
