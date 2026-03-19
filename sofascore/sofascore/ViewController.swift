//
//  ViewController.swift
//  sofascore
//
//  Created by akademija on 06.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController {
    
    let leagueView = LeagueView()
    let matchView1 = MatchView()
    let matchView2 = MatchView()
    let matchView3 = MatchView()
    let matchView4 = MatchView()
    let data = Hw2Data()
    
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
        MV.homeTeamGoals.text = match.HTGoalsString
        MV.homeTeamGoals.textColor = match.HTScoreColor
        MV.awayTeamGoals.text = match.ATGoalsString
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
        leagueView.leagueInfo(with: data.laLiga)
        
        matchView1.matchInfo(with: data.matches[0])
        matchColors(MV: matchView1, match: data.matches[0])
        
        matchView2.matchInfo(with: data.matches[1])
        matchColors(MV: matchView2, match: data.matches[1])
        
        matchView3.matchInfo(with: data.matches[2])
        matchColors(MV: matchView3, match: data.matches[2])
        
        matchView4.matchInfo(with: data.matches[3])
        matchColors(MV: matchView4, match: data.matches[3])
    }
}

