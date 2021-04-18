//
//  moveViewController.swift
//  move_slider
//
//  Created by yousun on 2021/4/17.
//

import UIKit

class moveViewController: UIViewController {

    
    @IBOutlet weak var basketballImageView: UIImageView!
    @IBOutlet weak var boyImageView: UIImageView!
    @IBOutlet weak var girlImageView: UIImageView!
    @IBOutlet weak var togetherImageView: UIImageView!
    
    @IBOutlet weak var stringLabel: UILabel!
    
    // 設定籃球移動時的起始位置
    func updateLocation(degrees:CGFloat){
    
        basketballImageView.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180 * degrees).translatedBy(x: -100, y: 0)
    }
    
    // 畫面啟動 呼叫 updateLocation 角度是 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocation(degrees: 0)
    }
    
    
    // slider 設定 圖片移動、顯示
    @IBAction func changeSlider(_ sender: UISlider) {
        
        // 籃球的移動
        updateLocation(degrees: CGFloat(sender.value))
        
        // 籃球本身的旋轉
        basketballImageView.transform = basketballImageView.transform.rotated(by: CGFloat(sender.value))
        
        // 女孩從座標Ｘ往右移動 “Ｘ＋”
        girlImageView.frame.origin.x = CGFloat(212 + sender.value)
        
        // 男孩從座標Ｘ往左移動 “Ｘ-”
        boyImageView.frame.origin.x = CGFloat(700 - sender.value)
        
        // 當 sender = 180 顯示 Label 跟 ImageView
        if sender.value == 180 {
            stringLabel.text = "大 笨 蛋"
            stringLabel.backgroundColor = .gray
            stringLabel.layer.borderWidth = 3
            stringLabel.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            stringLabel.layer.cornerRadius = 5
            
            togetherImageView.isHidden = false
            
        }else{
            stringLabel.text = ""
            stringLabel.backgroundColor = .none
            stringLabel.layer.borderWidth = 0
            stringLabel.layer.borderColor = .none
            
            togetherImageView.isHidden = true
        }
    }
}
