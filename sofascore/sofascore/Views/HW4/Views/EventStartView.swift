//
//  EventStartView.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class EventStartView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 36
        static let textCellHeight = 16
        static let textDistance = 4
    }
    
    let mainCell: UIView = UIView()
    let matchDate: UILabel = UILabel()
    let matchTime: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(matchDate)
        mainCell.addSubview(matchTime)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        matchDate.font = Fonts.RobotoCondensedRegularTitle
        matchDate.textAlignment = .center
        
        matchTime.font = Fonts.RobotoCondensedRegularTitle
        matchTime.textAlignment = .center
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        matchDate.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.textCellHeight)
        }
        
        matchTime.snp.makeConstraints{ make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(matchDate.snp.bottom).offset(Measures.textDistance)
        }
    }
    
    func resultInfo(timestamp: Int){
        matchDate.text = Helper.matchDate(startTimeStamp: timestamp)
        matchTime.text = Helper.matchStart(startTimestamp: timestamp)
    }
}
