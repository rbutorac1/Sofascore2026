//
//  IncidentIconView.swift
//  sofascore
//
//  Created by akademija on 31.05.2026..
//

import UIKit
import SofaAcademic
import SnapKit

class IncidentIconView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 56
        static let cellWidth = 64
        static let iconSize = 20
        static let iconTop = 8
        static let minuteWidth = 40
        static let minuteHeight = 16
        static let minuteIconGap = 2
    }
    
    let mainCell: UIView = UIView()
    let icon: UIImageView = UIImageView()
    let minute: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(icon)
        mainCell.addSubview(minute)
    }
    
    override func styleViews(){
        icon.contentMode = .scaleAspectFit
        
        minute.textColor = .lightGray
        minute.textAlignment = .center
        minute.font = Fonts.RobotoCondensedRegularTitle12
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.cellWidth)
            make.height.equalTo(Measures.cellHeight)
        }
        
        icon.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.iconTop)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(Measures.iconSize)
        }
        
        minute.snp.makeConstraints{ make in
            make.top.equalTo(icon.snp.bottom).offset(Measures.minuteIconGap)
            make.centerX.equalToSuperview()
            make.height.equalTo(Measures.minuteHeight)
            make.width.equalTo(Measures.minuteWidth)
        }
    }
    
    func incidentInfo(incident: Incident){
        if(incident.type == IncidentType.goal){
            icon.image = Images.goalIcon
        } else {
            icon.image = Images.yellowCard
        }
        
        minute.text = String(incident.minute) + "'"
    }
}
