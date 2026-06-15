//
//  IncidentInfoView.swift
//  sofascore
//
//  Created by akademija on 31.05.2026..
//

import UIKit
import SofaAcademic
import SnapKit

class IncidentInfoView: BaseView {
    
    enum Measures {
        
        static let leadingTrailingOffset = 12
        static let nameHeight = 16
        static let descHeight = 16
        static let resultLeadingTrailing = 8
        static let resultTopBottom = 14
        static let resultNameGap = 28
        static let resultHeight = 28
        static let resultWidth = 64
        static let playerGoalTopBottom = 20
        static let playerGoalHeight = 16
        static let dividerOffset = 8
    }
    
    let mainCell: UIView = UIView()
    
    let playerNameHome: UILabel = UILabel()
    let playerNameAway: UILabel = UILabel()
    
    let playerNameGoalHome: UILabel = UILabel()
    let playerNameGoalAway: UILabel = UILabel()
    
    let resultHome: UILabel = UILabel()
    let resultAway: UILabel = UILabel()

    let incDescriptionHome: UILabel = UILabel()
    let incDescriptionAway: UILabel = UILabel()
    
    let periodEnd: UIView = UIView()
    let periodText: UILabel = UILabel()
    
    let dividerHome: UIImageView = UIImageView()
    let dividerAway: UIImageView = UIImageView()

    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(playerNameHome)
        mainCell.addSubview(playerNameAway)
        
        mainCell.addSubview(playerNameGoalHome)
        mainCell.addSubview(playerNameGoalAway)
        
        mainCell.addSubview(resultHome)
        mainCell.addSubview(resultAway)
        
        mainCell.addSubview(incDescriptionHome)
        mainCell.addSubview(incDescriptionAway)
        
        mainCell.addSubview(periodEnd)
        periodEnd.addSubview(periodText)
        
        mainCell.addSubview(dividerHome)
        mainCell.addSubview(dividerAway)
    }
    
    override func styleViews(){
        playerNameHome.font = Fonts.RobotoRegularTitle14
        incDescriptionHome.textColor = .lightGray
        incDescriptionHome.font = Fonts.RobotoCondensedRegularTitle12
        
        playerNameAway.font = Fonts.RobotoRegularTitle14
        playerNameAway.textAlignment = .right
        incDescriptionAway.textColor = .lightGray
        incDescriptionAway.textAlignment = .right
        incDescriptionAway.font = Fonts.RobotoCondensedRegularTitle12
        
        resultHome.font = Fonts.RobotoBoldTitle20
        resultHome.textAlignment = .right
        playerNameGoalHome.font = Fonts.RobotoRegularTitle14
        
        resultAway.font = Fonts.RobotoBoldTitle20
        resultAway.textAlignment = .left
        playerNameGoalAway.font = Fonts.RobotoRegularTitle14
        playerNameGoalAway.textAlignment = .right
        
        dividerHome.image = Images.divider
        dividerAway.image = Images.divider
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        playerNameHome.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.leadingTrailingOffset)
            make.leading.equalToSuperview().offset(Measures.leadingTrailingOffset)
            make.trailing.equalToSuperview()
            make.height.equalTo(Measures.nameHeight)
        }
        
        incDescriptionHome.snp.makeConstraints{ make in
            make.top.equalTo(playerNameHome.snp.bottom)
            make.height.equalTo(Measures.descHeight)
            make.leading.equalToSuperview().offset(Measures.leadingTrailingOffset)
            make.trailing.equalToSuperview()
        }
        
        playerNameAway.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.leadingTrailingOffset)
            make.trailing.equalToSuperview().inset(Measures.leadingTrailingOffset)
            make.leading.equalToSuperview()
            make.height.equalTo(Measures.nameHeight)
        }
        
        incDescriptionAway.snp.makeConstraints{ make in
            make.top.equalTo(playerNameHome.snp.bottom)
            make.height.equalTo(Measures.descHeight)
            make.trailing.equalToSuperview().inset(Measures.leadingTrailingOffset)
            make.leading.equalToSuperview()
        }
        
        resultHome.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(Measures.resultLeadingTrailing)
            make.top.equalToSuperview().offset(Measures.resultTopBottom)
            make.height.equalTo(Measures.resultHeight)
            make.width.equalTo(Measures.resultWidth)
        }
        
        playerNameGoalHome.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.playerGoalTopBottom)
            make.leading.equalTo(resultHome.snp.trailing).offset(Measures.resultNameGap)
            make.trailing.equalToSuperview()
            make.height.equalTo(Measures.playerGoalHeight)
        }
        
        resultAway.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(Measures.resultLeadingTrailing)
            make.top.equalToSuperview().offset(Measures.resultTopBottom)
            make.height.equalTo(Measures.resultHeight)
            make.width.equalTo(Measures.resultWidth)
        }
        
        playerNameGoalAway.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.playerGoalTopBottom)
            make.trailing.equalTo(resultAway.snp.leading).offset(-Measures.resultNameGap)
            make.leading.equalToSuperview()
            make.height.equalTo(Measures.playerGoalHeight)
        }
        
        dividerHome.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.dividerOffset)
            make.bottom.equalToSuperview().offset(-Measures.dividerOffset)
            make.leading.equalToSuperview()
        }
        
        dividerAway.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.dividerOffset)
            make.bottom.equalToSuperview().offset(-Measures.dividerOffset)
            make.trailing.equalToSuperview()
        }
    }
    
    func incidentInfo(incident: Incident){
        guard let homeTeam = incident.isHomeTeam else {
            return
        }
        
        if(homeTeam){
            dividerAway.isHidden = true
            playerNameAway.isHidden = true
            playerNameGoalAway.isHidden = true
            resultAway.isHidden = true
            incDescriptionAway.isHidden = true

            if(incident.type == IncidentType.goal){
                playerNameGoalHome.text = incident.player
                resultHome.text = incident.score
                
                playerNameHome.isHidden = true
                incDescriptionHome.isHidden = true
            } else {
                playerNameHome.text = incident.player
                incDescriptionHome.text = incident.description
                
                playerNameGoalHome.isHidden = true
                resultHome.isHidden = true
            }
        } else {
            dividerHome.isHidden = true
            playerNameHome.isHidden = true
            playerNameGoalHome.isHidden = true
            resultHome.isHidden = true
            incDescriptionHome.isHidden = true
            
            if(incident.type == IncidentType.goal){
                playerNameGoalAway.text = incident.player
                resultAway.text = incident.score
                
                playerNameAway.isHidden = true
                incDescriptionAway.isHidden = true
            } else {
                playerNameAway.text = incident.player
                incDescriptionAway.text = incident.description
                
                playerNameGoalAway.isHidden = true
                resultAway.isHidden = true
            }
        }
    }
}
