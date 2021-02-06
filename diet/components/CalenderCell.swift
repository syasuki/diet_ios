//
//  CalenderCell.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/07.
//

import UIKit

final class CalendarCell: UICollectionViewCell {

    private var button: UIButton = {
        let it = UIButton()
        //it.textAlignment = .center
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: Model) {
        button.setTitle(model.text, for: .normal)
        button.setTitleColor(model.textColor, for: .normal)
        //button.addTarget(self, action: #selector(print1(sender: )), for: .touchUpInside)
    }
}


extension CalendarCell {

    struct Model {
        var text: String = ""
        var textColor: UIColor = .black
    }
    @objc private func print1(sender: Any) {
        print((sender as! UIButton).titleLabel?.text ?? "なし")
    }
}

extension CalendarCell.Model {

    init(date: Date) {
        let weekday = Calendar.current.component(.weekday, from: date)
        if weekday == 1 {
            textColor = .lightRed
        } else if weekday == 7 {
            textColor = .lightBlue
        } else {
            textColor = .gray
        }
        text = date.string(format: "d")
    }
}
