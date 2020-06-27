//
//  ImageViewController.swift
//  Cassini
//
//  Created by Maria Yelfimova on 6/27/20.
//  Copyright © 2020 Maria Yelfimova. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
    
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    private func fetchImage(){
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents{
                imageView.image = UIImage(data: imageData)
            }
        }
        
    }

    @IBOutlet weak var imageView: UIImageView!
}
