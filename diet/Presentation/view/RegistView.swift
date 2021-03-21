//
//  RegistView.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/03/15.
//

import UIKit
import RealmSwift


class RegistView: DietView, UICollectionViewDelegate {
    let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    override init() {
        super.init()
        setup()
    }
    private func setup(){
        self.backgroundColor = .white
        let mainView = UIStackView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.axis = .horizontal
        self.addSubview(mainView)
        //let height = 40
        mainView.alignment = .center
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: CGFloat((screenHeight / 5) * 2)).isActive = true
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //mainView.backgroundColor = .blue
        createEmptyView(width: 4,height: 2,view: mainView)
        
        let recodeInputViewButton = UIView()
        recodeInputViewButton.translatesAutoresizingMaskIntoConstraints = false
        mainView.addArrangedSubview(recodeInputViewButton)
        recodeInputViewButton.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth / 2)).isActive = true
        recodeInputViewButton.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth / 2)).isActive = true
        recodeInputViewButton.backgroundColor = UIColor.orange.withAlphaComponent(0.7)
        recodeInputViewButton.isOpaque = false
        recodeInputViewButton.layer.cornerRadius = 18
        createEmptyView(width: 4,height: 2,view: mainView)
        
        let subViews1 = UIStackView()
        subViews1.translatesAutoresizingMaskIntoConstraints = false
        subViews1.axis = .horizontal
        subViews1.alignment = .center
        self.addSubview(subViews1)
        subViews1.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        subViews1.heightAnchor.constraint(equalToConstant: CGFloat((screenHeight / 5) * 1)).isActive = true
        subViews1.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        subViews1.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //subViews1.backgroundColor = .red
        createEmptyView(width: 9, height: 3, view: subViews1)
        let stateInputViewButton = UIView()
        stateInputViewButton.translatesAutoresizingMaskIntoConstraints = false
        subViews1.addArrangedSubview(stateInputViewButton)
        stateInputViewButton.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        stateInputViewButton.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        stateInputViewButton.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        stateInputViewButton.isOpaque = false
        stateInputViewButton.layer.cornerRadius = 18
        createEmptyView(width: 9, height: 3, view: subViews1)
        let categoryInputViewButton = UIView()
        categoryInputViewButton.translatesAutoresizingMaskIntoConstraints = false
        subViews1.addArrangedSubview(categoryInputViewButton)
        categoryInputViewButton.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        categoryInputViewButton.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        categoryInputViewButton.backgroundColor = UIColor.yellow.withAlphaComponent(0.7)
        categoryInputViewButton.isOpaque = false
        categoryInputViewButton.layer.cornerRadius = 18
        createEmptyView(width: 9, height: 3, view: subViews1)
        
        let subViews2 = UIStackView()
        subViews2.translatesAutoresizingMaskIntoConstraints = false
        subViews2.axis = .horizontal
        subViews2.alignment = .center
        self.addSubview(subViews2)
        subViews2.topAnchor.constraint(equalTo: subViews1.bottomAnchor).isActive = true
        subViews2.heightAnchor.constraint(equalToConstant: CGFloat((screenHeight / 5) * 1)).isActive = true
        subViews2.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        subViews2.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //subViews2.backgroundColor = .darkGray
        createEmptyView(width: 9, height: 3, view: subViews2)
        let separetionInputViewButton = UIView()
        separetionInputViewButton.translatesAutoresizingMaskIntoConstraints = false
        subViews2.addArrangedSubview(separetionInputViewButton)
        separetionInputViewButton.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        separetionInputViewButton.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        separetionInputViewButton.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.7)
        separetionInputViewButton.isOpaque = false
        separetionInputViewButton.layer.cornerRadius = 18
        createEmptyView(width: 9, height: 3, view: subViews2)
        let varietyInputViewButton = UIView()
        varietyInputViewButton.translatesAutoresizingMaskIntoConstraints = false
        subViews2.addArrangedSubview(varietyInputViewButton)
        varietyInputViewButton.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        varietyInputViewButton.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth / 3)).isActive = true
        varietyInputViewButton.backgroundColor = UIColor.lightBlue.withAlphaComponent(0.7)
        varietyInputViewButton.isOpaque = false
        varietyInputViewButton.layer.cornerRadius = 18
        createEmptyView(width: 9, height: 3, view: subViews2)
        
    }
    required init?(coder adecoder: NSCoder) {
        super.init(coder: adecoder)
        setup()
    }
    private func createEmptyView(width : CGFloat,height:CGFloat,view: UIStackView){
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(emptyView)
        emptyView.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth / width)).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth / height)).isActive = true
    }

}




