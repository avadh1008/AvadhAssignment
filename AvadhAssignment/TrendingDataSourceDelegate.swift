//
//  TrendingDataSourceDelegate.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

struct TrendingModel {
    let title : String
    let list : [TrendingList]
}

struct TrendingList {
    let name: String
    let details: String
    let stock: String
    let img : UIImage
}

class TrendingDataSourceDelegate: NSObject {

    //MARK:- Variable Properties
    
    fileprivate weak var tblView: UITableView?
    fileprivate var itemList: [TrendingModel]
    
    //MARK:- Initializer
    init(list: [TrendingModel], tbl: UITableView) {
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
        self.tblView?.estimatedSectionFooterHeight = UITableView.automaticDimension
        self.tblView?.sectionHeaderHeight = UITableView.automaticDimension
        self.tblView?.sectionFooterHeight = UITableView.automaticDimension
        
        self.tblView?.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.tblView?.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        
        self.tblView?.register(TrendingTableViewCell.self, forCellReuseIdentifier: "TrendingTableViewCell")
    }
    
}


extension TrendingDataSourceDelegate: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.textColor = .black
        label.font = .semiboldTitleFont
        label.text = itemList[section].title
        view.addSubview(label)
        label.fullFillOnSuperView(padding: .init(top: 20, left: 18, bottom: -20, right: 18))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        let item = itemList[indexPath.section].list[indexPath.row]
        
        cell.imgView.image = item.img
        cell.titleLabel.text = item.name
        cell.descriptionLabel.text = item.details
        cell.priceLabel.text = item.stock
        cell.priceLabel.superview?.backgroundColor = (item.stock.first == "+") ? .green : .red
        cell.sepView.isHidden = ((itemList[indexPath.section].list.count - 1) == indexPath.row)
        
        return cell
    }
}

//MARK:- UITableViewDelegate
extension TrendingDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.Table_View(tableView, didSelectRowAt: indexPath)
    }
    
}


class TrendingTableViewCell : UITableViewCell {
    
    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .semiboldSmallFont
        lbl.textColor = .black
        return lbl
    }()
    
    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .semiboldSmallestFont
        lbl.textColor = .lightGray
        return lbl
    }()
    
    let priceLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .semiboldSystemFont(withSize: 10)
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
        
        self.addSubview(imgView)
        
        imgView.anchors(top: self.topAnchor, left: self.leftAnchor, right: nil, bottom: self.bottomAnchor, padding: .init(top: 10, left: 20, bottom: -10, right: 0))
        imgView.setHeightWidth(width: 50, height: 50)
        
        let priaceView = UIView()
        self.addSubview(priaceView)
        priaceView.anchors(top: nil, left: nil, right: self.rightAnchor, bottom: nil, padding: .init(top: 0, left: 0, bottom: 0, right: -10))
        priaceView.setCenterXAndY(setX: nil, setY: true)
        
        priaceView.addSubview(priceLabel)
        priceLabel.fullFillOnSuperView(padding: .init(top: 5, left: 10, bottom: -5, right: -10))
        priceLabel.setContentHuggingPriority(.init(rawValue: 300), for: .horizontal)
        priceLabel.superview?.setContentHuggingPriority(.init(rawValue: 300), for: .horizontal)
        
        let centerView = UIView()
        self.addSubview(centerView)
        centerView.anchors(top: nil, left: imgView.rightAnchor, right: priaceView.leftAnchor, bottom: nil, padding: .init(top: 0, left: 10, bottom: 0, right: -10))
        centerView.centerYAnchor.constraint(equalTo: imgView.centerYAnchor, constant: 0).isActive = true
        
        centerView.addSubview(titleLabel)
        centerView.addSubview(descriptionLabel)
        titleLabel.anchors(top: centerView.topAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, bottom: nil)
        descriptionLabel.anchors(top: titleLabel.bottomAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, bottom: centerView.bottomAnchor)
        
        
        
        self.addSubview(sepView)
        sepView.anchors(top: nil, left: self.leftAnchor, right: self.rightAnchor, bottom: self.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        sepView.setHeightWidth(width: nil, height: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        priceLabel.superview?.setFullCornerRadius()
    }
}
