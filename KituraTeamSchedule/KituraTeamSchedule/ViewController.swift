//
//  ViewController.swift
//  KituraTeamSchedule
//
//  Created by serverVITK on 10/25/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView?
    var dataSource: Array<[String:String]> = []
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = self.setUpTableView()
        self.dataSource = self.generateDataSource()
        self.createAddBttn()
    }
    
    func createAddBttn() {
        let bttn = UIButton.init(type: .custom)
        bttn.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        bttn.backgroundColor = UIColor.blue
        bttn.setTitle("Add", for: UIControlState.normal)
        bttn.addTarget(self, action: #selector(addNewRecordToTimesTable), for: .touchUpInside)
        let rightBarBttnItem = UIBarButtonItem.init(customView: bttn)
        self.navigationItem.rightBarButtonItem = rightBarBttnItem
    }
    
    @objc func addNewRecordToTimesTable(sender: UIButton) {
        let addrecordVC = AddRecordViewController.init(with: nil, presentation: .pushed, nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(addrecordVC, animated: true)
    }
    
    func generateDataSource() -> [[String:String]] {
        var fakeData: [[String:String]] = []
        for i in 0..<25 {
            let fakeRowData = ["date":"\(i)", "day":"\(i)","time":"time \(i)", "reason":"reason \(i)", "descr":"Some long description \(i)"]
            fakeData.append(fakeRowData)
        }
        return fakeData
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let table = self.tableView else { fatalError("TableView in VC doesn't exist viewDidLayoutSubviews method") }
        self.applyConstraints(to: table)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.allButUpsideDown
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! RLTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! RLTableViewCell
        cell.fillTheCell(self.dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addrecordVC = AddRecordViewController.init(with: self.dataSource[indexPath.row], presentation: .presentedModally, nibName: nil, bundle: nil)
        self.present(addrecordVC, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size: CGFloat?
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait || orientation.isFlat {
            size = self.view.frame.size.height / 5
        } else if orientation.isLandscape {
            size = self.view.frame.size.width / 5
        } else {
            size = 140
        }
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
        
        return size!
    }
    
}

extension UIViewController {
    
    func applyConstraints(to viewElem: UIView, superViewElem: UIView, withConstants top: CGFloat, leading: CGFloat, trail: CGFloat, bottom: CGFloat) {
        let viewElemIsAdded: Bool = (viewElem.superview != nil) ? true : false
        
        if !viewElemIsAdded {
            superViewElem.addSubview(viewElem)
        }
        let safeArea = superViewElem.safeAreaLayoutGuide
        viewElem.translatesAutoresizingMaskIntoConstraints = false
        
        viewElem.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: top).isActive = true
        viewElem.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leading).isActive = true
        viewElem.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: trail).isActive = true
        viewElem.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: bottom).isActive = true
    }
    
}










