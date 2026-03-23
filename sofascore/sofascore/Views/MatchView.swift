//
//  MatchView.swift
//  sofascore
//
//  Created by akademija on 15.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

class MatchView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 56
        static let timeCellWidth = 64
        static let resultCellWidth = 64
    }
    
    let mainCell: UIView = UIView()
    let timeStatusCell: TimeStatusView = TimeStatusView()
    let teamSectionCell: TeamSectionView = TeamSectionView()
    let resultCell: ResultView = ResultView()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(timeStatusCell)
        mainCell.addSubview(teamSectionCell)
        mainCell.addSubview(resultCell)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = .white
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        timeStatusCell.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.timeCellWidth)
        }
        
        teamSectionCell.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(timeStatusCell.snp.trailing)
            make.trailing.equalTo(resultCell.snp.leading)
        }
        
        resultCell.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(Measures.timeCellWidth)
        }
    }
    
    func matchInfo(with event: Event){
        timeStatusCell.timeStatusInfo(startTimestamp: event.startTimestamp, status: event.status)
        teamSectionCell.teamsInfo(homeTeam: event.homeTeam, awayTeam: event.awayTeam, homeGoals: event.homeScore, awayGoals: event.awayScore, status: event.status)
        resultCell.resultInfo(homeGoals: event.homeScore, awayGoals: event.awayScore, status: event.status)
    }
}
