//
//  RecodeView.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/02.
//

import Foundation
import UIKit
import RealmSwift

@IBDesignable
class ScheduleView: DietView{
    
    override init() {
        super.init()
        setup()
    }
    func setup(){
        
        self.backgroundColor = .white
        /*
        let recodeView = UIStackView()
        
        recodeView.translatesAutoresizingMaskIntoConstraints = false
        recodeView.axis = .vertical
        recodeView.alignment = .fill
        recodeView.distribution = .fill
        self.addSubview(recodeView)
        recodeView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        recodeView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        recodeView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        recodeView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
 */
        /*
         let heightSV = UIStackView()
         heightSV.axis = .horizontal
         heightSV.alignment = .fill
         heightSV.distribution = .fill
         heightSV.translatesAutoresizingMaskIntoConstraints = false
         recodeView.addArrangedSubview(heightSV)
         heightSV.heightAnchor.constraint(equalToConstant: 130.0).isActive = true
         let heightText = UILabel()
         heightText.translatesAutoresizingMaskIntoConstraints = false
         heightText.text = "身長"
         heightText.textAlignment = .center
         heightSV.addArrangedSubview(heightText)
         
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
         
         heightSV.addArrangedSubview(heightTF)
         */
        let calender = CalenderView()
        calender.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(calender)
        calender.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        calender.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        calender.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        calender.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
        let weightSV = UIStackView()
        weightSV.translatesAutoresizingMaskIntoConstraints = false
        weightSV.axis = .horizontal
        weightSV.alignment = .fill
        weightSV.distribution = .fill
        self.addSubview(weightSV)
        weightSV.topAnchor.constraint(equalTo: calender.bottomAnchor).isActive = true
        weightSV.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        weightSV.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        weightSV.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        weightSV.backgroundColor = .blue
        let weightSV1 = UIStackView()
        weightSV1.translatesAutoresizingMaskIntoConstraints = false
        weightSV1.axis = .horizontal
        weightSV1.alignment = .fill
        weightSV1.distribution = .fill
        self.addSubview(weightSV1)
        weightSV1.backgroundColor = .red
        weightSV1.topAnchor.constraint(equalTo: weightSV.bottomAnchor).isActive = true
        weightSV1.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        weightSV1.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        weightSV1.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        /*
        let button = UIButton()
        recodeView.addArrangedSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 130.0).isActive = true
        button.setTitle("aaaa", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let button1 = UIButton()
        recodeView.addArrangedSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("aaaa", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        */
        
    }
    required init?(coder adecoder: NSCoder) {
        super.init(coder: adecoder)
        setup()
    }
}
