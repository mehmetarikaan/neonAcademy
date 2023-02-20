//
//  AppViewModel.swift
//  CollectionViewsChallange
//
//  Created by Mehmet Arıkan on 20.02.2023.
//

import UIKit

struct AppViewModel {
    var app: AppModel
    
    var appLogo: UIImage { return app.appLogo }
    
    var appName: String { return app.appName }
    
    var description: String { return app.desc }
    
    var category: String { return app.category }
    
    var link: String { return app.link}
    
    init(app: AppModel) {
        self.app = app
    }
}
