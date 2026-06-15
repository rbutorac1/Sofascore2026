//
//  IncidentTableView.swift
//  sofascore
//
//  Created by akademija on 31.05.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class IncidentTableView: BaseView {
    
    enum Measures {
        
        static let periodCellHeight = 40
        static let incidentCellHeight = 56
        static let tableTopGap = 8
    }
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    private var incidents: [Incident] = []
    
    func configure(with incidents: [Incident]){
        self.incidents = Array(incidents.reversed())
        tableView.reloadData()
    }
    
    override init(){
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(IncidentCell.self, forCellReuseIdentifier: "IncidentCell")
        tableView.register(IncidentPeriodCell.self, forCellReuseIdentifier: "PeriodCell")
    }
    
    override func addViews(){
        addSubview(tableView)
    }
    
    override func styleViews(){
        tableView.backgroundColor = Colors.eventBackground
        
        tableView.separatorStyle = .none
        tableView.contentInset.top = CGFloat(Measures.tableTopGap)
        tableView.verticalScrollIndicatorInsets.top = CGFloat(Measures.tableTopGap)
    }
    
    override func setupConstraints(){
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

extension IncidentTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        incidents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let incident = incidents[indexPath.row]
        
        if(incident.type == IncidentType.periodEnd){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodCell", for: indexPath) as? IncidentPeriodCell else {
                return UITableViewCell()
            }
            
            cell.period.periodInfo(incident: incident)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentCell", for: indexPath) as? IncidentCell else {
                return UITableViewCell()
            }
            
            cell.incident.configureCell(incident: incident)
            return cell
        }
    }
}

extension IncidentTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let incident = incidents[indexPath.row]
        
        if(incident.type == IncidentType.periodEnd){
            return CGFloat(Measures.periodCellHeight)
        } else {
            return CGFloat(Measures.incidentCellHeight)
        }
    }
}
