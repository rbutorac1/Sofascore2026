//
//  SettingsViewController.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class SettingsViewController: UIViewController {
    
    enum Measures {
        
        static let headerHeight = 48
    }
    
    let header: SettingsHeaderView = SettingsHeaderView()
    let safeAreaView: UIView = UIView()
    let info: SettingsInfoView = SettingsInfoView()
        
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        setupBindings()
        getRowCount()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func addViews(){
        view.addSubview(header)
        view.addSubview(safeAreaView)
        view.addSubview(info)
    }
    
    func styleViews(){
        view.backgroundColor = Colors.defaultBackgroundColor
        safeAreaView.backgroundColor = Colors.sofaColor
    }
    
    func setupConstraints(){
        safeAreaView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaInsets)
            make.bottom.equalTo(header.snp.top)
        }
        
        header.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.headerHeight)
        }
        
        info.snp.makeConstraints{ make in
            make.top.equalTo(header.snp.bottom)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func setupBindings(){
        header.arrowTap = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        info.logoutTap = { [weak self] in
            self?.logout()
        }
    }
    
    @objc private func logout(){
        do {
            try DatabaseManager.shared.deleteAllTables()
            try KeychainManager.shared.deleteToken()
            UserDefaults.standard.removeObject(forKey: "username")
            
            let loginVC = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            
            view.window?.rootViewController = navigationController
            view.window?.makeKeyAndVisible()
        } catch {
            print("Logout error: \(error)")
        }
    }
    
    func getRowCount(){
        do {
            let events = try DatabaseManager.shared.getEventCount()
            let leagues = try DatabaseManager.shared.getLeagueCount()
            
            info.eventCount.text = "Events: \(events)"
            info.leagueCount.text = "Leagues: \(leagues)"
        } catch {
            print("Count error: \(error)")
        }
    }
}
