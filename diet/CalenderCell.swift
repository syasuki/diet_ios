//
//  CalenderCell.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/07.
//

import UIKit

final class CalendarCell: UICollectionViewCell {

    private var label: UILabel = {
        let it = UILabel()
        it.textAlignment = .center
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: Model) {
         label.text = model.text
         label.textColor = model.textColor
    }
}


extension CalendarCell {

    struct Model {
        var text: String = ""
        var textColor: UIColor = .black
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
