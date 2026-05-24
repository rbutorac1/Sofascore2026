//
//  LoginViewController.swift
//  sofascore
//
//  Created by akademija on 23.05.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class LoginViewController: UIViewController {
    
    private let loginView: LoginView = LoginView()
    
    override func loadView(){
        view = loginView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        loginView.loginTap = { [weak self] username, password in
            self?.login(username: username, password: password)
        }
    }
    
    private func login(username: String, password: String){
        Task {
            do {
                let response = try await Authorization.login(username: username, password: password)
                
                UserDefaults.standard.set(response.name, forKey: "username")
                try KeychainManager.shared.saveToken(response.token)
                
                showEvents()
            } catch {
                print("Login error:", error)
            }
        }
    }
    
    private func showEvents(){
        let eventsVC = EventsViewController()
        let navigationController = UINavigationController(rootViewController: eventsVC)
        
        view.window?.rootViewController = navigationController
        view.window?.makeKeyAndVisible()
    }
}
