//
//  AnalsysViewController.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/03.
//

import Foundation
import UIKit

class AnalsysViewController: UIViewController {
    let analsysView = AnalsysView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = analsysView
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
