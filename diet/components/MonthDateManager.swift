//
//  MonthDateManager.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/07.
//

import Foundation

final class MonthDateManager {

    private let calendar = Calendar.current
    private (set) var days: [Date] = []
    private var firstDate: Date! {
        didSet {
           days = createDaysForMonth()
        }
    }

    var monthString: String {
        return firstDate.string(format: "YYYY年M月")
    }

    init() {
        var component = calendar.dateComponents([.year, .month], from: Date())
        component.day = 1
        firstDate = calendar.date(from: component)
        days = createDaysForMonth()
    }

    func createDaysForMonth() -> [Date] {
        // 月の初日の曜日
        let dayOfTheWeek = calendar.component(.weekday, from: firstDate) - 1
        // 月の日数
        let numberOfWeeks = calendar.range(of: .weekOfMonth, in: .month, for: firstDate)!.count
        // その月に表示する日数
        let numberOfItems = numberOfWeeks * 7

        return (0..<numberOfItems).map { i in
            var dateComponents = DateComponents()
            dateComponents.day = i - dayOfTheWeek
            return calendar.date(byAdding: dateComponents, to: firstDate)!
        }
    }

    func nextMonth() {
        firstDate = calendar.date(byAdding: .month, value: 1, to: firstDate)
    }

    func prevMonth() {
        firstDate = calendar.date(byAdding: .month, value: -1, to: firstDate)
    }
}

