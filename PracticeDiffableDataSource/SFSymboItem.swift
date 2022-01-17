//
//  SFSymboItem.swift
//  PracticeDiffableDataSource
//
//  Created by 양호준 on 2022/01/17.
//

import UIKit

struct SFSymbolItem: Hashable { // diffable data source는 반드시 유일한 hash value를 가져야 한다. 
    let name: String
    let image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(systemName: name)!
    }
}
