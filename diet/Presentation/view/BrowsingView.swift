//
//  RecodeRegistView.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/14.
//

import UIKit
import Realm
import RealmSwift


class BrowsingView: DietView, UICollectionViewDelegate {
    let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let realm = try! Realm()
    fileprivate let fruits: [String] = ["2021/02/16 15:23", "2021/02/16", "2021/02/16", "2021/02/16", "2021/02/16", "2021/02/16", "2021/02/16", "2021/02/16"]
    override init() {
        super.init()
        setup()
    }
    private func setup(){
        let width = UIScreen.main.bounds.size.width
        self.backgroundColor = .white
        var height = 0
        let calenderView = UIView()
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.backgroundColor = .clear
        self.addSubview(calenderView)
        height+=40
        
        calenderView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        calenderView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        calenderView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        calenderView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        calenderView.addSubview(backButton)
        let dateButton = UIButton()
        dateButton.translatesAutoresizingMaskIntoConstraints = false
        calenderView.addSubview(dateButton)
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        calenderView.addSubview(nextButton)
        
        backButton.topAnchor.constraint(equalTo: calenderView.topAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: width / 3).isActive = true
        backButton.leftAnchor.constraint(equalTo: calenderView.leftAnchor).isActive = true
        backButton.rightAnchor.constraint(equalTo: dateButton.leftAnchor).isActive = true
        backButton.setTitle("戻る", for:UIControl.State.normal)
        backButton.backgroundColor = .lightBlue
        
        
        //calenderView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //backButton.backgroundColor = .red
        dateButton.topAnchor.constraint(equalTo: calenderView.topAnchor).isActive = true
        dateButton.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        dateButton.widthAnchor.constraint(equalToConstant: width / 3).isActive = true
        dateButton.leftAnchor.constraint(equalTo: backButton.rightAnchor).isActive = true
        dateButton.setTitle("2021/3/15", for:UIControl.State.normal)
        dateButton.backgroundColor = .lightBlue
        
        nextButton.topAnchor.constraint(equalTo: calenderView.topAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: width / 3).isActive = true
        nextButton.leftAnchor.constraint(equalTo: dateButton.rightAnchor).isActive = true
        nextButton.setTitle("進む", for:UIControl.State.normal)
        nextButton.backgroundColor = .lightBlue
        /*
        let inputView = UIStackView()
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.axis = .horizontal
        inputView.alignment = .fill
        inputView.distribution = .fill
        inputView.backgroundColor = .clear
        
        self.addSubview(inputView)
        height+=30
        inputView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        inputView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        inputView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        inputView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        let text = UILabel()
        text.text = "体重"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.widthAnchor.constraint(equalToConstant: 60).isActive = true
        text.backgroundColor = .clear
        inputView.addArrangedSubview(text)
        let inputField = UITextField()
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        inputField.borderStyle = .roundedRect
        inputView.addArrangedSubview(inputField)
        */
        
        let collectionView: UICollectionView = {
                //セルのレイアウト設計
                let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                //各々の設計に合わせて調整
                layout.scrollDirection = .vertical
                layout.minimumInteritemSpacing = 3
                layout.minimumLineSpacing = 3
                layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)

            let collectionView = UICollectionView( frame: CGRect(x: 0, y: CGFloat(height), width: screenSize.width, height: screenSize.height ), collectionViewLayout: layout)
                collectionView.backgroundColor = UIColor.white
                //セルの登録
                collectionView.register(RecodeCollectionViewCell.self, forCellWithReuseIdentifier: "RecodeTableCell")
                return collectionView
            }()
        collectionView.dataSource = self
        collectionView.delegate = self

        self.addSubview(collectionView)
        let addButton =  UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let addImage = UIImage(named:"add")!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        addButton.setImage(addImage, for: .normal)
        self.addSubview(addButton)
        addButton.rightAnchor.constraint(equalTo:self.rightAnchor, constant: -screenWidth/24*2).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: screenWidth/24*3).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: screenWidth/24*3).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -screenHeight/24*2.3).isActive = true
        addButton.backgroundColor = .orange
        addButton.layer.cornerRadius = 50
        addButton.layer.masksToBounds = false
        addButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOpacity = 0.5
        addButton.layer.shadowRadius = 3
        addButton.tintColor = .blue
        
        /*
        let recodeView = UIStackView()
        recodeView.translatesAutoresizingMaskIntoConstraints = false
        recodeView.axis = .vertical
        recodeView.alignment = .fill
        recodeView.distribution = .fillEqually
        self.addSubview(recodeView)
        recodeView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        recodeView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        recodeView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        recodeView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("bbbb", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let heightTF = UITextField()
        heightTF.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 38)
        // プレースホルダを設定
        heightTF.placeholder = "入力してください。"
        // キーボードタイプを指定
        heightTF.keyboardType = .decimalPad
        // 枠線のスタイルを設定
        heightTF.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        heightTF.returnKeyType = .done
        // テキストを全消去するボタンを表示
        heightTF.clearButtonMode = .always
        recodeView.addArrangedSubview(heightTF)
        let button1 = UIButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("bbbb", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        recodeView.addArrangedSubview(button)
        recodeView.addArrangedSubview(button1)
 */
    }
    required init?(coder adecoder: NSCoder) {
        super.init(coder: adecoder)
        setup()
    }

}

extension BrowsingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecodeTableCell", for: indexPath) as! RecodeCollectionViewCell

                let cellText = fruits[indexPath.item]
                cell.setupContents(textName: cellText)

                return cell
    }
}
extension BrowsingView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      //ここでは画面の横サイズの半分の大きさのcellサイズを指定
    return CGSize(width: (screenSize.width / 2.0)-5.5, height: screenSize.width / 2.0)
  }
}
