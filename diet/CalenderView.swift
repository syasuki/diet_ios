//
//  CalenderView.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/07.
//

import UIKit


class CalenderView: UIView {
    
    private let dateManager = MonthDateManager()
    private let weeks = ["日","月", "火", "水", "木", "金", "土"]
    private let itemSize: CGFloat = (UIScreen.main.bounds.width - 60) / 7
    private let title = UILabel()
    private let prevButton = UIButton()
    private let nextButton = UIButton()
    private lazy var calenderCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: itemSize, height: 30)
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder adecoder: NSCoder) {
        super.init(coder: adecoder)
    }
    private func setup(){
        self.backgroundColor = .white
        let calenderSV = UIStackView()
        calenderSV.axis = .vertical
        calenderSV.alignment = .fill
        calenderSV.distribution = .fill
        calenderSV.backgroundColor = .clear
        calenderSV.frame.size.width = UIScreen.main.bounds.width
        calenderSV.frame.size.height = 550
        self.addSubview(calenderSV)
        let calenderTopSV = UIStackView()
        calenderTopSV.axis = .horizontal
        calenderTopSV.alignment = .fill
        calenderTopSV.distribution = .fillEqually
        calenderTopSV.backgroundColor = .lightBlue
        calenderTopSV.frame.size.height = 10
        calenderTopSV.addArrangedSubview(prevButton)
        calenderTopSV.addArrangedSubview(title)
        calenderTopSV.addArrangedSubview(nextButton)
        prevButton.setTitle("先月", for:UIControl.State.normal)
        prevButton.addTarget(self, action: #selector(actionBack(sender: )), for: .touchUpInside)
        title.text = dateManager.monthString
        title.textAlignment = .center
        nextButton.setTitle("次月", for: .normal)
        nextButton.addTarget(self, action: #selector(actionNext(sender: )), for: .touchUpInside)
        calenderSV.addArrangedSubview(calenderTopSV)
        
        //カレンダー部分作成
        calenderCollectionView.frame.size.width = UIScreen.main.bounds.width
        calenderCollectionView.heightAnchor.constraint(equalToConstant: 500.0).isActive = true
        calenderSV.addArrangedSubview(calenderCollectionView)
        
        //setUpNavigationBar()
    }
    @objc private func actionNext(sender: Any) {
        dateManager.nextMonth()
        calenderCollectionView.reloadData()
        title.text = dateManager.monthString
    }
    
    @objc private func actionBack(sender: Any) {
        dateManager.prevMonth()
        calenderCollectionView.reloadData()
        title.text = dateManager.monthString
    }
}

extension CalenderView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? weeks.count : dateManager.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCell
        if indexPath.section == 0 {
            let day = weeks[indexPath.row]
            let model = CalendarCell.Model(text: day, textColor: .black)
            cell.configure(model: model)
        } else {
            let date = dateManager.days[indexPath.row]
            cell.configure(model: CalendarCell.Model(date: date))
        }
        return cell
    }
}

extension CalenderView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        title.text = dateManager.days[indexPath.row].string(format: "YYYY/MM/dd")
    }
}
