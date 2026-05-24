//
//  LoginView.swift
//  sofascore
//
//  Created by akademija on 22.05.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class LoginView: BaseView {
    
    let title: UILabel = UILabel()
    let logo: UIImageView = UIImageView()
    
    let userInfo: UIView = UIView()
    let usernameBox: UITextField = UITextField()
    let passwordBox: UITextField = UITextField()
    
    let loginButton: UIButton = UIButton()
    
    var loginTap: ((String, String) -> Void)?
    
    override func addViews(){
        addSubview(title)
        addSubview(logo)
        addSubview(userInfo)
        addSubview(loginButton)
        
        userInfo.addSubview(usernameBox)
        userInfo.addSubview(passwordBox)
    }
    
    override func styleViews(){
        self.backgroundColor = .blue
        
        title.text = "Every game counts."
        title.textColor = .white
        title.font = Fonts.RobotoBoldTitle20
        title.textAlignment = .center
        
        logo.image = Images.sofa
        logo.contentMode = .scaleAspectFit
        
        usernameBox.backgroundColor = .white
        usernameBox.placeholder = "Username"
        usernameBox.borderStyle = .roundedRect
        
        passwordBox.backgroundColor = .white
        passwordBox.placeholder = "Password"
        passwordBox.borderStyle = .roundedRect
        passwordBox.isSecureTextEntry = true
        
        loginButton.backgroundColor = .white
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    enum Measures {
        
        static let logoTop = 250
        static let logoWidth = 200
        static let logoHeight = 50
        
        static let textBottom = 30
        static let textWidth = 200
        static let textHeight = 32
        
        static let logoInfo = 10
        static let infoHeight = 200
        
        static let textBoxTop = 15
        static let textBoxHeight = 35
        
        static let buttonTop = 20
        static let buttonHeight = 80
        static let buttonWidth = 30
    }
    
    override func setupConstraints(){
        logo.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(Measures.logoTop)
            make.width.equalTo(Measures.logoWidth)
            make.height.equalTo(Measures.logoHeight)
            make.centerX.equalToSuperview()
        }
        
        title.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().inset(Measures.textBottom)
            make.height.equalTo(Measures.textHeight)
            make.width.equalTo(Measures.textWidth)
            make.centerX.equalToSuperview()
        }
        
        userInfo.snp.makeConstraints{ make in
            make.top.equalTo(logo.snp.bottom).offset(Measures.logoInfo)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(Measures.infoHeight)
        }
        
        usernameBox.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.textBoxTop)
            make.width.equalToSuperview()
            make.height.equalTo(Measures.textBoxHeight)
            make.centerX.equalToSuperview()
        }
        
        passwordBox.snp.makeConstraints{ make in
            make.top.equalTo(usernameBox.snp.bottom).offset(Measures.textBoxTop)
            make.width.equalToSuperview()
            make.height.equalTo(Measures.textBoxHeight)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints{ make in
            make.top.equalTo(userInfo.snp.bottom).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func loginTapped(){
        let username = usernameBox.text ?? ""
        let password = passwordBox.text ?? ""
    
        loginTap?(username, password)
    }
}
