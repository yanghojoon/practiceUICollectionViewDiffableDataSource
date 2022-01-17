//
//  ViewController.swift
//  PracticeDiffableDataSource
//
//  Created by 양호준 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView!
    let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SFSymbolItem> { (cell, indexPath, item) in
        var content = cell.defaultContentConfiguration()
        content.image = item.image
        content.text = item.name
        
        cell.contentConfiguration = content
    }
    var dataSource: UICollectionViewDiffableDataSource<Section, SFSymbolItem>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, SFSymbolItem>!
    let dataItems = [
        SFSymbolItem(name: "mic"),
        SFSymbolItem(name: "mic.fill"),
        SFSymbolItem(name: "message"),
        SFSymbolItem(name: "message.fill"),
        SFSymbolItem(name: "sun.min"),
        SFSymbolItem(name: "sun.min.fill"),
        SFSymbolItem(name: "sunset"),
        SFSymbolItem(name: "sunset.fill"),
        SFSymbolItem(name: "pencil"),
        SFSymbolItem(name: "pencil.circle"),
        SFSymbolItem(name: "highlighter"),
        SFSymbolItem(name: "pencil.and.outline"),
        SFSymbolItem(name: "personalhotspot"),
        SFSymbolItem(name: "network"),
        SFSymbolItem(name: "icloud"),
        SFSymbolItem(name: "icloud.fill"),
        SFSymbolItem(name: "car"),
        SFSymbolItem(name: "car.fill"),
        SFSymbolItem(name: "bus"),
        SFSymbolItem(name: "bus.fill"),
        SFSymbolItem(name: "flame"),
        SFSymbolItem(name: "flame.fill"),
        SFSymbolItem(name: "bolt"),
        SFSymbolItem(name: "bolt.fill")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create List Layout
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        
        // Create CollectionView with List Layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        view.addSubview(collectionView)
        
        // Make collectionView's Layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        setupCell()
        setupSnapshot()
    }

    func setupCell() {
        dataSource = UICollectionViewDiffableDataSource<Section, SFSymbolItem>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: SFSymbolItem) -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration,
                                                                    for: indexPath,
                                                                    item: itemIdentifier)
            cell.accessories = [.disclosureIndicator()]
            
            return cell
        }
    }
    
    func setupSnapshot() {
        snapshot = NSDiffableDataSourceSnapshot<Section, SFSymbolItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(dataItems, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

