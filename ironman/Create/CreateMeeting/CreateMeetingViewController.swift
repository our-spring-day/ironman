//
//  CreateMeetingViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/20.
//

import UIKit

class CreateMeetingViewController: UIViewController {
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension CreateMeetingViewController {
    func attribute() {
        titleLabel.do {
            $0.font.withSize(24.09)
        }
    }
    
    func layout() {
        
    }
}
