//
//  BreedsImageController.swift
//  Assessment
//
//  Created by Erick Manrique on 9/24/17.
//  Copyright © 2017 Erick Manrique. All rights reserved.
//

import UIKit
import Result
import ReactiveSwift
import ReactiveJSON

class BreedsImagesController: UIViewController {
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    var breedsImages = Image
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = DOGAPI.request(endpoint: "breeds/list", method: .GET, queryItems: nil, token: .none).startWithResult { (result: Result<[String:AnyObject], NetworkError>) in
            
            guard result.error == nil else {
                return
            }
            
            guard let data = result.value else {
                return
            }
            
            guard let arr = data["message"] as? [String] else{
                return
            }
            
            DispatchQueue.main.async {
                self.breeds = arr
                self.collectionView.reloadData()
            }
        }
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
