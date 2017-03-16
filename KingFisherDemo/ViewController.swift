//
//  ViewController.swift
//  KingFisherDemo
//
//  Created by Anurag Kulkarni on 3/16/17.
//  Copyright © 2017 Anurag Kulkarni. All rights reserved.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var url: URL!
   var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonAction(_ sender: Any) {
     
        if flag {
            url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg")!
             flag = false
        }else {
           url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-2.jpg")!
             flag = true
        }
       setImage(url: url)
    }
    
    func setImage(url: URL) {
        
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: url,
                                   placeholder: nil,
                                   options: [.transition(ImageTransition.fade(1)), .cacheMemoryOnly],
                                   progressBlock: { receivedSize, totalSize in
                                    print("")
        },
                                   completionHandler: { image, error, cacheType, imageURL in
                                    print("")
//                                    ImageCache.default.store(self.imageView.image!, forKey: String(describing: url))
//                                    print("Path is::::",ImageCache.default.cachePath(forKey: String(describing: url)))
                                    KingfisherManager.shared.cache.store(self.imageView.image!, forKey: String(describing: url))
                                    print("Path is::::",KingfisherManager.shared.cache.cachePath(forKey: String(describing: url)))
                                    
        })

      }

    @IBAction func clearCacheClicked(_ sender: Any) {
         KingfisherManager.shared.cache.removeImage(forKey: String(describing: url))
         url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-3.jpg")!
        setImage(url: url)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

