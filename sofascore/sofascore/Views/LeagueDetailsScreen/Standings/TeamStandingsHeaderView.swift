//
//  TeamStandingsHeaderView.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class TeamStandingsHeaderView: UITableViewHeaderFooterView {
    
    enum Measures {
        
        static let labelHeight = 16
        static let labelTop = 16
        static let labelWidth = 24
        static let teamWidth = 104
        static let goalsWidth = 40
        static let leadingOffset = 8
        static let positionLeading = 16
        static let statsWidth = 200
        static let trailingInset = 8
        static let pointsWidth = 28
    }
    
    let mainCell: UIView = UIView()
    let statCell: UIView = UIView()
    
    let positionLabel: UILabel = UILabel()
    let teamNameLabel: UILabel = UILabel()
    let playedLabel: UILabel = UILabel()
    let winsLabel: UILabel = UILabel()
    let drawsLabel: UILabel = UILabel()
    let lossesLabel: UILabel = UILabel()
    let goalsLabel: UILabel = UILabel()
    let pointsLabel: UILabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        styleViews()
        setupConstraints()
        configureHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(positionLabel)
        mainCell.addSubview(teamNameLabel)
        mainCell.addSubview(statCell)
        
    
        statCell.addSubview(playedLabel)
        statCell.addSubview(winsLabel)
        statCell.addSubview(drawsLabel)
        statCell.addSubview(lossesLabel)
        statCell.addSubview(goalsLabel)
        statCell.addSubview(pointsLabel)
    }
    
    func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        mainCell.applyFont(Fonts.RobotoCondensedRegularTitle14)
        mainCell.applyColor(Colors.standingsHeader)
        
        statCell.applyAlignment(.center)
        
        configureHeader()
    }
    
    func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        positionLabel.snp.makeConstraints{ make in
            make.top.equalTo(Measures.labelTop)
            make.leading.equalTo(Measures.positionLeading)
            make.height.width.equalTo(Measures.labelHeight)
        }
        
        teamNameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.leading.equalTo(positionLabel.snp.trailing).offset(Measures.leadingOffset)
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
            make.width.equalTo(Measures.pointsWidth)
            make.height.equalTo(Measures.labelHeight)
        }
    }
    
    func configureHeader(){
        positionLabel.text = "#"
        teamNameLabel.text = "Team"
        playedLabel.text = "P"
        winsLabel.text = "W"
        drawsLabel.text = "D"
        lossesLabel.text = "L"
        goalsLabel.text = "Goals"
        pointsLabel.text = "PTS"
    }
}
