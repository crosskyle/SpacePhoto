//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Kyle Cross on 12/15/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url, completionHandler: { (data, response, error) in
            
            if let data = data,
                let image = UIImage(data: data) {
                    DispatchQueue.main.async {

                        self.imageView.image = image
                        self.descriptionLabel.text = photoInfo.description
                        self.descriptionLabel.sizeToFit()
                        
                        if let copyright = photoInfo.copyright {
                            self.copyrightLabel.text = "Copyright \(copyright)"
                        } else {
                            self.copyrightLabel.isHidden = true
                        }
                        
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

