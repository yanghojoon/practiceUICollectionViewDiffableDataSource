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
    }


}

