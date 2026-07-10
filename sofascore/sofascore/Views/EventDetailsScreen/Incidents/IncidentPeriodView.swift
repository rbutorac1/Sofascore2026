//
//  IncidentPeriodView.swift
//  sofascore
//
//  Created by akademija on 31.05.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class IncidentPeriodView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 40
        static let periodCellHeight = 24
        static let periodOffset = 8
        static let textOffset = 4
        static let textHeight = 16
        static let textWidth = 160
    }
    
    let mainCell: UIView = UIView()
    let period: UIView = UIView()
    let periodText: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(period)
        period.addSubview(periodText)
    }
    
    override func styleViews(){
        backgroundColor = .lightGray
        mainCell.backgroundColor = .white
        period.backgroundColor = Colors.incidentPeriodColor
        period.layer.cornerRadius = 12
        
        periodText.textAlignment = .center
        periodText.font = Fonts.RobotoBoldTitle12
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        period.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.periodOffset)
            make.height.equalTo(Measures.periodCellHeight)
            make.leading.equalToSuperview().offset(Measures.periodOffset)
            make.trailing.equalToSuperview().inset(Measures.periodOffset)
        }
        
        periodText.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.textOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Measures.textHeight)
            make.width.equalTo(Measures.textWidth)
        }
    }
    
    func periodInfo(incident: Incident){
        periodText.text = (incident.description ?? "") + " (\(incident.score ?? ""))"
    }
}
