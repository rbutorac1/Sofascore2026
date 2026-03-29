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
    
    enum Measures {
        
        static let rowHeight = 56
        static let headerHeight = 56
        static let footerHeight = 8
    }
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    var data: Hw3Data = Hw3Data()
    var cellTap: ((IndexPath) -> Void)?
    
    override func addViews(){
        addSubview(tableView)
    }
    
    override func styleViews(){
        tableView.backgroundColor = Colors.defaultBackgroundColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = CGFloat(Measures.rowHeight)
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: "MatchCell")
        tableView.register(LeagueHeaderView.self, forHeaderFooterViewReuseIdentifier: "LeagueHeader")
        
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        
    }
    
    override func setupConstraints(){
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

extension MatchTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.leagues.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let league = data.leagues[section]
        return data.eventsDict[league]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as? MatchTableViewCell else {
            return UITableViewCell()
        }
        
        let league = data.leagues[indexPath.section]
        
        guard let event = data.eventsDict[league]?[indexPath.row] else {
            return cell
        }
        
        cell.matchView.matchInfo(with: event)
        
        return cell
    }
}

extension MatchTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Measures.headerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LeagueHeader") as? LeagueHeaderView else {
            return UIView()
        }
        
        let leagueName = data.leagues[section]
        let event = data.eventsDict[leagueName]?.first
        
        guard let league = event?.league else{
            return header
        }
        
        header.leagueView.leagueInfo(with: league)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let lastSection = tableView.numberOfSections - 1
        if section == lastSection { return 0 }
        
        return CGFloat(Measures.footerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let lastSection = tableView.numberOfSections - 1
        if section == lastSection { return nil }
        
        return SectionDividerView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        cellTap?(indexPath)
    }
}

