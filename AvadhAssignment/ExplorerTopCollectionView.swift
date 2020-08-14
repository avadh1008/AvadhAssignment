//
//  ExplorerTopCollectionView.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

class ExplorerTopCollectionView : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.estimatedItemSize = .zero
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: "TopCollectionViewCell")
        return cv
    }()
    
    var callBackDidSelect : ((Int) -> Void)?
    
    var types : [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    public private(set) var selectedRow : Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.addSubview(collectionView)
        collectionView.fullFillOnSuperView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
        cell.titleLabel.text = types[indexPath.row]
        cell.titleLabel.textColor = (selectedRow == indexPath.row) ? UIColor.rgb(red: 78, green: 76, blue: 197) : .black
        cell.bottomView.backgroundColor = (selectedRow == indexPath.row) ? UIColor.rgb(red: 78, green: 76, blue: 197) : .clear
        cell.sepView.isHidden = ((types.count - 1) == indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        collectionView.reloadData()
        callBackDidSelect?(selectedRow)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
}


class TopCollectionViewCell : UICollectionViewCell {
    
    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .regularTitleFont
        lbl.textColor = UIColor.rgb(red: 78, green: 76, blue: 197)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let sepView : UIView = {
        let sView = UIView()
        sView.backgroundColor = .lightGray
        return sView
    }()
    
    let bottomView : UIView = {
        let sView = UIView()
        sView.backgroundColor = UIColor.rgb(red: 78, green: 76, blue: 197)
        return sView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        addSubview(titleLabel)
        addSubview(sepView)
        addSubview(bottomView)
        
        titleLabel.anchorsGreaterThan(top: self.topAnchor, left: self.leftAnchor, right: sepView.leftAnchor, bottom: nil)
        
        titleLabel.setCenterXAndY(setX: true, setY: true)
        sepView.anchors(top: self.topAnchor, left: nil, right: self.rightAnchor, bottom: self.bottomAnchor, padding: .init(top: 5, left: 0, bottom: -5, right: 0))
        sepView.setHeightWidth(width: 1, height: nil)
        bottomView.anchors(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, bottom: self.bottomAnchor)
        bottomView.setHeightWidth(width: nil, height: 2)
    }
    
}
