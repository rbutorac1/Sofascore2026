//
//  LeagueStandingsTableView.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class LeagueStandingsTableView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 48
    }
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    var scroll: ((CGFloat) -> Void)?
    var cellTap: ((IndexPath) -> Void)?
    var data: LeagueData = LeagueData()
    
    override init(){
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TeamStandingsCell.self, forCellReuseIdentifier: "TeamStandingsCell")
        tableView.register(TeamStandingsHeaderView.self, forHeaderFooterViewReuseIdentifier: "StandingsHeaderView")
    }
    
    override func addViews(){
        addSubview(tableView)
    }
    
    override func styleViews(){
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        tableView.rowHeight = CGFloat(Measures.cellHeight)
    }
    
    override func setupConstraints(){
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with data: LeagueData){
        self.data = data
        tableView.reloadData()
    }
}

extension LeagueStandingsTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) ->  Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamStandingsCell", for: indexPath) as? TeamStandingsCell else {
            return UITableViewCell()
        }
        
        let teamStandings = data.standings[indexPath.row]

        cell.standings.teamStandings(standings: teamStandings)
        
        return cell
    }
}

extension LeagueStandingsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Measures.cellHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StandingsHeaderView") as? TeamStandingsHeaderView else {
            return nil
        }
        
        return header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        scroll?(scrollView.contentOffset.y)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        cellTap?(indexPath)
    }
}
