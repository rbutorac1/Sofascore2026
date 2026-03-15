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
    
    let laLiga = League(
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
    
    
    func matchColors(MV: MatchView, match: Match){
        MV.matchStart.text = match.matchStart
        MV.matchStart.textColor = match.colors.matchStartColor
        MV.minuteMatch.text = match.minute
        MV.minuteMatch.textColor = match.minuteColor
        MV.homeTeamName.textColor = match.HTNameColor
        MV.awayTeamName.textColor = match.ATNameColor
        MV.homeTeamGoals.text = match.HTGString
        MV.homeTeamGoals.textColor = match.HTScoreColor
        MV.awayTeamGoals.text = match.ATGString
        MV.awayTeamGoals.textColor = match.ATScoreColor
    }
    
    func setUpConstraints(){
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
    }
    
    func styleViews(){
        leagueView.leagueInfo(with: laLiga)
        
        matchView1.MatchInfo(with: match1)
        matchColors(MV: matchView1, match: match1)
        
        matchView2.MatchInfo(with: match2)
        matchColors(MV: matchView2, match: match2)
        
        matchView3.MatchInfo(with: match3)
        matchColors(MV: matchView3, match: match3)
        
        matchView4.MatchInfo(with: match4)
        matchColors(MV: matchView4, match: match4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(leagueView)
        view.addSubview(matchView1)
        view.addSubview(matchView2)
        view.addSubview(matchView3)
        view.addSubview(matchView4)
        
        setUpConstraints()
        styleViews()
        
    }
}

