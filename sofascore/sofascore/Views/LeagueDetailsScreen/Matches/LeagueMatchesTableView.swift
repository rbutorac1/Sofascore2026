//
//  LeagueTableView.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class LeagueMatchesTableView: BaseView {
    
    enum Measures {
        
        static let rowHeight = 56
        static let headerHeight = 48
    }
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    let background: UIView = UIView()
    
    var scroll: ((CGFloat) -> Void)?
    var cellTap: ((IndexPath) -> Void)?
    var data: LeagueData = LeagueData()
    
    override init(){
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LeagueMatchesCell.self, forCellReuseIdentifier: "LeagueMatchesCell")
        tableView.register(PlayerRoundTableHeader.self, forHeaderFooterViewReuseIdentifier: "LeagueRoundView")
    }
    
    override func addViews(){
        addSubview(tableView)
    }
    
    override func styleViews(){
        background.backgroundColor = Colors.eventBackground
        
        tableView.backgroundView = background
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        tableView.rowHeight = CGFloat(Measures.rowHeight)
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

extension LeagueMatchesTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) ->  Int {
        return data.rounds.count
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let round = data.rounds[section]
        return data.roundDict[round]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueMatchesCell", for: indexPath) as? LeagueMatchesCell else {
            return UITableViewCell()
        }
        
        let round = data.rounds[indexPath.section]
        
        guard let event = data.roundDict[round]?[indexPath.row] else {
            return cell
        }
        cell.match.matchInfoLeague(with: event)
        
        return cell
    }
}

extension LeagueMatchesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Measures.headerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LeagueRoundView") as? PlayerRoundTableHeader else {
            return nil
        }
        
        let round = data.rounds[section]
        header.roundNumber(number: round)
        
        return header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        scroll?(scrollView.contentOffset.y)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        cellTap?(indexPath)
    }
}
