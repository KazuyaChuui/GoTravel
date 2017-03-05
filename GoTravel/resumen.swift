//
//  resumen.swift
//  GoTravel
//
//  Created by Jesus Ruiz on 3/4/17.
//  Copyright © 2017 AkibaTeaParty. All rights reserved.
//

import UIKit

class resumen: UIViewController {
    
    @IBOutlet weak var lugarLabel: UILabel!
    @IBOutlet weak var transporteField: UITextView!
    @IBOutlet weak var hospedajeField: UITextView!
    @IBOutlet weak var hospedajeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmar(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
