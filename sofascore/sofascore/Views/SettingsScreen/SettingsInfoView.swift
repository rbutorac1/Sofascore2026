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
    
    enum Measures {
        
        static let viewTop = 30
        static let viewHeight = 300
        
        static let textBoxTop = 10
        static let textBoxHeight = 32
        static let textBoxWidth = 200
        static let textBoxLeading = 20
        
        static let buttonWidth = 80
        static let buttonHeight = 30
        static let buttonTop = 30
    }
    
    let mainView: UIView = UIView()
    let user: UILabel = UILabel()
    let eventCount: UILabel = UILabel()
    let leagueCount: UILabel = UILabel()
    let logoutButton: UIButton = UIButton()
    
    let username = UserDefaults.standard.string(forKey: "username")
    var logoutTap: (() -> Void)?
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(user)
        mainView.addSubview(eventCount)
        mainView.addSubview(leagueCount)
        mainView.addSubview(logoutButton)
    }
    
    override func styleViews() {
        user.text = "User: \(username ?? "")"
        
        logoutButton.backgroundColor = .red
        logoutButton.setTitle("LOG OUT", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.layer.cornerRadius = 12
        logoutButton.titleLabel?.font = .systemFont(ofSize: 15)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    override func setupConstraints() {
        mainView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(Measures.viewTop)
            make.width.equalToSuperview()
            make.height.equalTo(Measures.viewHeight)
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
    
    @objc private func logoutTapped(){
        logoutTap?()
    }
}
