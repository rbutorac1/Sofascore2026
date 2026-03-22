//
//  MatchTableView.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SofaAcademic
import SnapKit

class MatchTableView: BaseView {
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    var data: Hw3Data = Hw3Data()
    
    override func addViews(){
        addSubview(tableView)
    }
    
    enum Measures {
        
        static let rowHeight = 56
        static let headerHeight = 56
    }
    
    override func styleViews(){
        tableView.backgroundColor = Colors.defaultBackgroundColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = CGFloat(Measures.rowHeight)
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: "MatchCell")
        
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        
    }
    
    override func setupConstraints(){
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    var laLigaEvents: [Event] {
        data.events.filter { $0.league!.name == "La Liga"}
    }
    
    var premierLeagueEvents: [Event] {
        data.events.filter { $0.league!.name == "Premier League" }
    }
}

extension MatchTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return laLigaEvents.count
        }
        else {
            return premierLeagueEvents.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchTableViewCell
        
        let event: Event
        
        if indexPath.section == 0 {
            event = laLigaEvents[indexPath.row]
        }
        else {
            event = premierLeagueEvents[indexPath.row]
        }
        
        cell.matchView.matchInfo(with: event)
        
        return cell
    }
}

extension MatchTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection: Int) -> UIView? {
        let divider: SectionDividerView = SectionDividerView()
        return divider
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Measures.headerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = LeagueView()

        if section == 0 {
            header.leagueInfo(with: data.laLiga)
        }
        else {
            header.leagueInfo(with: data.premierLeague)
        }
        
        return header
    }
}
