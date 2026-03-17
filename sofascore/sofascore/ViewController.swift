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
    
    func matchColors(MV: MatchView, match: Match){
        MV.matchStart.text = match.matchStart
        MV.matchStart.textColor = Colors.matchStartColor
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
        leagueView.leagueInfo(with: Leagues.laLiga)
        
        matchView1.matchInfo(with: Matches.match1)
        matchColors(MV: matchView1, match: Matches.match1)
        
        matchView2.matchInfo(with: Matches.match2)
        matchColors(MV: matchView2, match: Matches.match2)
        
        matchView3.matchInfo(with: Matches.match3)
        matchColors(MV: matchView3, match: Matches.match3)
        
        matchView4.matchInfo(with: Matches.match4)
        matchColors(MV: matchView4, match: Matches.match4)
    }
}

