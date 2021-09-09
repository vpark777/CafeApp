//
//  ViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 7/18/21.
//

import UIKit

class MenuViewController: UIViewController {
    
// MARK: - UI Component Declarations
    var menuHeaderView: MenuHeaderView = {
        let headerView = MenuHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    
// MARK: - Initializers

    init(withMenu: Menu) {
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
// MARK: - UI Setup Functions
    
     func setupUI() {
        view.addSubview(menuHeaderView)
    }
    
     func activateConstraints() {
        NSLayoutConstraint.activate([
            menuHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            menuHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
        ])
    }
    
// MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
