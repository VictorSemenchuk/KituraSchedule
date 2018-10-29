//
//  ViewController.swift
//  KituraTeamSchedule
//
//  Created by serverVITK on 10/25/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //// Do any additional setup after loading the view, typically from a nib.+
    }

    @IBAction func queryDo(_ sender: Any) {
//        Service.getColors()
//        Service.getUsers()
        Service.getReasons()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

