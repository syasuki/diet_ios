//
//  RecodeView.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/02.
//

import Foundation
import UIKit

@IBDesignable
class RecodeView: DietView{
    
    override init() {
        super.init()
        setup()
    }
    func setup(){
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
        button.setTitle("aaaa", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let button1 = UIButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("aaaa", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        recodeView.addArrangedSubview(button)
        recodeView.addArrangedSubview(button1)
    }
    required init?(coder adecoder: NSCoder) {
        super.init(coder: adecoder)
        setup()
    }
}
