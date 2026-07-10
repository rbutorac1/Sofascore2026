//
//  LeagueDetailsViewController.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class LeagueDetailsViewController: UIViewController {
    
    enum Measures {
        
        static let detailsCollapsedHeight = 40
        static let detailsHeight = 120
        static let selectorHeight = 48
    }
    
    let leagueDetails: HeaderDetailsView = HeaderDetailsView()
    let tabSelector: HeaderSelectorView = HeaderSelectorView()
    let matchesTable: LeagueMatchesTableView = LeagueMatchesTableView()
    let standingsTable: LeagueStandingsTableView = LeagueStandingsTableView()
    let leagueData: LeagueData = LeagueData()
    
    var headerHeightConstraint: Constraint?
    var league: League?
    var sportName: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        setupBindings()
        configureLeague()
        selectedTab()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func addViews(){
        view.addSubview(leagueDetails)
        view.addSubview(tabSelector)
        view.addSubview(matchesTable)
        view.addSubview(standingsTable)
    }
    
    func styleViews(){
        view.backgroundColor = Colors.sofaColor
        
        leagueDetails.clipsToBounds = true
        
        standingsTable.isHidden = true
        tabSelector.leagueOrTeamSelector(isLeague: true)
    }
    
    func setupConstraints(){
        leagueDetails.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            headerHeightConstraint = make.height.equalTo(Measures.detailsHeight).constraint
        }
        
        tabSelector.snp.makeConstraints{ make in
            make.top.equalTo(leagueDetails.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.selectorHeight)
        }
        
        matchesTable.snp.makeConstraints{ make in
            make.top.equalTo(tabSelector.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        standingsTable.snp.makeConstraints{ make in
            make.top.equalTo(tabSelector.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupBindings(){
        matchesTable.scroll = { [weak self] offset in
            self?.headerHeight(scrollOffset: offset)
        }
        
        standingsTable.scroll = { [weak self] offset in
            self?.headerHeight(scrollOffset: offset)
        }
        
        leagueDetails.arrowTap = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        matchesTable.cellTap = { [weak self] indexPath in
            guard let self = self else { return }
            
            let eventVC = EventDetailsViewController()
            
            let round = matchesTable.data.rounds[indexPath.section]
            guard let selectedMatch = matchesTable.data.roundDict[round]?[indexPath.row] else {
                return
            }
            
            eventVC.event = selectedMatch
            eventVC.sportName = self.sportName ?? ""
            
            navigationController?.pushViewController(eventVC, animated: true)
        }
        
        standingsTable.cellTap = { [weak self] indexPath in
            guard let self = self else { return }
            
            let teamVC = TeamDetailsViewController()
            
            let team = standingsTable.data.standings[indexPath.row].team
            teamVC.team = team
            
            navigationController?.pushViewController(teamVC, animated: true)
        }
    }
    
    func configureLeague(){
        guard let league = league else {
            return
        }
        
        leagueDetails.leagueInfo(league: league)
        Task {
            do {
                try await leagueData.loadLeagueMatches(league: league)
                try await leagueData.loadLeagueStandings(league: league)
                
                matchesTable.configure(with: leagueData)
                standingsTable.configure(with: leagueData)
            } catch {
                print("League loading failed: ", error)
            }
        }
    }
    
    func selectedTab(){
        tabSelector.selected = { [weak self] selected in
            if(selected == "matches"){
                self?.matchesTable.isHidden = false
                self?.standingsTable.isHidden = true
            } else {
                self?.matchesTable.isHidden = true
                self?.standingsTable.isHidden = false
            }
        }
    }
    
    func headerHeight(scrollOffset: CGFloat){
        let offset = max(0, scrollOffset)
        let newHeight = max(CGFloat(Measures.detailsCollapsedHeight), CGFloat(Measures.detailsHeight) - scrollOffset)
        
        let progress = min(1, offset / (CGFloat(Measures.detailsHeight) - CGFloat(Measures.detailsCollapsedHeight)))
        
        headerHeightConstraint?.update(offset: newHeight)
        leagueDetails.collapsedProgress(progress)
        
        view.layoutIfNeeded()
    }
}
