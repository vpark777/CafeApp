//
//  MenuTableHeaderView.swift
//  CafeApp
//
//  Created by Victoria Park on 9/20/21.
//
// This file was copied directly from
// Mayuko's implementation. I had not
// created a separate view for the header

 import UIKit

 class MenuTableHeaderView: UITableViewHeaderFooterView {
     
     var filterButtonAction: (() -> Void)?
     var sortButtonAction:(()->Void)?
     
     var headerName: String = "" {
         didSet {
             let attributedString = NSMutableAttributedString(string: headerName)
             attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
             headerLabel.attributedText = attributedString
         }
     }
     
     var hideFilterAndSort: Bool = true {
         didSet {
             stackView.isHidden = hideFilterAndSort
         }
     }
     
     private var headerLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         label.textColor = .black
         label.textAlignment = .left
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
    private var bottomLineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named:"Navy")
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
     
     private let stackView: UIStackView = {
         let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.alignment = .top
         stackView.distribution = .fillProportionally
         stackView.isHidden = true
         return stackView
     }()
     
    private let emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:"cream")
        return view
    }()
     
     private let filterButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self,action:#selector(fButtonAction),for:.touchUpInside)
         button.setTitleColor(.gray, for: .normal)
         button.setTitle("filter", for: .normal)
         return button
     }()
     
     private let sortButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self,action:#selector(sButtonAction),for:.touchUpInside)
         button.setTitleColor(.gray, for: .normal)
         button.setTitle("sort", for: .normal)
         return button
     }()
     
     
     override init(reuseIdentifier: String?) {
         super.init(reuseIdentifier: reuseIdentifier)
         setupUI()
         activateConstraints()
     }
     @objc func sButtonAction(){
        sortButtonAction?()
     }
     @objc func fButtonAction(){
        filterButtonAction?()
     }
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         
         setupUI()
         activateConstraints()
        
     }
     
    private func setupUI() {
       // hideFilterAndSort = false
      
        contentView.backgroundColor = UIColor(named:"cream")
        contentView.addSubview(headerLabel)
        
        contentView.addSubview(bottomLineView)
        stackView.addArrangedSubview(emptyView)
        stackView.addArrangedSubview(filterButton)
        stackView.addArrangedSubview(sortButton)
        contentView.addSubview(stackView)
    }
     
     private func activateConstraints() {
         NSLayoutConstraint.activate([
             emptyView.heightAnchor.constraint(equalToConstant: 50),
             emptyView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -140),
            
             filterButton.heightAnchor.constraint(equalToConstant: 40),
             filterButton.widthAnchor.constraint(equalToConstant: 70),
             sortButton.heightAnchor.constraint(equalToConstant: 40),
             sortButton.widthAnchor.constraint(equalToConstant: 70),
             
             stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
             stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             stackView.bottomAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -8),
             
             headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
             headerLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
             headerLabel.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor, constant: -12),

             bottomLineView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
             bottomLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             bottomLineView.heightAnchor.constraint(equalToConstant: 1),
             bottomLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
         ])
         
     }
 }

 
