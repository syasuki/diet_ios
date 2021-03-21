//
//  TestViewController.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/03/19.
//

import UIKit


class TestViewController: UIViewController {
    
    //@IBOutlet weak var collectionView: UICollectionView!
    let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let cellWidth = UIScreen.main.bounds.size.width / 2
    
    override func viewDidLoad() {
        let collectionView : UICollectionView = {
            //セルのレイアウト設計
            let layout: BidirectionalCollectionLayout = BidirectionalCollectionLayout()
            

        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height ), collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor.white
            //セルの登録
            collectionView.register(RecodeCollectionViewCell.self, forCellWithReuseIdentifier: "RecodeTableCell")
            return collectionView
        }()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        super.viewDidLoad()
    }
    
}

extension TestViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecodeTableCell", for: indexPath) as! RecodeCollectionViewCell
        let position = "\(indexPath.section) - \(indexPath.row)"
        cell.noteLabel.text = position
        
        if indexPath.section % 2 == 0 {
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .black
            } else {
                cell.backgroundColor = .white
            }
        } else {
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .white
            } else {
                cell.backgroundColor = .black
            }
        }

        return cell
    }
}

extension TestViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let position = "\(indexPath.section) - \(indexPath.row)"
        print("didSelect:", position)
    }
}

extension TestViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 200)
    }
    
}
