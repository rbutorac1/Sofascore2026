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
    
    let appearance: UINavigationBarAppearance = UINavigationBarAppearance()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        styleViews()
        safeAreaColor()
    }
    
    func styleViews(){
        view.backgroundColor = Colors.defaultBackgroundColor
        
        title = "Settings"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Dismiss",
            style: .plain,
            target: self,
            action: #selector(closeTapped)
        )
    }
    
    func safeAreaColor(){
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.sportSelectorBackgroundColor
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Colors.defaultBackgroundColor
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
        
    @objc func closeTapped(){
        dismiss(animated: true)
    }
}
