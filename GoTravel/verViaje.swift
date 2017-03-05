//
//  verViaje.swift
//  GoTravel
//
//  Created by Jesus Ruiz on 3/4/17.
//  Copyright © 2017 AkibaTeaParty. All rights reserved.
//

import UIKit

class verViaje: UIViewController//,UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var viajeSegmented: UISegmentedControl!
    @IBOutlet weak var viajesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let font = UIFont.systemFont(ofSize: 17)
        viajeSegmented.setTitleTextAttributes([NSFontAttributeName: font],
                                              for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viajeSegmented.selectedSegmentIndex = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        if(viajeSegmented.selectedSegmentIndex == 0){
            self.navigationController?.popViewController(animated: false)
        }
    }
}
