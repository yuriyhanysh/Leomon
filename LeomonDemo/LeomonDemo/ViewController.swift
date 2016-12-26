//
//  ViewController.swift
//  LeomonDemo
//
//  Created by Yuriy Hanysh on 12/27/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import UIKit
import Leomon

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        Leomon.fetchStops { result in
            print(result.debugDescription)
        }
        
        Leomon.fetchRoutes { result in
            print(result.debugDescription)
        }
    }
}

