//
//  MatchView.swift
//  sofascore
//
//  Created by akademija on 15.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class MatchView: BaseView {
    
    let mainCell = UIView()
    let timeCell = UIView()
    let matchStart = UILabel()
    let minuteMatch = UILabel()
    let dividerLine = UIImageView()
    let homeTeamCell = UIView()
    let homeTeamName = UILabel()
    let homeTeamLogo = UIImageView()
    let awayTeamCell = UIView()
    let awayTeamName = UILabel()
    let awayTeamLogo = UIImageView()
    let homeTeamGoals = UILabel()
    let awayTeamGoals = UILabel()
    
    override func addViews(){
        
        addSubview(mainCell)
        
        mainCell.addSubview(timeCell)
        mainCell.addSubview(dividerLine)
        mainCell.addSubview(homeTeamCell)
        mainCell.addSubview(awayTeamCell)
        mainCell.addSubview(homeTeamGoals)
        mainCell.addSubview(awayTeamGoals)
        
        timeCell.addSubview(matchStart)
        timeCell.addSubview(minuteMatch)
        
        homeTeamCell.addSubview(homeTeamName)
        homeTeamCell.addSubview(homeTeamLogo)
        
        awayTeamCell.addSubview(awayTeamName)
        awayTeamCell.addSubview(awayTeamLogo)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = .white
        
        timeCell.backgroundColor = .white
        
        matchStart.font = Fonts.RobotoRegularTitle
        matchStart.textColor = .gray
        matchStart.textAlignment = .center
        
        minuteMatch.font = Fonts.RobotoRegularTitle
        minuteMatch.textColor = .gray
        minuteMatch.textAlignment = .center
        
        dividerLine.image = Images.divider
        
        homeTeamName.font = Fonts.RobotoRegularTitle
        homeTeamName.numberOfLines = 1
        awayTeamName.font = Fonts.RobotoRegularTitle
        awayTeamName.numberOfLines = 1
        
        homeTeamGoals.font = Fonts.RobotoRegularTitle
        homeTeamGoals.textAlignment = .right
        awayTeamGoals.font = Fonts.RobotoRegularTitle
        awayTeamGoals.textAlignment = .right
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(56)
        }
        
        timeCell.snp.makeConstraints{ make in
            make.leading.equalTo(mainCell.snp.leading)
            make.top.equalTo(mainCell.snp.top)
            make.height.equalTo(mainCell.snp.height)
            make.width.equalTo(64)
        }
        
        matchStart.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(4)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        
        minuteMatch.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(4)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        
        dividerLine.snp.makeConstraints{ make in
            make.leading.equalTo(timeCell.snp.trailing)
            make.centerY.equalToSuperview()
        }
        
        homeTeamCell.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(80)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.width.equalTo(216)
        }
        
        homeTeamLogo.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(16)
        }
        
        homeTeamName.snp.makeConstraints{ make in
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(192)
        }
        
        awayTeamCell.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(80)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(16)
            make.width.equalTo(216)
        }
        
        awayTeamLogo.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(16)
        }
        
        awayTeamName.snp.makeConstraints{ make in
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(192)
        }
        
        homeTeamGoals.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(312)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.width.equalTo(32)
        }
        
        awayTeamGoals.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(312)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(16)
            make.width.equalTo(32)
        }
    }
    
    func matchInfo(with match: Match){
        matchStart.text = match.matchStart
        minuteMatch.text = match.minute
        homeTeamLogo.image = match.HTLogo
        awayTeamLogo.image = match.ATLogo
        homeTeamName.text = match.HTName
        awayTeamName.text = match.ATName
        homeTeamGoals.text = match.HTGString
        awayTeamGoals.text = match.ATGString
    }
}
