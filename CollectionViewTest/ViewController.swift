//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by TK_User on 06.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupAll()
    }
    
    private func setupAll() {
        embedViews()
        setupLayout()
        setupAppereance()
        configureCollectionView()
    }
    
    private func embedViews() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    private func setupAppereance() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .orange
    }
    
    private func configureLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44.0)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section )
    }
    
    private func configureCollectionView() {
        
        collectionView.collectionViewLayout = configureLayout()
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: "NumberCell")
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
     }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "NumberCell",
            for: indexPath
        ) as! NumberCell

        cell.label.text = "\(indexPath.row)"
    
        return cell
    }
}
