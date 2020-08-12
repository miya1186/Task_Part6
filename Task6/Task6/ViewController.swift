//
//  ViewController.swift
//  課題6
//
//  Created by miyazawaryohei on 2020/08/12.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 1
        slider.maximumValue = 100
        label.text = String(arc4random_uniform(101))
    }
    
    
    @IBAction func judge(_ sender: Any) {
        if label.text == String(Int(slider.value)) {
            presentAlert(message: "あたり！\nあなたの値：\(Int(slider.value))")
            
        }else{
            presentAlert(message:"はずれ！\nあなたの値：\(Int(slider.value))")
        }
    }
    
    private func presentAlert(message:String){
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let challenge = UIAlertAction(title: "再挑戦", style: .default, handler: {(action:UIAlertAction!)->Void in self.label.text = String(arc4random_uniform(101))})
        alert.addAction(challenge)
        present(alert, animated: true, completion: nil)
        
    }
    
    //xcodeでスライダーの値を確認（テスト用）
    @IBAction func value(_ sender: Any) {
        print(slider.value)
    }
    
}

