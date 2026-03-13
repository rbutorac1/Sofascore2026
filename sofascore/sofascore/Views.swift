//
//  Views.swift
//  sofascore
//
//  Created by akademija on 11.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class LeagueView: BaseView {
    let MainCell = UIView()
    
    let TextCell = UIView()
    
    let LeagueImage = UIImageView()
    let CountryName = UILabel()
    let LeagueName = UILabel()
    let ArrowImage = UIImageView()
    
    
    override func addViews(){
        
        TextCell.addSubview(CountryName)
        TextCell.addSubview(ArrowImage)
        TextCell.addSubview(LeagueName)
        
        MainCell.addSubview(LeagueImage)
        MainCell.addSubview(TextCell)
        
        addSubview(MainCell)
    }
    
    override func styleViews(){
        MainCell.backgroundColor = .white
        TextCell.backgroundColor = .white
        
        CountryName.font = UIFont(name: "Roboto-Bold", size: 14)
        CountryName.textColor = .black
        CountryName.numberOfLines = 1
        
        LeagueName.font = UIFont(name: "Roboto-Bold", size: 14)
        LeagueName.textColor = .gray
        LeagueName.numberOfLines = 1
        
        ArrowImage.image = UIImage(named: "ic_pointer_right")
        
    }
    
    override func setupConstraints(){
        MainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(56)
        }
        
        LeagueImage.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(32)
            make.width.equalTo(32)
        }
        
        TextCell.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(80)
            make.height.equalTo(24)
        }
        
        CountryName.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        ArrowImage.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(CountryName.snp.trailing)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        LeagueName.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(ArrowImage.snp.trailing)
            make.height.equalTo(16)
            make.width.equalTo(91)
        }
    }
    
    func leagueInfo(with league: League){
        LeagueImage.image = league.logo
        CountryName.text = league.country
        LeagueName.text = league.name
    }
}

class MatchView: BaseView {
    let MainCell = UIView()
    
    let TimeCell = UIView()
    let MatchStart = UILabel()
    let MinuteMatch = UILabel()
    
    let DividerLine = UIImageView()
    
    let HomeTeamCell = UIView()
    let HomeTeamName = UILabel()
    let HomeTeamLogo = UIImageView()
    
    let AwayTeamCell = UIView()
    let AwayTeamName = UILabel()
    let AwayTeamLogo = UIImageView()
    
    let HomeTeamGoals = UILabel()
    let AwayTeamGoals = UILabel()
    
    override func addViews(){
        TimeCell.addSubview(MatchStart)
        TimeCell.addSubview(MinuteMatch)
        
        HomeTeamCell.addSubview(HomeTeamName)
        HomeTeamCell.addSubview(HomeTeamLogo)
        
        AwayTeamCell.addSubview(AwayTeamName)
        AwayTeamCell.addSubview(AwayTeamLogo)
        
        MainCell.addSubview(TimeCell)
        MainCell.addSubview(DividerLine)
        MainCell.addSubview(HomeTeamCell)
        MainCell.addSubview(AwayTeamCell)
        MainCell.addSubview(HomeTeamGoals)
        MainCell.addSubview(AwayTeamGoals)
        
        addSubview(MainCell)
    }
    
    override func styleViews(){
        MainCell.backgroundColor = .white
        
        TimeCell.backgroundColor = .white
        
        MatchStart.font = UIFont(name: "Roboto-Regular", size: 12)
        MatchStart.textColor = .gray
        MatchStart.textAlignment = .center
        
        MinuteMatch.font = UIFont(name: "Roboto-Regular", size: 12)
        MinuteMatch.textColor = .gray
        MinuteMatch.textAlignment = .center
        
        DividerLine.image = UIImage(named: "Assets Drawable")
        
        HomeTeamName.font = UIFont(name: "Roboto-Regular", size: 14)
        HomeTeamName.numberOfLines = 1
        AwayTeamName.font = UIFont(name: "Roboto-Regular", size: 14)
        AwayTeamName.numberOfLines = 1
        
        HomeTeamGoals.font = UIFont(name: "Roboto-Regular", size: 14)
        HomeTeamGoals.textAlignment = .right
        AwayTeamGoals.font = UIFont(name: "Roboto-Regular", size: 14)
        AwayTeamGoals.textAlignment = .right
        
    }
    
    override func setupConstraints(){
        MainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(56)
        }
        
        TimeCell.snp.makeConstraints{ make in
            make.leading.equalTo(MainCell.snp.leading)
            make.top.equalTo(MainCell.snp.top)
            make.height.equalTo(MainCell.snp.height)
            make.width.equalTo(64)
        }
        
        MatchStart.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(4)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        
        MinuteMatch.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(4)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        
        DividerLine.snp.makeConstraints{ make in
            make.leading.equalTo(TimeCell.snp.trailing)
            make.centerY.equalToSuperview()
        }
        
        HomeTeamCell.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(80)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.width.equalTo(216)
        }
        
        HomeTeamLogo.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(16)
        }
        
        HomeTeamName.snp.makeConstraints{ make in
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(192)
        }
        
        AwayTeamCell.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(80)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(16)
            make.width.equalTo(216)
        }
        
        AwayTeamLogo.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(16)
        }
        
        AwayTeamName.snp.makeConstraints{ make in
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(192)
        }
        
        HomeTeamGoals.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(312)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.width.equalTo(32)
        }
        
        AwayTeamGoals.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(312)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(16)
            make.width.equalTo(32)
        }
    }
    
    func MatchInfo(with match: Match){
        MatchStart.text = match.matchStart
        MinuteMatch.text = match.minute
        HomeTeamLogo.image = match.HTLogo
        AwayTeamLogo.image = match.ATLogo
        HomeTeamName.text = match.HTName
        AwayTeamName.text = match.ATName
        HomeTeamGoals.text = "\(match.HTGoals)"
        AwayTeamGoals.text = "\(match.ATGoals)"
    }
}

