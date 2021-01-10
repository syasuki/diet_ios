//
//  DietViewController.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/01.
//

import UIKit

class DietViewController: UIViewController {
    let recodeView = RecodeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "記録"
        self.view = recodeView
        // Do any additional setup after loading the view.
    }
    @objc func tappedLeftBarButton() {
        }
     
        // ボタンをタップしたときのアクション
        @objc func tappedRightBarButton() {
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
