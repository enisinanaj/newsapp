//
//  Look.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import UIKit

class Look {
    static func setNavigationBarLook(_ viewController: UIViewController) {
        setTitleStyle(viewController)
    }
    
    static func setTitleStyle(_ viewController: UIViewController) {
        let navBar = viewController.navigationController?.navigationBar
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(0xDF2022)]
        
        if #available(iOS 11.0, *) {
            navBar?.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(0xDF2022)]
        }
    }
    
    static func setBackButtonStyle(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
    }
}
