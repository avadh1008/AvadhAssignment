//
//  CategoryDataSourceDelegate.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

struct CategoryItem {
    let title : String
    let img : UIImage
    let bgColor : UIColor
}

class CategoryDataSourceDelegate: NSObject {

    //MARK:- Variable Properties
    
    fileprivate weak var tblView: UITableView?
    fileprivate var itemList: [CategoryItem]
    
    //MARK:- Initializer
    init(list: [CategoryItem], tbl: UITableView) {
        self.tblView = tbl
        self.itemList = list
        super.init()
        self.setup()
    }
    
    fileprivate func setup() {
        self.tblView?.backgroundColor = UIColor.clear
        self.tblView?.delegate = self
        self.tblView?.dataSource = self
        
        self.tblView?.separatorStyle = .none
        self.tblView?.estimatedRowHeight = 50
        self.tblView?.rowHeight = UITableView.automaticDimension
        self.tblView?.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.tblView?.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        self.tblView?.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        
    }
    
}


extension CategoryDataSourceDelegate: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        cell.titleLabel.text = itemList[indexPath.row].title
        cell.imgView.image = itemList[indexPath.row].img.withRenderingMode(.alwaysTemplate)
        cell.coverView.backgroundColor = itemList[indexPath.row].bgColor
        cell.sepView.isHidden = ((itemList.count - 1) == indexPath.row)

        return cell
    }
}

//MARK:- UITableViewDelegate
extension CategoryDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.Table_View(tableView, didSelectRowAt: indexPath)
    }
    
}



class CategoryTableViewCell : UITableViewCell {
    
    let coverView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .semiboldValueFont
        lbl.textColor = .white
        return lbl
    }()
    
    let imgView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()
    
    let sepView : UIView = {
        let sView = UIView()
        sView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return sView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.contentView.backgroundColor = .white
        self.addSubview(coverView)
        coverView.fullFillOnSuperView(padding: .init(top: 20, left: 20, bottom: -20, right: -20))
        
        coverView.addSubview(imgView)
        coverView.addSubview(titleLabel)
        
        imgView.anchors(top: coverView.topAnchor, left: coverView.leftAnchor, right: nil, bottom: coverView.bottomAnchor, padding: .init(top: 20, left: 30, bottom: -20, right: 0))
        imgView.setHeightWidth(width: 30, height: 30)
        
        titleLabel.anchors(top: nil, left: imgView.rightAnchor, right: coverView.rightAnchor, bottom: nil, padding: .init(top: 0, left: 20, bottom: 0, right: -20))
        titleLabel.centerYAnchor.constraint(equalTo: imgView.centerYAnchor, constant: 0).isActive = true
        
        self.addSubview(sepView)
        sepView.anchors(top: nil, left: self.leftAnchor, right: self.rightAnchor, bottom: self.bottomAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: -10))
        sepView.setHeightWidth(width: nil, height: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coverView.setFullCornerRadius()
    }
    
}

