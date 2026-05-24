//
//  SettingsInfoView.swift
//  sofascore
//
//  Created by akademija on 24.05.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class SettingsInfoView: BaseView {
    
    let cell: UIView = UIView()
    let user: UILabel = UILabel()
    let eventCount: UILabel = UILabel()
    let leagueCount: UILabel = UILabel()
    let logoutButton: UIButton = UIButton()
    
    let username = UserDefaults.standard.string(forKey: "username")
    
    override func addViews(){
        addSubview(cell)
        
        cell.addSubview(user)
        cell.addSubview(eventCount)
        cell.addSubview(leagueCount)
        cell.addSubview(logoutButton)
    }
    
    var logoutTap: (() -> Void)?
    
    override func styleViews() {
        user.text = "User: \(username ?? "")"
        
        getRowCount()
        
        logoutButton.backgroundColor = .red
        logoutButton.setTitle("LOG OUT", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.layer.cornerRadius = 12
        logoutButton.titleLabel?.font = .systemFont(ofSize: 15)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    enum Measures {
        
        static let cellTop = 30
        static let cellHeight = 300
        
        static let textBoxTop = 10
        static let textBoxHeight = 32
        static let textBoxWidth = 200
        static let textBoxLeading = 20
        
        static let buttonWidth = 80
        static let buttonHeight = 30
        static let buttonTop = 30
    }
    
    override func setupConstraints() {
        cell.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(Measures.cellTop)
            make.width.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        user.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.textBoxTop)
            make.height.equalTo(Measures.textBoxHeight)
            make.width.equalTo(Measures.textBoxWidth)
            make.leading.equalToSuperview().offset(Measures.textBoxLeading)
        }
        
        eventCount.snp.makeConstraints{ make in
            make.top.equalTo(user.snp.bottom).offset(Measures.textBoxTop)
            make.height.equalTo(Measures.textBoxHeight)
            make.width.equalTo(Measures.textBoxWidth)
            make.leading.equalToSuperview().offset(Measures.textBoxLeading)
        }
        
        leagueCount.snp.makeConstraints{ make in
            make.top.equalTo(eventCount.snp.bottom).offset(Measures.textBoxTop)
            make.height.equalTo(Measures.textBoxHeight)
            make.width.equalTo(Measures.textBoxWidth)
            make.leading.equalToSuperview().offset(Measures.textBoxLeading)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(leagueCount.snp.bottom).offset(Measures.buttonTop)
            make.height.equalTo(Measures.buttonHeight)
            make.width.equalTo(Measures.buttonWidth)
            make.leading.equalToSuperview().offset(Measures.textBoxLeading)
        }
    }
    
    func getRowCount(){
        do {
            let events = try DatabaseManager.shared.getEventCount()
            let leagues = try DatabaseManager.shared.getLeagueCount()
            
            eventCount.text = "Events: \(events)"
            leagueCount.text = "Leagues: \(leagues)"
        } catch {
            print("Count error: \(error)")
        }
    }
    
    @objc private func logoutTapped(){
        logoutTap?()
    }
}
