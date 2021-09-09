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
    
    var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "Cream")
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: "DefaultItemCell")
        tableView.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuHeaderView")
        return tableView
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
        view.backgroundColor = .white
        
        menuTableView.dataSource = self
        menuTableView.delegate = self

        view.addSubview(menuHeaderView)
        view.addSubview(menuTableView)
    }
    
     func activateConstraints() {
        NSLayoutConstraint.activate([
            menuHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            menuHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            menuTableView.topAnchor.constraint(equalTo: menuHeaderView.bottomAnchor, constant: 24),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
// MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultItemCell") as! MenuItemTableViewCell
        cell.imageName = "drinks_coffee"
        cell.itemName = "Drip Coffee"
        cell.itemDescription = "Our daily house drip coffee"
        cell.itemPrice = 2.0
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as! MenuTableHeaderView
        if(section == 0) {
            cell.headerName = "Drinks"
        } else if(section == 1) {
            cell.headerName = "Food"
        } else if(section == 2) {
            cell.headerName = "Merch • Other"
        } else {
            cell.headerName = "Other"
        }
        return cell
    }
}
