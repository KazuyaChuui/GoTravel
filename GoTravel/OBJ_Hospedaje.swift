//
//  OBJ_Hospedaje.swift
//  ElTriunfo
//
//  Created by Aaron De Santiago on 3/4/17.
//  Copyright © 2017 Lenda. All rights reserved.
//

import UIKit

class OBJ_Hospedaje: NSObject {
    
    // Variables
    
    var ubicacion : String = ""
    var organizacion : String = ""
    var nombre : String = ""
    var id : Int = 0
    var costo : Int = 0
    var cantidad : Int = 0
    
    init(ubicacion:String, organizacion:String, nombre:String, id:Int, costo:Int, cantidad:Int) {
        self.ubicacion = ubicacion
        self.organizacion = organizacion
        self.nombre = nombre
        self.id = id
        self.costo = costo
        self.cantidad = cantidad
    }
    
    class func createArray()->[OBJ_Hospedaje]{
        
        var array_hospedaje : [OBJ_Hospedaje] = []
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancun", organizacion: "Le Blanc", nombre: "Habitacion 3 - 4 personas", id: 1, costo: 33540, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Creel", organizacion: "Best Western", nombre: "Habitacion 1-2 personas", id: 2, costo: 767, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Creel", organizacion: "Cabañas Villa Mexicana", nombre: "Habitacion 1-2 personas", id: 3 , costo: 767, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Creel", organizacion: "Cabañas Villa Mexican", nombre: "Habitacion 3 - 4 personas", id: 4, costo: 1866, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Creel", organizacion: "Cabañas Villa Mexican", nombre: "Habitacion 3 - 4 personas", id: 5, costo: 1866, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Creel", organizacion: "Hotel Divisadero", nombre: "Habitacion 1-2 personas", id: 6, costo: 1596, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Creel", organizacion: "Hotel Divisadero", nombre: "Habitacion 3-4 personas", id: 7, costo: 1866, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Guanajuato", organizacion: "Hotel Gran Plaza", nombre: "Habitacion 1-2 personas", id: 8, costo: 974, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Guanajuato", organizacion: "Hotel Gran Plaza", nombre: "Habitacion 3-4 personas", id: 9, costo: 1232, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Guanajuato", organizacion: "Hotel Camino Real", nombre: "Habitacion 1-2 personas", id: 10, costo: 1892, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Guanajuato", organizacion: "Hotel Camino Real", nombre: "Habitacion 3-4 personas", id: 11, costo: 2360, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Guanajuato", organizacion: "Hotel Edelmira", nombre: "Habitacion 1-2 personas", id: 12, costo: 3754, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Guanajuato", organizacion: "Hotel Edelmira", nombre: "Habitacion 3-4 personas", id: 13, costo: 5141, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancún", organizacion: "Hotel Sotavento", nombre: "Habitacion 1-2 personas", id: 14, costo: 820, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancún", organizacion: "Hotel Sotavento", nombre: "Habitacion 3-4 personas", id: 15, costo: 1000, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancún", organizacion: "Hotel Parnassus", nombre: "Habitacion 1-2 personas", id: 16, costo: 6140, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancún", organizacion: "Hotel Parnassus", nombre: "Habitacion 3-4 personas", id: 17, costo: 7368, cantidad: 4))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancún", organizacion: "Le Blanc", nombre: "Habitacion 1-2 personas", id: 18, costo: 17840, cantidad: 2))
        array_hospedaje.append(OBJ_Hospedaje(ubicacion: "Cancún", organizacion: "Le Blanc", nombre: "Habitacion 3-4 personas", id: 19, costo: 33540, cantidad: 4))
        
        return array_hospedaje
    }
}
