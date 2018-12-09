//
//  Table5OptionViewController.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 09.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import UIKit

class Table5OptionViewController: UIViewController {

    var textToDisplay: String!
    @IBOutlet weak var table5OptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table5OptionTextView.text = textToDisplay
        print(textToDisplay)
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
