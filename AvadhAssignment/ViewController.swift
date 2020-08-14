//
//  ViewController.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var types = ["Category", "Themes", "Trending"]
    var themes = ["Diversity & Inclusion", "Bold Biotech", "Crypto Central", "She runs it", "Clean & Green", "Cannabis-ness", "Power It", "Foodie Fun"]

    lazy var topView : ExplorerTopCollectionView = {
        let tpView = ExplorerTopCollectionView()
        tpView.callBackDidSelect = self.callBackDidSelect
        return tpView
    }()

    var categoryDataSourceDelegate : CategoryDataSourceDelegate?
    var trendingDataSourceDelegate : TrendingDataSourceDelegate?
    
    let tableView : UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .white
        return tbl
    }()
    
    let trendingTableView : UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .white
        return tbl
    }()
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.estimatedItemSize = .zero
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: "ThemesCollectionViewCell")
        return cv
    }()
    
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationBar()
        setupView()
        setupData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    private func setupNavigationBar() {
        self.title = "Explore"
        let menuBar = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(menuButtonClicked))
        menuBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = menuBar
        
        let notificatioBar = UIBarButtonItem(image: #imageLiteral(resourceName: "bell").withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(notificationButtonClicked))
        menuBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = notificatioBar
            
            
    }

    private func setupView() {
        self.view.addSubview(topView)
        topView.setHeightWidth(width: nil, height: 50)
        topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        topView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        topView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        topView.types = types
        
        self.view.addSubview(scrollView)
        self.scrollView.anchors(top: topView.bottomAnchor, left: topView.leftAnchor, right: topView.rightAnchor, bottom: nil, padding: .zero)
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        let contentView = UIView()
        contentView.backgroundColor = .clear
        
        self.scrollView.addSubview(contentView)
        contentView.fullFillOnSuperView()
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        contentView.addSubview(tableView)
        contentView.addSubview(collectionView)
        contentView.addSubview(trendingTableView)
        
        
        tableView.anchors(top: contentView.topAnchor, left: contentView.leftAnchor, right: nil, bottom: contentView.bottomAnchor)
        tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        
        collectionView.anchors(top: contentView.topAnchor, left: tableView.rightAnchor, right: nil, bottom: contentView.bottomAnchor)
        collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        
        trendingTableView.anchors(top: contentView.topAnchor, left: collectionView.rightAnchor, right: contentView.rightAnchor, bottom: contentView.bottomAnchor)
        trendingTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: 0).isActive = true
    }
    
    private func setupData() {
        
        let list = [CategoryItem(title: "Stocks", img: #imageLiteral(resourceName: "bitcoin"), bgColor: .rgb(red: 162, green: 163, blue: 249)),
                    CategoryItem(title: "ETFs", img: #imageLiteral(resourceName: "bitcoin"), bgColor: .rgb(red: 74, green: 78, blue: 202)),
                    CategoryItem(title: "Crypto", img: #imageLiteral(resourceName: "bitcoin"), bgColor: .rgb(red: 254, green: 216, blue: 83))]
        categoryDataSourceDelegate = CategoryDataSourceDelegate(list: list, tbl: tableView)
        
        let trendingList = [TrendingModel(title: "Top Gainers",
                                          list: [TrendingList(name: "Medifast",
                                                              details: "MEDI",
                                                              stock: "+50.78%",
                                                              img: #imageLiteral(resourceName: "gear")),
                                                 TrendingList(name: "Pinterest",
                                                              details: "PINS",
                                                              stock: "-4.77%",
                                                              img: #imageLiteral(resourceName: "gear")),
                                                 TrendingList(name: "Slack Technologies",
                                                              details: "WORK",
                                                              stock: "-5.99%",
                                                              img: #imageLiteral(resourceName: "gear")),
                                                 TrendingList(name: "Evoqua Water",
                                                              details: "AQUA",
                                                              stock: "+5.99%",
                                                              img: #imageLiteral(resourceName: "gear"))]),
                            TrendingModel(title: "Top Sellers",
                                          list: [TrendingList(name: "Slack Technologies",
                                                              details: "WORK",
                                                              stock: "-5.99%",
                                                              img: #imageLiteral(resourceName: "gear")),
                                                 TrendingList(name: "Evoqua Water",
                                                              details: "AQUA",
                                                              stock: "+5.99%",
                                                              img: #imageLiteral(resourceName: "gear")),
                                                 TrendingList(name: "Medifast",
                                                              details: "MEDI",
                                                              stock: "+50.78%",
                                                              img: #imageLiteral(resourceName: "gear")),
                                                 TrendingList(name: "Pinterest",
                                                              details: "PINS",
                                                              stock: "-4.77%",
                                                              img: #imageLiteral(resourceName: "gear"))])
        ]
        
        trendingDataSourceDelegate = TrendingDataSourceDelegate(list: trendingList, tbl: trendingTableView)
    }
    
    @objc private func menuButtonClicked() {
        
    }
    
    @objc private func notificationButtonClicked() {
        
    }
    
    func callBackDidSelect(index: Int) {
        let xPoint = scrollView.frame.width * CGFloat(index)
        scrollView.setContentOffset(CGPoint(x: xPoint, y: 0), animated: true)
    }
    

}


extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemesCollectionViewCell", for: indexPath) as! ThemesCollectionViewCell
        cell.titleLabel.text = themes[indexPath.row]
        cell.imgView.image = #imageLiteral(resourceName: "diversity")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let setHeight = (collectionView.frame.width / 2) + (UIFont.semiboldValueFont.lineHeight * 2)
        return .init(width: collectionView.frame.width / 2, height: setHeight)
    }
    
}
