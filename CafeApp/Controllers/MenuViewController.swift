//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController{
    
    let menu = Menu()
    var sections:[[MenuItem]]?
    
    override func loadView() {
        let mainView = MainView(dataSource:self, tvDelegate:self)
        view = mainView
        sections = [menu.drinks,menu.foods,menu.merchAndOthers]
    }
    
}

extension MenuViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections?[section]
        return section?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        let section = indexPath.section
        let item = sections?[section][indexPath.row]
        if let item = item{
            if let image = UIImage(named:item.imageName){
                cell.productImage.image = image
            }
            cell.priceLabel.text = String(format: "$%.2f", item.price)
            cell.descriptionLabel.text = item.description
            cell.nameLabel.text = item.name
        }
        return cell
    }
}

extension MenuViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        sections?.count ?? 0
    }
    
   // I liked Mayuko's implementation since she set the constraints to items
    // relative to the contentView of cell, allowing space. This works too
    // but without this function setting cell height, my cells get very compact since
    // I didn't write in top and bottom anchor constants
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as? MenuTableHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            headerView.headerName = "Drinks"
            headerView.hideFilterAndSort = false
        case 1:
            headerView.headerName = "Food"
        case 2:
            headerView.headerName = "Merch • Other"
        default:
            headerView.headerName = "Other"
        }
        
        return headerView
    }
}
