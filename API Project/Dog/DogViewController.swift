//
//  DogViewController.swift
//  API Project
//
//  Created by Cesar Fernandez on 5/9/24.
//

import UIKit



class DogViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImageView()
    }
    
    func updateImageView() {
        Task {
            // load new dog image
            let dogImage = await DogImageAPI.randomDog()
            // assign dog image to imageView
            let image = await DogImageAPI.image(from: dogImage)
            imageView.image = image
        }
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        imageView.image = UIImage(systemName: "dog")
        updateImageView()
    }
    
}

