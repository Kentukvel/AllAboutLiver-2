//
//  MenuViewController.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 08.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import UIKit

protocol MenuSelect {
    func menuSelected(indexPath: IndexPath)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var delegate : MenuSelect?

    @IBOutlet weak var menuTableVIew: UITableView!
    var menuSections = MenuSections()
    var titles: [String] = ["Главная"]

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableVIew.delegate = self
        menuTableVIew.dataSource = self
        for el in menuSections.sections {
            titles.append(el.title)
        }
    }

    //MARK: TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSections.sections.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableVIew.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        let title = titles[indexPath.row]
        if title == "Главная"{
            cell.titleLabel.text = title
            cell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            cell.titleLabel.textColor = #colorLiteral(red: 0.940234375, green: 0.9630022321, blue: 0.9630859375, alpha: 1)
        } else {
            cell.titleLabel.text = title
            cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
            cell.titleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delegate?.menuSelected(indexPath: indexPath)
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "toMainMenuSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "toTable5FromMenuSegue", sender: nil)
        default:
            break
        }
        
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "toTable5FromMenuSegue":
//            continue
//        default:
//            break
//        }
    }
 

}
