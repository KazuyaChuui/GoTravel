//
//  hospedaCell.swift
//  GoTravel
//
//  Created by Jesus Ruiz on 3/4/17.
//  Copyright © 2017 AkibaTeaParty. All rights reserved.
//

import UIKit

class hospedaCell: UITableViewCell {
    
    @IBOutlet weak var labelLugar: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelPrecio: UILabel!
    
    func setup(object: OBJ_Hospedaje){
        labelLugar.text = object.ubicacion
        labelCompany.text = object.organizacion
        labelPrecio.text = object.costo.description
    }
}
