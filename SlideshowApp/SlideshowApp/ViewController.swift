//
//  ViewController.swift
//  SlideshowApp
//
//  Created by owner on 2017/12/05.
//  Copyright © 2017年 s1220210. All rights reserved.
//




import UIKit


    class ViewController: UIViewController {
    
        let image:[UIImage] = [#imageLiteral(resourceName: "IMG_0107.jpg"),#imageLiteral(resourceName: "IMG_0163.jpg"), #imageLiteral(resourceName: "IMG_0180.jpg"), #imageLiteral(resourceName: "IMG_0502.jpg"), #imageLiteral(resourceName: "IMG_0503.jpg")]
        //count 添字
        var count:Int = 0
        
        @IBOutlet weak var btImage: UIButton! // スライドショーの画像をbuttonで設定しました
        @IBOutlet weak var btShow: UIButton!  // 再生/停止ボタン
        @IBOutlet weak var btNext: UIButton!  // 進むボタン
        @IBOutlet weak var btBack: UIButton!  // 戻るボタン
        
        var timer: Timer!
        var timer_sec: Float = 0
        var a: Int = 0
        var b: Int = 0
        let slideTime: Int = 2
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning(){
            super.didReceiveMemoryWarning()
        }
  
        /* 進むボタンを押した時の関数 */
        @IBAction func nextImage(_ sender: Any) {
            count += 1
            if (count > image.count-1){
                count = 0
            }
            btImage.setImage(image[count], for: UIControlState())
        }

        /* 戻るボタンを押した時の関数 */
        @IBAction func beforeImage(_ sender: Any) {
            count -= 1
            if (count == -1){
                count = image.count-1
            }
            btImage.setImage(image[count], for: UIControlState())
        }
        
        /* 再生・停止ボタンを押した時の関数 */
        @IBAction func showImage(_ sender: Any) {
            
            if self.timer == nil { // 停止から再生
                btShow.setTitle("停止", for: .normal)
                // 無効化
                btNext.isEnabled = false
                btBack.isEnabled = false
                
                self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer),userInfo: nil,repeats: true)
                
            }
            else if self.timer != nil { // 再生から停止
                btShow.setTitle("再生", for: .normal)
                // 有効化
                btNext.isEnabled = true
                btBack.isEnabled = true
                
                self.timer.invalidate()
                self.timer = nil
            }
        }
        
        @objc func updateTimer(timer: Timer){
            self.timer_sec += 0.1
            
            /* floatのままだと小数点で誤差が生じたので10倍して整数として処理しました　*/
            b = Int(timer_sec * 10)
            a = b % (slideTime * 10)
           // a = b.truncatingRemainder(dividingBy: slideTime)
         
            // 2sごとに画像next
            if(timer_sec > 0 && a == 0) {
                nextImage((Any).self)
            }
        }
        
  
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let viewController:ImageViewController = segue.destination as! ImageViewController
            viewController.image = image[count]
            
            if self.timer != nil {
                showImage((Any).self)
            }
        }
        
        @IBAction func unwind(_ segue: UIStoryboardSegue){ //遷移先から戻ってくるときのメソッド
        
        }


   /*     override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    */

    }

