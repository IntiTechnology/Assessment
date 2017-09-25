//
//  CategoryController.swift
//  Assessment
//
//  Created by Erick Manrique on 9/22/17.
//  Copyright © 2017 Erick Manrique. All rights reserved.
//

import UIKit
import Result
import ReactiveSwift
import ReactiveJSON

class CategoryController: UIViewController {

    var breeds = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        _ = GW2API.request(endpoint: "achievements", method: .GET, queryItems: [URLQueryItem(name:"ids",value:achievements.joined(separator: ","))], token: .none).startWithResult { (result: Result<[String:AnyObject], NetworkError>) in
//            print("it has begon")
//            guard result.error != nil else {
//                print("result.error")
//                return
//            }
//            print("second guard")
//
//            guard let data = result.value else {
//                return
//            }
//            print("third guard")
////            self.categories = data.map({ (value: [String:AnyObject]) -> Category in
////                return Category(dictionary: value)
////            })
////            DispatchQueue.main.async {
////                self.categories = data.map({ (value: [String:AnyObject]) -> Category in
////                    return Category(dictionary: value)
////                })
////                self.collectionView.reloadData()
////            }
//
//        }
        
//        let achievements = ["1","2","3","4"]
//        _ = GW2API.request(endpoint: "achievements", method: .GET, queryItems: [URLQueryItem(name:"ids",value:achievements.joined(separator: ","))], token: .none).startWithResult { (result: Result<[[String:AnyObject]], NetworkError>) in
//            //            colors = result.value!
//            print(result.value!)
//        }
        
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

extension CategoryController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
//
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BreedCell", for: indexPath) as! BreedCell
        cell.name.text = breeds[indexPath.item]
        return cell
    }
}
