# DiffableDataSource를 연습해보기 
참고: https://swiftsenpai.com/development/uicollectionview-list-basic/

### 1. SFSymbolItem에 왜 `Hashable` 프로토콜을 채택했을까?
[UICollectionViewDiffableDataSource](https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource)

선언부를 보면 다음과 같다. 
```swift
@MainActor class UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> : NSObject 
where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable
```


즉, `SectionIdentifier`나 ItemIdentifierType` 모두 Hashable이어야 한다. 따라서 ItemIdentifierType에 들어갈 SFSymbolItem 또한 Hashable을 채택해야 한다. 

### 2. DiffableDataSource를 자세히 알아보자~
DiffableDataSource는 컬렉션 뷰 객체와 함께 작동하는 특별한 타입의 data source이다. 
이는 컬렉션 뷰의 데이터와 UI에 대한 업데이트를 간단하고 효율적으로 할 수 있도록 도와준다. 또한 `UICollectionViewDataSource`도 채택하고 있어 프로토콜의 모든 메서드를 사용할 수 있다. 

그럼 컬렉션뷰의 데이터를 채우기 위해선 아래의 것들을 충족해야한다. 
1. diffable data source를 컬렉션 뷰에 연결한다. <br>
이를 연결하기 위해선 [`init(collectionView:cellProvider:)`](https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource/3255138-init)를 사용해야한다. 이때 cell provider는 UI에 데이터를 표시하는 방법을 결정해야 한다. <br>
```swift
dataSource = UICollectionViewDiffableDataSource<Int, UUID>(collectionView: collectionView) {
    (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: UUID) -> UICollectionViewCell? in
    // Configure and return cell.
}
```
2. 컬렉션 뷰의 셀을 구성하는 cell provider를 작동시킨다. 
3. 데이터의 현재 상태를 생성한다.<br>
이때는 snapshot를 구성하고 이를 적용하여 데이터의 현재 상태를 생성해야 한다. 
4. UI에 데이터를 보여준다. 

⚠️ 주의 
diffable data source로 데이터를 구성한 후 컬렉션 뷰의 data source를 변경하지말것!!
만약 새로운 데이터 소스가 필요하다면 다시 collectionView를 생성하고 diffable data source를 생성하자. 

### 3. [UICollectionView.CellRegistration](https://developer.apple.com/documentation/uikit/uicollectionview/cellregistration)
컬렉션뷰의 셀을 등록하고 셀을 구성하는 Generic Structure이다. 
```swift
struct CellRegistration<Cell, Item> where Cell : UICollectionViewCell
```
셀을 등록했으면 `dequeueConfiguredReusableCell(using:for:item:)` 메서드를 통해 등록한 셀을 전달해야 한다. 
이때 `register(_:forCellWithReuseIdentifier:)`나 `register(_:forCellWithReuseIdentifier:)`는 따로 호출하지 않아도 된다.

### 4. [NSDiffableDataSourceSnapshot](https://developer.apple.com/documentation/uikit/nsdiffabledatasourcesnapshot)
특정 시점에서의 데이터 상태를 나타낸다. 
snapshot을 사용하여 view에 표시되는 초기 데이터 상태를 설정하고, view에 표시되는 데이터 변경 사항을 반영하게 된다. 
```swift
snapshot = NSDiffableDataSourceSnapshot<Section, SFSymbolItem>()
snapshot.appendSections([.main])
snapshot.appendItems(dataItems, toSection: .main)
        
dataSource.apply(snapshot, animatingDifferences: false)
````
