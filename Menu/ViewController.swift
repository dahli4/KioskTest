//
//  ViewController.swift
//  Menu
//
//  Created by A on 2023/12/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var customCollectionView: UICollectionView!
    
    private var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewDelegate()
        registerNib()
        setupFlowLayOut()
    }
    
    private func setupFlowLayOut(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.9, height: halfWidth * 0.9)
        flowLayout.footerReferenceSize = CGSize(width: halfWidth * 2, height: 170)
        flowLayout.sectionFootersPinToVisibleBounds = true
        self.customCollectionView.collectionViewLayout = flowLayout
    }
    private func collectionViewDelegate(){
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
    }
    
    private func registerNib(){
        let nibName = UINib(nibName: "MainMenu", bundle: nil)
        customCollectionView.register(nibName, forCellWithReuseIdentifier: "MainMenu")
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: "MainMenu", for: indexPath) as! MainMenu
        cell.someImage.image = data.imageArray[indexPath.row]
        return cell
    }
}
