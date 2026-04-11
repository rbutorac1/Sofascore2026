//
//  EventView.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class EventView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 160
        static let leagueHeight = 48
        static let teamTopBottom = 16
        static let teamLeadingTrailing = 16
        static let resultTop = 16
        static let resultBottom = 40
        static let startTop = 24
        static let startBottom = 52
    }
    
    private let mainCell: UIView = UIView()
    private let homeTeam: EventTeamView = EventTeamView()
    private let awayTeam: EventTeamView = EventTeamView()
    private let result: EventResultView = EventResultView()
    private let start: EventStartView = EventStartView()
    let eventLeague: EventLeagueView = EventLeagueView()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(eventLeague)
        mainCell.addSubview(homeTeam)
        mainCell.addSubview(awayTeam)
        mainCell.addSubview(result)
        mainCell.addSubview(start)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = .white
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        eventLeague.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.leagueHeight)
        }
        
        homeTeam.snp.makeConstraints{ make in
            make.top.equalTo(eventLeague.snp.bottom).offset(Measures.teamTopBottom)
            make.leading.equalToSuperview().offset(Measures.teamLeadingTrailing)
            make.width.equalTo(EventTeamView.Measures.cellWidth)
        }
        
        awayTeam.snp.makeConstraints{ make in
            make.top.equalTo(eventLeague.snp.bottom).offset(Measures.teamTopBottom)
            make.trailing.equalToSuperview().inset(Measures.teamLeadingTrailing)
            make.width.equalTo(EventTeamView.Measures.cellWidth)
        }
        
        result.snp.makeConstraints{ make in
            make.top.equalTo(eventLeague.snp.bottom).offset(Measures.resultTop)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Measures.resultBottom)
        }
        
        start.snp.makeConstraints{ make in
            make.top.equalTo(eventLeague.snp.bottom).offset(Measures.startTop)
            make.leading.equalTo(homeTeam.snp.trailing)
            make.trailing.equalTo(awayTeam.snp.leading)
        }
    }
    
    func eventInfo(event: Event, league: League){
        if event.status == EventStatus.notStarted {
            result.isHidden = true
            
            start.resultInfo(timestamp: event.startTimestamp)
        } else {
            start.isHidden = true
            
            result.resultInfo(homeGoals: event.homeScore, awayGoals: event.awayScore, timestamp: event.startTimestamp, status: event.status)
        }
     
        eventLeague.leagueInfo(league: league)
        homeTeam.teamInfo(team: event.homeTeam)
        awayTeam.teamInfo(team: event.awayTeam)
    }
}

