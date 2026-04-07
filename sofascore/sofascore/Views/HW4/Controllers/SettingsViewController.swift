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
    
    let header: settingsHeaderView = settingsHeaderView()
    let safeAreaView: UIView = UIView()
        
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        setupBindings()
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
    }
    
    func styleViews(){
        view.backgroundColor = Colors.defaultBackgroundColor
        safeAreaView.backgroundColor = Colors.safeAreaColor
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
    }
    
    func setupBindings(){
        header.arrowTap = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
