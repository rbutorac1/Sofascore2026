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
    
    let eventView: EventView = EventView()
    var event: Event?
    var league: League?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        configureView()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func addViews(){
        view.addSubview(eventView)
    }
    
    func styleViews(){
        view.backgroundColor = Colors.defaultBackgroundColor
    }
    
    func setupConstraints(){
        eventView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.viewHeight)
        }
    }
    
    func configureView(){
        guard let event = event,
              let league = event.league else {
            return
        }
        
        eventView.eventInfo(event: event, league: league)
    }
    
    func setupBindings(){
        eventView.eventLeague.arrowTap = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
