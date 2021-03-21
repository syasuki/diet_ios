//
//  RecodeCollectionViewCell.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/02/13.
//

import UIKit

class RecodeCollectionViewCell: UICollectionViewCell {
    
    let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let cellWidth = UIScreen.main.bounds.size.width / 2
    var fruitsNameLabel: UILabel = IndentLabel()
    var varietyLabel: UILabel = UILabel()
    var recodeLabel: UILabel = UILabel()
    var noteLabel : UILabel = IndentLabel()
    var buttonStack : UIStackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        self.backgroundColor = UIColor.orange.withAlphaComponent(0.7)
        self.isOpaque = false
        fruitsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(fruitsNameLabel)
        
        fruitsNameLabel.textColor = .white
        fruitsNameLabel.textAlignment = .left
        fruitsNameLabel.font = UIFont.systemFont(ofSize: 12.0)
        fruitsNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        fruitsNameLabel.heightAnchor.constraint(equalToConstant: cellWidth/8).isActive = true
        fruitsNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        fruitsNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        varietyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(varietyLabel)
        
        varietyLabel.topAnchor.constraint(equalTo: fruitsNameLabel.bottomAnchor).isActive = true
        varietyLabel.heightAnchor.constraint(equalToConstant: cellWidth/6).isActive = true
        varietyLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        varietyLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        varietyLabel.textColor = .white
        varietyLabel.textAlignment = .center
        varietyLabel.font = UIFont.systemFont(ofSize: 20.0)
        varietyLabel.text = "体重"
        
        
        recodeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(recodeLabel)
        
        recodeLabel.topAnchor.constraint(equalTo: varietyLabel.bottomAnchor).isActive = true
        recodeLabel.heightAnchor.constraint(equalToConstant: cellWidth/4).isActive = true
        recodeLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        recodeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        recodeLabel.textColor = .white
        recodeLabel.textAlignment = .center
        recodeLabel.font = UIFont.systemFont(ofSize: 25.0)
        recodeLabel.text = "64.5" + "kg"
        
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(noteLabel)
        
        noteLabel.topAnchor.constraint(equalTo: recodeLabel.bottomAnchor).isActive = true
        noteLabel.heightAnchor.constraint(equalToConstant: cellWidth/4).isActive = true
        noteLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        noteLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        noteLabel.textColor = .white
        noteLabel.textAlignment = .left
        noteLabel.font = UIFont.systemFont(ofSize: 12.0)
        noteLabel.numberOfLines = 0
        noteLabel.lineBreakMode = .byCharWrapping
        noteLabel.text = "前日飲み会でめっちゃ飲んだnnnnnnnnnnnnnnnnnnnnnnnnn"
        
        /*
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.backgroundColor = .clear
        contentView.addSubview(buttonStack)
        
        buttonStack.topAnchor.constraint(equalTo: noteLabel.bottomAnchor).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: cellWidth/24*5).isActive = true
        buttonStack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        buttonStack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        buttonStack.alignment = .center
        buttonStack.distribution = .fill
        buttonStack.axis = .horizontal
        buttonStack.layer.cornerRadius = 18
        */
        let cancelButton = UIButton()
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cancelButton)
        cancelButton.leftAnchor.constraint(equalTo:self.leftAnchor, constant: cellWidth/24*2).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: cellWidth/24*3).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: cellWidth/24*8).isActive = true
        cancelButton.topAnchor.constraint(equalTo: noteLabel.bottomAnchor).isActive = true
        cancelButton.backgroundColor = .systemPink
        cancelButton.layer.cornerRadius = 6
        cancelButton.setTitle("削除", for: .normal)
        
        let updateButton = UIButton()
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(updateButton)
        updateButton.rightAnchor.constraint(equalTo:self.rightAnchor, constant: -cellWidth/24*2).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: cellWidth/24*3).isActive = true
        updateButton.widthAnchor.constraint(equalToConstant: cellWidth/24*8).isActive = true
        updateButton.topAnchor.constraint(equalTo: noteLabel.bottomAnchor).isActive = true
        updateButton.backgroundColor = .lightBlue
        updateButton.layer.cornerRadius = 6
        updateButton.setTitle("更新", for: .normal)
        
        layer.cornerRadius = 18 //影の方向　width、heightを負の値にすると上の方に影が表示される
        
        
        
    }
    
    func setupContents(textName: String) {
        fruitsNameLabel.text = textName
    }
    
}
class IndentLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }
}
