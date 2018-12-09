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
    var arrayOfData: [JSONStructure]!
    var web = Web()
    var selectedRow: Int?
    

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
        let item = arrayOfData[indexPath.row]
        cell.table5ImageView.image = UIImage(named: images[item.id]!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        goToOptionVC(row: selectedRow!)
    }
    
    func goToOptionVC(row: Int) {
        performSegue(withIdentifier: "table5OptionSegue", sender: nil)
    }
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(arrayOfData)
    }
    override func viewWillAppear(_ animated: Bool) {
        section = sections.sections[0]
        arrayOfData = web.getData(from: section.filePath)
        //print(arrayOfData)

    }

    //убрать лишнее в тексте
    func removeGarbage(from selected: JSONStructure) -> JSONStructure {
        var newSelected = selected
        var newMozhno = newSelected.appMozhno
        var newNelzya = newSelected.appNelza
        let haveToReplace = ["\r", "<ul class=\"mojno\">", "\t", "<li>", "</li>", "<ul class=\"nelzya\">", ";&nbsp;", "</ul>", "<span data-mce-mark=\"1\">", "</span>"]
        for el in haveToReplace {
            newMozhno = newMozhno.replacingOccurrences(of: el, with: "")
            newNelzya = newNelzya.replacingOccurrences(of: el, with: "")
        }
        newSelected.appMozhno = newMozhno
        newSelected.appNelza = newNelzya
        return newSelected
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //Установим текст, который хотим отобразить
        if segue.identifier == "table5OptionSegue" {
            if let destinationVC = segue.destination as? Table5OptionTableViewController {
                let selected = removeGarbage(from: arrayOfData[selectedRow!])
                destinationVC.textMozhno = selected.appMozhno
                destinationVC.textNelzya = selected.appNelza
            }
        }
    }
 

}
