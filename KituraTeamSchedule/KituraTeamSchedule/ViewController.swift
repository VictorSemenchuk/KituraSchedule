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
        //Service.getReasons()
        
        let record = Record(recordId: 4, userId: 1, startDate: Date(), endDate: Date(), reasonId: 3, reason: nil)
        Service.removeRecord(record: record)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

