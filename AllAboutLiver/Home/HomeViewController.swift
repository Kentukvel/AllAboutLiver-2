//
//  HomeViewController.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 08.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import UIKit

class HomeViewController: BaseMenuViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - Variables and Constraints
    @IBOutlet weak var menuBarButtonItem: UIBarButtonItem!
    var menuSections = MenuSections()
    var web = Web()
    var selectedIndex: IndexPath? {
        willSet {
            switch newValue?.row {
            case 0:
                performSegue(withIdentifier: "toTable5Segue", sender: nil)
            default:
                break
            }
            
        }
    }
//    var arrayOfData = [Any]() {
//        didSet {
//            //performSegue(withIdentifier: "toTable5Segue", sender: nil)
//        }
//    }
    
    //MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuSections.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        cell.imageOfCollection.image = UIImage(named: menuSections.sections[indexPath.row].imageName)
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        
        //performSegue(withIdentifier: "toTable5Segue", sender: nil)
    }

    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC.delegate = self
        
    }
    deinit {
        print("Home has been deinit")
    }
    //Здесь описать загрузку данных
    override func viewWillAppear(_ animated: Bool) {
        web.urlRequest(url: "https://vseopecheni.ru/jsonmn/?key=hfiwehlgewjhg2342few", fileToWrite: "n5.dat")//
        
    }
    
    
    //MARK: - Side Menu Methods
    @IBAction func menuBarButtonItem(_ sender: UIBarButtonItem) {
        if AppDelegate.isMenuVC {
            showMenu()
        } else {
            hideMenu()
        }
    }
    

    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTable5Segue" {
            if let destinationVC = segue.destination as? CollectionViewController {
                print(selectedIndex?.row)
                
            }
        }
    }
 

}

//MARK: - MenuSelect Protocol
extension HomeViewController : MenuSelect {
    func menuSelected(indexPath: IndexPath) {
        
    }
}
