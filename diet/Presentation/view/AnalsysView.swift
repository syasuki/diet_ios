//
//  AnalsysView.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/03.
//

import UIKit
import RealmSwift
@IBDesignable
class AnalsysView: DietView {

    override init() {
        super.init()
        setup()
    }
    func setup(){
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        self.backgroundColor = .white
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
    }
    required init?(coder adecoder: NSCoder) {
        super.init(coder: adecoder)
        setup()
    }

}
