//
//  PlayersTableView.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class PlayersTableView: BaseView {
    
    enum Measures {
        
        static let headerHeight = 48
        static let cellHeight = 64
    }
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    var scroll: ((CGFloat) -> Void)?
    var data: TeamData = TeamData()
    
    override init(){
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PersonViewCell.self, forCellReuseIdentifier: "PlayerCell")
        tableView.register(PlayerRoundTableHeader.self, forHeaderFooterViewReuseIdentifier: "PlayersHeader")
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
    
    func configure(with data: TeamData){
        self.data = data
        tableView.reloadData()
    }
}

extension PlayersTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) ->  Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PersonViewCell else {
            return UITableViewCell()
        }
        
        let player = data.players[indexPath.row]        
        cell.person.playerInfo(player: player)
        
        return cell
    }
}

extension PlayersTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Measures.headerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayersHeader") as? PlayerRoundTableHeader else {
            return nil
        }
        header.players()
        
        return header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        scroll?(scrollView.contentOffset.y)
    }
}
