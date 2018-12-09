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
//    let titles = ["Стол №5", "Рецепты стола №5", "Меню неделька", "Гепатопротекторы", "О печени", "Как лечить", "Заболевания печени", "Эффективный будильник"]
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableVIew.delegate = self
        menuTableVIew.dataSource = self
    }

    //MARK: TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSections.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableVIew.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.titleLabel.text = menuSections.sections[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.menuSelected(indexPath: indexPath)
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
