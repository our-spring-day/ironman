//
//  PanaltyViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit
import RxSwift
import RxCocoa

class PenaltyViewController: UIViewController {
    let disposeBag = DisposeBag()
    let titleLabel = CreateDetailTitleLabel(text: "💩 벌칙 정하기")
    let xmarkButton = XmarkButton()
    let targetLabel = SubHeadingLabel(text: "대상")
    let targetInfoView = PenaltyTargetInfoView()
    let penaltyLabel = SubHeadingLabel(text: "벌칙")
    let penaltyTableView = UITableView()
    let confirmButton = CreateConfirmButton()
    
    let tempPenaltyList: [tempPenalty] = [tempPenalty(icon: "☕️", text: "커피 사기"),
                                          tempPenalty(icon: "🍚", text: "밥사기"),
                                          tempPenalty(icon: "💃", text: "춤추면서 입장하기"),
                                          tempPenalty(icon: "💸", text: "벌금 내기"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bindUI()
    }
    
    func bindUI() {
        penaltyTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        Observable.of(tempPenaltyList)
            .bind(to: penaltyTableView.rx
                    .items(cellIdentifier: PenaltyTableViewCell.id,
                           cellType: PenaltyTableViewCell.self)) { _, element, cell in
                cell.setData(penalty: element)
            }.disposed(by: disposeBag)
    }
}

extension PenaltyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

// MARK: attribute & layout

extension PenaltyViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        confirmButton.do {
            $0.setTitle("대상과 벌칙을 선택해주세요", for: .normal)
        }
        penaltyTableView.do {
            $0.separatorStyle = .none
            $0.register(PenaltyTableViewCell.self,
                        forCellReuseIdentifier: PenaltyTableViewCell.id)
        }
    }
    func layout() {
        [titleLabel,
         xmarkButton,
         targetLabel,
         targetInfoView,
         penaltyLabel,
         penaltyTableView,
         confirmButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview().offset(20)
        }
        xmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(25)
        }
        targetLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
        }
        targetInfoView.snp.makeConstraints {
            $0.top.equalTo(targetLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(138)
        }
        penaltyLabel.snp.makeConstraints {
            $0.top.equalTo(targetInfoView.snp.bottom).offset(49)
            $0.leading.equalToSuperview().offset(20)
        }
        penaltyTableView.snp.makeConstraints {
            $0.top.equalTo(penaltyLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(confirmButton.snp.top).offset(-10)
        }
        confirmButton.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(57)
            $0.bottom.equalTo(view.snp.bottom).offset(-34)
        }
    }
}
