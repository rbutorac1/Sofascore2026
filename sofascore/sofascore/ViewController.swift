//
//  ViewController.swift
//  sofascore
//
//  Created by akademija on 06.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController {
    
    enum Measures {
        
        static let selectorHeight = 48
        static let headerHeight = 48
    }
    
    private let headerView: HeaderView = HeaderView()
    private let selectorView: SportSelectorView = SportSelectorView()
    private let tableView: MatchTableView = MatchTableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                    
        addViews()
        styleViews()
        setupConstraints()
        settingsButton()
        eventButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func addViews(){
        view.addSubview(headerView)
        view.addSubview(selectorView)
        view.addSubview(tableView)
    }
    

    func styleViews(){
        view.backgroundColor = Colors.sportSelectorBackgroundColor
    }
    
    func setupConstraints(){
        headerView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.headerHeight)
        }
        
        selectorView.snp.makeConstraints{ make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.selectorHeight)
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(selectorView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func settingsButton(){
        headerView.settingsTap = { [weak self] in
            guard let self = self else { return }
            
            let settingsVC = SettingsViewController()
            settingsVC.modalPresentationStyle = .fullScreen
            present(settingsVC, animated: true)
        }
    }
    
    func eventButton(){
        tableView.cellTap = { [weak self] indexPath in
            guard let self = self else { return }
            
            let eventVC = EventDetailsViewController()
            
            let league = tableView.data.leagues[indexPath.section]
            guard let selectedEvent = tableView.data.eventsDict[league]?[indexPath.row] else {
                return
            }
            
            eventVC.event = selectedEvent
            
            navigationController?.pushViewController(eventVC, animated: true)
        }
    }
}
