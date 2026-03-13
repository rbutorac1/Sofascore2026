//
//  ViewController.swift
//  sofascore
//
//  Created by akademija on 06.03.2026..
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let leagueView = LeagueView()
    let matchView1 = MatchView()
    let matchView2 = MatchView()
    let matchView3 = MatchView()
    let matchView4 = MatchView()
    
    
    func matchColors(MV: MatchView, match: Match){
        MV.MatchStart.text = match.matchStart
        MV.MatchStart.textColor = match.matchStartColor
        MV.MinuteMatch.text = match.minute
        MV.MinuteMatch.textColor = match.minuteColor
        MV.HomeTeamName.textColor = match.HTNameColor
        MV.AwayTeamName.textColor = match.ATNameColor
        MV.HomeTeamGoals.text = match.HTGString
        MV.HomeTeamGoals.textColor = match.HTScoreColor
        MV.AwayTeamGoals.text = match.ATGString
        MV.AwayTeamGoals.textColor = match.ATScoreColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(leagueView)
        view.addSubview(matchView1)
        view.addSubview(matchView2)
        view.addSubview(matchView3)
        view.addSubview(matchView4)
        
        
        let LaLiga = League(
            logo: UIImage(named: "LaLiga"),
            name: "LaLiga",
            country: "Spain"
        )
        
        let match1 = Match(
            matchStartTimestamp: 1773394200,
            HTLogo: UIImage(named: "Manchester United"),
            ATLogo: UIImage(named: "Barcelona"),
            HTName: "Manchester United",
            ATName: "Barcelona",
            HTGoals: 1,
            ATGoals: 2
        )
        
        let match2 = Match(
            matchStartTimestamp: 1773405000,
            HTLogo: UIImage(named: "Manchester United"),
            ATLogo: UIImage(named: "Barcelona"),
            HTName: "Manchester United",
            ATName: "Barcelona",
            HTGoals: 0,
            ATGoals: 1
        )
        
        let match3 = Match(
            matchStartTimestamp: 1773421200,
            HTLogo: UIImage(named: "Manchester United"),
            ATLogo: UIImage(named: "Barcelona"),
            HTName: "Manchester United",
            ATName: "Barcelona",
            HTGoals: 2,
            ATGoals: 2
        )
        
        let match4 = Match(
            matchStartTimestamp: 1773426600,
            HTLogo: UIImage(named: "Manchester United"),
            ATLogo: UIImage(named: "Barcelona"),
            HTName: "Manchester United",
            ATName: "Barcelona",
            HTGoals: 0,
            ATGoals: 0
        )
        
        leagueView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(192)
        }
        
        matchView1.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(248)
        }
        
        matchView2.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(304)
        }
        
        matchView3.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(360)
        }
        
        matchView4.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(416)
        }
        
        leagueView.leagueInfo(with: LaLiga)
        
        matchView1.MatchInfo(with: match1)
        matchColors(MV: matchView1, match: match1)
        
        matchView2.MatchInfo(with: match2)
        matchColors(MV: matchView2, match: match2)
        
        matchView3.MatchInfo(with: match3)
        matchColors(MV: matchView3, match: match3)
        
        matchView4.MatchInfo(with: match4)
        matchColors(MV: matchView4, match: match4)
    }
}

