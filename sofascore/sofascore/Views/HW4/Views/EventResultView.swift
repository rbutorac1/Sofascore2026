//
//  EventResultView.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class EventResultView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 56
        static let goalsCellWidth = 56
        static let goalsCellHeight = 40
    }
    
    let mainCell: UIView = UIView()
    let resultCell: UIView = UIView()
    let home: UILabel = UILabel()
    let away: UILabel = UILabel()
    let dash: UILabel = UILabel()
    let minute: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(resultCell)
        mainCell.addSubview(minute)
        resultCell.addSubview(home)
        resultCell.addSubview(away)
        resultCell.addSubview(dash)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        home.font = Fonts.RobotoBoldTitle32
        home.textAlignment = .right
        away.font = Fonts.RobotoBoldTitle32
        away.textAlignment = .left
        
        dash.text = " - "
        dash.font = Fonts.RobotoBoldTitle32
        
        minute.font = Fonts.RobotoCondensedRegularTitle
        minute.textAlignment = .center
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        resultCell.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.goalsCellHeight)
        }
        
        home.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(Measures.goalsCellHeight)
            make.width.equalTo(Measures.goalsCellWidth)
        }
        
        away.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview()
            make.height.equalTo(Measures.goalsCellHeight)
            make.width.equalTo(Measures.goalsCellWidth)
        }
        
        dash.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(home.snp.trailing)
            make.trailing.equalTo(away.snp.leading)
            make.height.equalTo(Measures.goalsCellHeight)
        }
        
        minute.snp.makeConstraints{ make in
            make.top.equalTo(home.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func resultInfo(homeGoals: Int?, awayGoals: Int?, timestamp: Int, status: EventStatus){
        (home.text, away.text) = Helper.goalsString(homeGoals: homeGoals, awayGoals: awayGoals)
        (home.textColor, away.textColor) = Helper.goalsColor(homeGoals: homeGoals, awayGoals: awayGoals, status: status)
        
        if status == EventStatus.finished {
            minute.text = "Full Time"
            minute.textColor = Colors.FinishedColor
            dash.textColor = Colors.FinishedColor
        } else {
            minute.text = Helper.minute(startTimestamp: timestamp, status: status)
            minute.textColor = Helper.minuteColor(status: status)
            dash.textColor = Colors.liveColor
        }
        
    }
}
