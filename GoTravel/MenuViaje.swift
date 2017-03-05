//
//  MenuViaje.swift
//  GoTravel
//
//  Created by Jesus Ruiz on 3/4/17.
//  Copyright © 2017 AkibaTeaParty. All rights reserved.
//

import UIKit

class MenuViaje: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentedViaje: UISegmentedControl!
    @IBOutlet weak var presupuestoField: UITextField!
    @IBOutlet weak var hospedajeSwitch: UISwitch!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var confirmarButton: UIButton!
    
    
    let lugares = ["Guanajuato", "Creel","Cancun"]
    
    let transportesTipo = ["Estandar", "Estandar", "Estandar 1 transborde", "Estandar 1 transborde", "Estandar 1 escala", "Estandar 1 escala", "Auto Propio", "Auto Propio", "Auto Propio", "Estandar 1 transborde"]
    let transportesPrecio = [260, 1355, 1290, 2665, 5579, 5184, 345, 2020, 5400, 1290]
    let transportesOrigen = ["Chihuahua","Chihuahua","Chihuahua","Chihuahua","Chihuahua","Chihuahua","Chihuahua","Chihuahua","Chihuahua","Chihuahua"]
    let transportesOrganizacion = ["Servicio Economico", "Chepe", "Omnibus de Mexico", "Omnibus de Mexico", "Aeromexico", "Aeromexico", "N/A","N/A", "N/A", "Omnibus de Mexico"]
    let transportesNombre = ["Camion", "Tren", "Camion", "Camion", "Vuelo", "Vuelo","Carretera", "Carretera","Carretera", "Camion"]
    let transporteDestino = ["Creel","Creel","Guanajuato","Cancun","Guanajuato","Cancun","Creel", "Guanajuato","Cancun","Guanajuato"]
    
    
    
    let array_section1 : [String] = ["1","2"]
    let array_section2 : [String] = ["1","2","3"]
    let array_section3 : [String] = ["1","2","3","4"]
    
    var bool_showedFirstTable = false
    
    // Sizes
    
    let deviceHeight = UIScreen.main.bounds.height
    
    // Constraints
    
    @IBOutlet weak var constraint_section1_height: NSLayoutConstraint!
    @IBOutlet weak var constraint_section2_height: NSLayoutConstraint!
    @IBOutlet weak var constraint_section3_height: NSLayoutConstraint!
    
    @IBOutlet weak var transportoTableView: UITableView!
    @IBOutlet weak var hospedajoTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mein()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViaje.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    override func viewDidAppear(_ animated: Bool) {
        segmentedViaje.selectedSegmentIndex = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mein()
    {
        let font = UIFont.systemFont(ofSize: 17)
        segmentedViaje.setTitleTextAttributes([NSFontAttributeName: font],
                                              for: .normal)
        initialState()
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        let title = UILabel(frame: CGRect(x: 10, y: 0, width: self.view.frame.width-10, height: 40))
        if(tableView == menuTableView){
            title.text = "Lugares"
        }else if(tableView == transportoTableView){
            title.text = "Transporte"
        }else{
            title.text = "Hospedaje"
        }
        
        title.font = UIFont.boldSystemFont(ofSize: 20)
        view.backgroundColor = .white
        let rayita = UILabel(frame: CGRect(x: 0, y: view.frame.height-2, width: view.frame.width, height: 2))
        rayita.backgroundColor = UIColor(red:0.443, green:0.737, blue:0.471, alpha: 1)
        view.addSubview(title)
        view.addSubview(rayita)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == menuTableView {
            return lugares.count
        }
        else if tableView == transportoTableView {
            return transportesOrganizacion.count
        }
        else if tableView == hospedajoTableView {
            return OBJ_Hospedaje.createArray().count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == menuTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lugarCell") as! viajeCell
            cell.labelLugar.text = lugares[indexPath.row]
            return cell
        }
        else if tableView == transportoTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "transporteCell") as! transportCell
            cell.labelLugar.text = transportesNombre[indexPath.row]
            cell.labelPrecio.text = transportesPrecio[indexPath.row].description
            cell.labelCompany.text = transportesOrganizacion[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "hospedajeCell") as! hospedaCell
            cell.setup(object: OBJ_Hospedaje.createArray()[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == menuTableView {
            showSection2(index: indexPath)
        } else if tableView == transportoTableView {
            if(hospedajeSwitch.isOn){
                showSection3(index: indexPath)
            } else {
                showEndTwo(index: indexPath)
                confirmarButton.isHidden = false
                confirmarButton.frame = CGRect(x: confirmarButton.frame.origin.x, y: 300, width: confirmarButton.frame.size.width, height: confirmarButton.frame.size.height)
            }
        } else if tableView == hospedajoTableView {
            showEnd(index: indexPath)
            confirmarButton.isHidden = false
            confirmarButton.frame = CGRect(x: confirmarButton.frame.origin.x, y: 400, width: confirmarButton.frame.size.width, height: confirmarButton.frame.size.height)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !bool_showedFirstTable {
            showSection1()
            bool_showedFirstTable = true
        }
        
        return true
    }

    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    // MARK: - Animations
    
    func initialState(){
        
        constraint_section1_height.constant = 0
        constraint_section2_height.constant = 0
        constraint_section3_height.constant = 0
    }
    
    func showSection1(){
        constraint_section1_height.constant = deviceHeight - 98
        UIView.animate(withDuration: 0.5, delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        self.view.layoutIfNeeded()
        })
    }
    
    func showSection2(index:IndexPath){
        let cellRect = menuTableView.convert(menuTableView.rectForRow(at: index), to: self.view)
        
        let view = menuTableView.dequeueReusableCell(withIdentifier: "lugarCell") as! viajeCell
        view.labelLugar.text = lugares[index.row]
        view.frame = cellRect
        view.tag = 1
        view.layer.borderColor = UIColor(red:0.443, green:0.737, blue:0.471, alpha: 1).cgColor
        view.layer.borderWidth = 2
        
        self.view.addSubview(view)
        
        view.layoutIfNeeded()
        
        // Table animation
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.menuTableView.alpha = 0.0
        })
        
        // Section animation
        
        let newHeigh : CGFloat = 100.0
        let newRect = CGRect(x: 0, y: 98, width: cellRect.width, height: newHeigh)
        
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.frame = newRect
        })
        UIView.animate(withDuration: 0.4, delay: 0.1,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.layoutIfNeeded()
        }, completion : {  _ in
            self.constraint_section1_height.constant = newHeigh
            self.constraint_section2_height.constant = self.deviceHeight - 98 - newHeigh
            UIView.animate(withDuration: 0.5, delay: 0.0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 3,
                           options: UIViewAnimationOptions(),
                           animations: {
                            self.view.layoutIfNeeded()
            })
        })
    }
    
    func showSection3(index:IndexPath){
        let cellRect = transportoTableView.convert(transportoTableView.rectForRow(at: index), to: self.view)
        
        let view = transportoTableView.dequeueReusableCell(withIdentifier: "transporteCell") as! transportCell
        view.labelCompany.text = transportesOrganizacion[index.row]
        view.labelLugar.text = transportesNombre[index.row]
        view.labelPrecio.text = transportesPrecio[index.row].description
        view.frame = cellRect
        view.tag = 2
        view.layer.borderColor = UIColor(red:0.443, green:0.737, blue:0.471, alpha: 1).cgColor
        view.layer.borderWidth = 2
        
        self.view.addSubview(view)
        
        view.layoutIfNeeded()
        
        // Table animation
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.transportoTableView.alpha = 0.0
        })
        
        // Section animation
        
        let newHeigh : CGFloat = 100.0
        let newRect = CGRect(x: 0, y: 98 + newHeigh, width: cellRect.width, height: newHeigh)
        
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.frame = newRect
        })
        UIView.animate(withDuration: 0.4, delay: 0.1,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.layoutIfNeeded()
        }, completion : {  _ in
            self.constraint_section2_height.constant = newHeigh
            self.constraint_section3_height.constant = self.deviceHeight - 98 - newHeigh
            UIView.animate(withDuration: 0.5, delay: 0.0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 3,
                           options: UIViewAnimationOptions(),
                           animations: {
                            self.view.layoutIfNeeded()
            })
        })
    }
    
    func showEndTwo(index:IndexPath){
        let cellRect = transportoTableView.convert(transportoTableView.rectForRow(at: index), to: self.view)
        
        let view = transportoTableView.dequeueReusableCell(withIdentifier: "transporteCell") as! transportCell
        view.labelCompany.text = transportesOrganizacion[index.row]
        view.labelLugar.text = transportesNombre[index.row]
        view.labelPrecio.text = transportesPrecio[index.row].description
        view.frame = cellRect
        view.tag = 3
        view.layer.borderColor = UIColor(red:0.443, green:0.737, blue:0.471, alpha: 1).cgColor
        view.layer.borderWidth = 2
        
        self.view.addSubview(view)
        
        view.layoutIfNeeded()
        
        // Table animation
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.transportoTableView.alpha = 0.0
        })
        
        // Section animation
        
        let newHeigh : CGFloat = 100.0
        let newRect = CGRect(x: 0, y: 98 + newHeigh, width: cellRect.width, height: newHeigh)
        
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.frame = newRect
        })
        UIView.animate(withDuration: 0.4, delay: 0.1,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.layoutIfNeeded()
        }, completion : {  _ in
            self.constraint_section2_height.constant = newHeigh
            UIView.animate(withDuration: 0.5, delay: 0.0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 3,
                           options: UIViewAnimationOptions(),
                           animations: {
                            self.view.layoutIfNeeded()
            })
        })
    }
    
    func showEnd(index:IndexPath){
        let cellRect = hospedajoTableView.convert(hospedajoTableView.rectForRow(at: index), to: self.view)
        
        let view = hospedajoTableView.dequeueReusableCell(withIdentifier: "hospedajeCell") as! hospedaCell
        view.setup(object: OBJ_Hospedaje.createArray()[index.row])
        view.frame = cellRect
        view.tag = 3
        view.layer.borderColor = UIColor(red:0.443, green:0.737, blue:0.471, alpha: 1).cgColor
        view.layer.borderWidth = 2
        
        self.view.addSubview(view)
        
        view.layoutIfNeeded()
        
        // Table animation
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.hospedajoTableView.alpha = 0.0
        })
        
        // Section animation
        
        let newHeigh : CGFloat = 100.0
        let newRect = CGRect(x: 0, y: 98 + newHeigh + newHeigh, width: cellRect.width, height: newHeigh)
        
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.frame = newRect
        })
        UIView.animate(withDuration: 0.4, delay: 0.1,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 3,
                       options: UIViewAnimationOptions(),
                       animations: {
                        view.layoutIfNeeded()
        }, completion : {  _ in
            self.constraint_section3_height.constant = newHeigh
            UIView.animate(withDuration: 0.5, delay: 0.0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 3,
                           options: UIViewAnimationOptions(),
                           animations: {
                            self.view.layoutIfNeeded()
            })
        })
    }
    
}
