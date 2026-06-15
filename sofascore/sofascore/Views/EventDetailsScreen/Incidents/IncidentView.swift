//
//  IncidentView.swift
//  sofascore
//
//  Created by akademija on 31.05.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class IncidentView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 56
        static let homeAwayCellWidth = 64
    }
    
    let mainCell: UIView = UIView()
    let incidentDetails: IncidentInfoView = IncidentInfoView()
    let homeIncident: IncidentIconView = IncidentIconView()
    let awayIncident: IncidentIconView = IncidentIconView()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(incidentDetails)
        mainCell.addSubview(homeIncident)
        mainCell.addSubview(awayIncident)
    }
    
    override func styleViews(){
        backgroundColor = .white
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        homeIncident.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.homeAwayCellWidth)
        }
        
        awayIncident.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(Measures.homeAwayCellWidth)
        }
        
        incidentDetails.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(homeIncident.snp.trailing)
            make.trailing.equalTo(awayIncident.snp.leading)
        }
    }
    
    func configureCell(incident: Incident){
        incidentDetails.incidentInfo(incident: incident)
        
        guard let homeTeam = incident.isHomeTeam else {
            return
        }
        
        if(homeTeam){
            awayIncident.isHidden = true
            homeIncident.incidentInfo(incident: incident)
        } else {
            homeIncident.isHidden = true
            awayIncident.incidentInfo(incident: incident)
        }
    }
}
