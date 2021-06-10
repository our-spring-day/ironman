//
//  HomeViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/06/07.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let headingLabel = HeadingLabel(text: "오늘 1개의\n약속이 있어요")
    let mailButton = UIButton()
    let alarmButton = UIButton()
    let meetingTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: attribute & layout

extension HomeViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        headingLabel.do {
            $0.numberOfLines = 2
        }
        mailButton.do {
            $0.setImage(UIImage(named: "mail"), for: .normal)
        }
        alarmButton.do {
            $0.setImage(UIImage(named: "alarm"), for: .normal)
        }
        meetingTableView.do {
            $0.backgroundColor = .cyan
        }
    }
    func layout() {
        [headingLabel, mailButton, alarmButton, meetingTableView].forEach { view.addSubview($0) }
        
        headingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(26)
        }
        alarmButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(26)
            $0.width.height.equalTo(40)
        }
        mailButton.snp.makeConstraints {
            $0.trailing.equalTo(alarmButton.snp.leading).offset(-8)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(26)
            $0.width.height.equalTo(40)
        }
        meetingTableView.snp.makeConstraints {
            $0.top.equalTo(headingLabel.snp.bottom).offset(53)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
