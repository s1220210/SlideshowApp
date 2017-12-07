//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by owner on 2017/12/05.
//  Copyright © 2017年 s1220210. All rights reserved.
//
  // let image:[UIImage] = [#imageLiteral(resourceName: "IMG_0107.jpg"),#imageLiteral(resourceName: "IMG_0163.jpg"), #imageLiteral(resourceName: "IMG_0180.jpg"), #imageLiteral(resourceName: "IMG_0502.jpg"), #imageLiteral(resourceName: "IMG_0503.jpg")]


import UIKit

class ImageViewController: UIViewController {
    
    var image:UIImage?
    // UIImageView 初期化
    //let imageView = UIImageView(image:inu01)
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(count)
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    //imageView.image = inu01
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
