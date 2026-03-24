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
    
    let leagueView: LeagueView = LeagueView()
    var matchViews: [MatchView] = []
    let data: Hw2Data = Hw2Data()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        matchViews = data.events.map { _ in MatchView() }
        
        addViews()
        styleViews()
        setUpConstraints()
    }
    
    func addViews(){
        view.addSubview(leagueView)
        
        for matchView in matchViews {
            view.addSubview(matchView)
        }
    }
    
    func styleViews(){
        view.backgroundColor = .white

        leagueView.leagueInfo(with: data.laLiga)
        
        for i in 0..<matchViews.count{
            matchViews[i].matchInfo(with: data.events[i])
        }
    }
    
    func setUpConstraints(){
        leagueView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(192)
            make.leading.trailing.equalToSuperview()
        }
        
        matchViews[0].snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(248)
            make.leading.trailing.equalToSuperview()
        }
        
        matchViews[1].snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(304)
            make.leading.trailing.equalToSuperview()
        }
        
        matchViews[2].snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(360)
            make.leading.trailing.equalToSuperview()
        }
        
        matchViews[3].snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(416)
            make.leading.trailing.equalToSuperview()
        }
    }
}

