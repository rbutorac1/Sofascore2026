//
//  EventDetailsViewController.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class EventDetailsViewController: UIViewController {
    
    enum Measures {
        
        static let viewHeight = 160
    }
    
    let safeAreaView: UIView = UIView()
    let eventView: EventView = EventView()
    let incidentsTable: IncidentTableView = IncidentTableView()
    let incidentsData = IncidentsData()
    var event: Event?
    var sportName: String = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        configureView()
        setupBindings()
        loadIncidents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func addViews(){
        view.addSubview(safeAreaView)
        view.addSubview(eventView)
        view.addSubview(incidentsTable)
        
        view.bringSubviewToFront(eventView)
    }
    
    func styleViews(){
        view.backgroundColor = Colors.defaultBackgroundColor
        safeAreaView.backgroundColor = Colors.defaultBackgroundColor
        view.bringSubviewToFront(safeAreaView)
        
        addShadow(opacity: 0.1, height: 3, radius: 4)
    }
    
    func setupConstraints(){
        safeAreaView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaInsets)
            make.bottom.equalTo(eventView.snp.top)
        }
        
        eventView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.viewHeight)
        }
        
        incidentsTable.snp.makeConstraints{ make in
            make.top.equalTo(eventView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureView() {
        guard let event = event else {
            return
        }
        
        eventView.eventInfo(event: event, sport: sportName)
    }
    
    func setupBindings(){
        eventView.eventLeague.arrowTap = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        eventView.eventLeague.leagueTap = { [weak self] league, sport in
            let vc = LeagueDetailsViewController()
            vc.league = league
            vc.sportName = sport
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        eventView.homeTeam.click = { [weak self] team in
            let vc = TeamDetailsViewController()
            vc.team = team
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        eventView.awayTeam.click = { [weak self] team in
            let vc = TeamDetailsViewController()
            vc.team = team
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func loadIncidents(){
        guard let event  = event else {
            return
        }
        
        Task {
            do {
                try await incidentsData.loadData(event: event)
                
                incidentsTable.configure(with: incidentsData.incidents)
            } catch {
                print("Incident loading failed: ", error)
            }
        }
    }
    
    func addShadow(opacity: Float, height: Int, radius: CGFloat){
        eventView.layer.shadowColor = UIColor.black.cgColor
        eventView.layer.shadowOpacity = opacity
        eventView.layer.shadowOffset = CGSize(width: 0, height: height)
        eventView.layer.shadowRadius = radius
        eventView.layer.masksToBounds = false
    }
}
