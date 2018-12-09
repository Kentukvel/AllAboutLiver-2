//
//  MenuSections.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 08.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import Foundation

struct Section {
    let title: String
    let imageName: String
    let filePath: String
}
class MenuSections {
    
    
    var sections = [
                    Section(title: "Стол №5",               imageName: "n5",          filePath: "n5.dat"),
                    Section(title: "Рецепты стола №5",      imageName: "recipes",     filePath: ""),
                    Section(title: "Меню неделька",         imageName: "nedelka",     filePath: ""),
                    Section(title: "Гепатопротекторы",      imageName: "gepo",        filePath: ""),
                    Section(title: "О печени",              imageName: "aboutLiver",  filePath: ""),
                    Section(title: "Как лечить",            imageName: "howToHeel",   filePath: ""),
                    Section(title: "Заболевания печени",    imageName: "illsOfLiver", filePath: ""),
                    Section(title: "Эффективный будильник", imageName: "effectAlarm", filePath: ""), ]
    
}
