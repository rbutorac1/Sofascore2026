//
//  TeamDetailsViewController.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class TeamDetailsViewController: UIViewController {
    
    enum Measures {
        
        static let detailsCollapsedHeight = 40
        static let detailsHeight = 120
        static let selectorHeight = 48
    }
    
    let teamHeaderDetails: HeaderDetailsView = HeaderDetailsView()
    let tabSelector: HeaderSelectorView = HeaderSelectorView()
    let detailsTable: TeamDetailsTableView = TeamDetailsTableView()
    let playersTable: PlayersTableView = PlayersTableView()
    let teamData: TeamData = TeamData()
    
    var headerHeightConstraint: Constraint?
    var team: Team?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        setupBindings()
        configureTeamDetails()
        selectedTab()
    }
    
    func addViews(){
        view.addSubview(teamHeaderDetails)
        view.addSubview(tabSelector)
        view.addSubview(detailsTable)
        view.addSubview(playersTable)
    }
    
    func styleViews(){
        view.backgroundColor = Colors.sofaColor
        playersTable.isHidden = true
    }
    
    func setupConstraints(){
        teamHeaderDetails.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            headerHeightConstraint = make.height.equalTo(Measures.detailsHeight).constraint
        }
        
        tabSelector.snp.makeConstraints{ make in
            make.top.equalTo(teamHeaderDetails.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.selectorHeight)
        }
        
        detailsTable.snp.makeConstraints{ make in
            make.top.equalTo(tabSelector.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        playersTable.snp.makeConstraints{ make in
            make.top.equalTo(tabSelector.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupBindings(){
        detailsTable.scroll = { [weak self] offset in
            self?.headerHeight(scrollOffset: offset)
        }
        
        playersTable.scroll = { [weak self] offset in
            self?.headerHeight(scrollOffset: offset)
        }
        
        teamHeaderDetails.arrowTap = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func configureTeamDetails(){
        guard let team = team else {
            return
        }
        
        teamHeaderDetails.teamInfo(team: team)
        tabSelector.leagueOrTeamSelector(isLeague: false)
        Task {
            do {
                try await teamData.loadTeam(team: team)
                            
                playersTable.configure(with: teamData)
                detailsTable.configure(with: teamData)
            } catch {
                print("Details loading failed: ", error)
            }
        }
    }
    
    func selectedTab(){
        tabSelector.selected = { [weak self] selected in
            if(selected == "details"){
                self?.detailsTable.isHidden = false
                self?.playersTable.isHidden = true
            } else {
                self?.detailsTable.isHidden = true
                self?.playersTable.isHidden = false
            }
        }
    }
    
    func headerHeight(scrollOffset: CGFloat){
        let offset = max(0, scrollOffset)
        let newHeight = max(CGFloat(Measures.detailsCollapsedHeight), CGFloat(Measures.detailsHeight) - scrollOffset)
        
        let progress = min(1, offset / (CGFloat(Measures.detailsHeight) - CGFloat(Measures.detailsCollapsedHeight)))
        
        headerHeightConstraint?.update(offset: newHeight)
        teamHeaderDetails.collapsedProgress(progress)
        
        view.layoutIfNeeded()
    }
}
