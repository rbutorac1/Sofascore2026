//
//  TeamStandingsView.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class TeamStandingsView: BaseView {
    
    enum Measures {
        
        static let height = 48
        static let labelHeight = 16
        static let circleSize = 24
        static let circleTop = 12
        static let labelTop = 16
        static let labelWidth = 24
        static let teamWidth = 104
        static let goalsWidth = 40
        static let leadingOffset = 8
        static let statsWidth = 200
        static let trailingInset = 8
    }
    
    let mainCell: UIView = UIView()
    let positionCell: UIView = UIView()
    let statCell: UIView = UIView()
    
    let positionLabel: UILabel = UILabel()
    let teamNameLabel: UILabel = UILabel()
    let playedLabel: UILabel = UILabel()
    let winsLabel: UILabel = UILabel()
    let drawsLabel: UILabel = UILabel()
    let lossesLabel: UILabel = UILabel()
    let goalsLabel: UILabel = UILabel()
    let pointsLabel: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(positionCell)
        mainCell.addSubview(teamNameLabel)
        mainCell.addSubview(statCell)
        
        positionCell.addSubview(positionLabel)
    
        statCell.addSubview(playedLabel)
        statCell.addSubview(winsLabel)
        statCell.addSubview(drawsLabel)
        statCell.addSubview(lossesLabel)
        statCell.addSubview(goalsLabel)
        statCell.addSubview(pointsLabel)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        mainCell.applyFont(Fonts.RobotoCondensedRegularTitle14)
        
        positionCell.applyAlignment(.center)
        positionCell.backgroundColor = Colors.positionCircle
        positionCell.layer.cornerRadius = CGFloat(Measures.circleSize / 2)
        
        statCell.applyAlignment(.center)
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        positionCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.circleTop)
            make.leading.equalToSuperview().offset(Measures.leadingOffset)
            make.width.height.equalTo(Measures.circleSize)
        }
        
        positionLabel.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(Measures.labelHeight)
        }
        
        teamNameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.leading.equalTo(positionCell.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.teamWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        statCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.trailing.equalToSuperview().inset(Measures.trailingInset)
            make.height.equalTo(Measures.labelHeight)
            make.width.equalTo(Measures.statsWidth)
        }
        
        playedLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        winsLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(playedLabel.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        drawsLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(winsLabel.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        lossesLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(drawsLabel.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        goalsLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(lossesLabel.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.goalsWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        pointsLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(goalsLabel.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
    }
    
    func teamStandings(standings: Standings){
        positionLabel.text = String(standings.position)
        teamNameLabel.text = String(standings.team.name)
        playedLabel.text = String(standings.matches)
        winsLabel.text = String(standings.wins)
        drawsLabel.text = String(standings.draws)
        lossesLabel.text = String(standings.losses)
        goalsLabel.text = standings.scoreFormatted
        
        if let points = standings.points {
            pointsLabel.text = String(points)
        }
    }
}
