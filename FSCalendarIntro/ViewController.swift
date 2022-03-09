//
//  ViewController.swift
//  FSCalendarIntro
//
//  Created by zin min phyo on 09/03/2022.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet var calenderView: FSCalendar!
    
    lazy var formatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    let calendar = Calendar(identifier: .gregorian)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calenderView.dataSource = self
        calenderView.delegate = self
        
        calenderView.adjustsBoundingRectWhenChangingMonths = false
        calenderView.scrollDirection = .vertical
        calenderView.calendarHeaderView.backgroundColor = .tertiarySystemFill
        calenderView.allowsMultipleSelection = true
        calenderView.pagingEnabled = false
        calenderView.delegate = self
        calenderView.setScope(.week, animated: true)
    }


}

extension ViewController: FSCalendarDataSource {
    
}

extension ViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        for index in 0..<6 {
            var dateComponents = DateComponents()
            dateComponents.day = index
            let date = Calendar.current.date(byAdding: dateComponents, to: date)
            calendar.select(date)
        }
        calendar.reloadData()
    }
}

/*
extension ViewController: FSCalendarDelegate {
    
}
*/

extension ViewController: FSCalendarDelegateAppearance {

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return .systemPink
    }
}
