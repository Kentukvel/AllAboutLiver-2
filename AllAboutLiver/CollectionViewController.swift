//
//  CollectionViewController.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 08.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import UIKit


//Table#5
class CollectionViewController: BaseMenuViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - Variables
    var sections = MenuSections()
    var section: Section!
    var arrayOfData: [Any]!
    var web = Web()
    @IBAction func menuBarButtonItem(_ sender: UIBarButtonItem) {
        if AppDelegate.isMenuVC {
            showMenu()
        } else {
            hideMenu()
        }
    }
    var images: [String : String] = ["8945" : "drinks",
                                     "8946" : "soups",
                                     "8947" : "kasha",
                                     "8948" : "pasta",
                                     "8949" : "meat",
                                     "8950" : "bread",
                                     "8951" : "milk",
                                     "8952" : "vegetables",
                                     "8953" : "fruits",
                                     "8954" : "eggs",
                                     "8955" : "maslo",
                                     "8956" : "deserts",
                                     "8957" : "souses",
                                     "8958" : "tasty",
                                     "8959" : ""]
    
    //MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfData.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Table5CollectionCell", for: indexPath) as! Table5CollectionViewCell
        if let item = arrayOfData[indexPath.row] as? JSONStructure {
            cell.table5ImageView.image = UIImage(named: images[item.id]!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(arrayOfData)
    }
    override func viewWillAppear(_ animated: Bool) {
        section = sections.sections[0]
        arrayOfData = web.getData(from: section.filePath)
        print(arrayOfData)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
