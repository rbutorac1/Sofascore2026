//
//  TeamDetailsTableView.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class TeamDetailsTableView: BaseView {
    
    enum Measures {
        
        static let headerHeight = 48
        static let coachCellHeight = 56
        static let playersCellHeight = 116
        static let venueCellHeight = 32
        static let footerHeight = 8
    }
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    let background: UIView = UIView()
    
    var scroll: ((CGFloat) -> Void)?
    var data: TeamData = TeamData()
    let sections: [Section] = [.teamInfo, .tournaments, .venue]
    
    override init(){
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PersonViewCell.self, forCellReuseIdentifier: "CoachCell")
        tableView.register(NumberPlayersCell.self, forCellReuseIdentifier: "PlayersCell")
        tableView.register(TournamentTableViewCell.self, forCellReuseIdentifier: "TournamentsCell")
        tableView.register(VenueCell.self, forCellReuseIdentifier: "VenueCell")
        tableView.register(TeamDetailsTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    
    override func addViews(){
        addSubview(tableView)
    }
    
    override func styleViews(){
        background.backgroundColor = Colors.eventBackground
        
        tableView.backgroundView = background
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
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

extension TeamDetailsTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) ->  Int {
        return sections.count
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .teamInfo:
            return 2
            
        case .tournaments:
            return 1
            
        case .venue:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .teamInfo:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoachCell", for: indexPath) as? PersonViewCell else {
                    return UITableViewCell()
                }
                
                if let manager = data.team?.manager {
                    cell.person.coachInfo(coach: manager)
                }
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell", for: indexPath) as? NumberPlayersCell else {
                    return UITableViewCell()
                }
                cell.number.foreignPlayers.configureNumbers(isForeign: true, number: data.getNumberForeign())
                cell.number.totalPlayers.configureNumbers(isForeign: false, number: data.getNumberTotal())
                return cell
                
            default:
                return UITableViewCell()
            }
            
        case .tournaments:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TournamentsCell", for: indexPath) as? TournamentTableViewCell else {
                return UITableViewCell()
            }
            let tournaments = data.tournaments
            cell.collection.configureCollection(with: tournaments)
            return cell
            
        case .venue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath) as? VenueCell else {
                return UITableViewCell()
            }
            if let venue = data.team?.venue {
                cell.venue.venueInfo(venue: venue)
            }
            return cell
        }
    }
}

extension TeamDetailsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case .teamInfo:
            switch indexPath.row {
            case 0:
                return CGFloat(Measures.coachCellHeight)
            case 1:
                return CGFloat(Measures.playersCellHeight)
            default:
                return 0
            }
            
        case .tournaments:
            return TournamentTableViewCell.getHeight(tournaments: data.tournaments)
            
        case .venue:
            return CGFloat(Measures.venueCellHeight)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Measures.headerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? TeamDetailsTableHeaderView else {
            return nil
        }
        header.configureHeader(section: sections[section])
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let lastSection = tableView.numberOfSections - 1
        if section == lastSection {
            return 0
        }
        
        return CGFloat(Measures.footerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let lastSection = tableView.numberOfSections - 1
        if section == lastSection {
            return nil
        }
        
        return SectionDividerView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        scroll?(scrollView.contentOffset.y)
    }
}
