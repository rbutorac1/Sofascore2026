//
//  ResultView.swift
//  sofascore
//
//  Created by akademija on 20.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class ResultView: BaseView {
    
    enum Measures {
        
        static let resultViewWidth = 64
        static let verticalOffset = 10
        static let trailingOffset = 16
    }
    
    let mainCell: UIView = UIView()
    let homeTeamGoals: UILabel = UILabel()
    let awayTeamGoals: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(homeTeamGoals)
        mainCell.addSubview(awayTeamGoals)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        homeTeamGoals.font = Fonts.RobotoRegularTitle
        homeTeamGoals.textAlignment = .right
        awayTeamGoals.font = Fonts.RobotoRegularTitle
        awayTeamGoals.textAlignment = .right
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(Measures.resultViewWidth)
        }
        
        homeTeamGoals.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.verticalOffset)
            make.trailing.equalToSuperview().offset(-Measures.trailingOffset)
        }
        
        awayTeamGoals.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-Measures.verticalOffset)
            make.trailing.equalToSuperview().offset(-Measures.trailingOffset)
        }
    }
    
    func resultInfo(homeGoals: Int?, awayGoals: Int?, status: EventStatus){
        homeTeamGoals.text = Helper.goalsString(goals: homeGoals)
        awayTeamGoals.text = Helper.goalsString(goals: awayGoals)
        homeTeamGoals.textColor = Helper.goalsColor(homeGoals: homeGoals, awayGoals: awayGoals, status: status, isHome: true)
        awayTeamGoals.textColor = Helper.goalsColor(homeGoals: homeGoals, awayGoals: awayGoals, status: status, isHome: false)
    }
}
