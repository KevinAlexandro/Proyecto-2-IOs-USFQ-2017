//
//  ViewController.swift
//  GraficadorProyecto2
//
//  Created by user130165 on 9/25/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

var nroLadosSelec = 3
var colorBordeSelec = UIColor.red
var colorRellenoSelec = UIColor.red

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var PickerLados: UIPickerView!
    @IBOutlet weak var PickerRelleno: UIPickerView!
    @IBOutlet weak var PickerBorde: UIPickerView!
    
    let LadosArr = [3,4,5,6,7,8]
    let ColoresAr=["Rojo","Amarillo","Azul","Verde","Negro","Blanco","Naranja","Gris"]
    let ColorsArr = [UIColor.red , UIColor.yellow ,UIColor.blue, UIColor.green , UIColor.black , UIColor.white ,
                     UIColor.orange, UIColor.gray]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let pickerTag = pickerView.tag
        switch pickerTag {
        case 0:
            return String(LadosArr[row])
        default:
            return ColoresAr[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        let pickerTag = pickerView.tag
        switch pickerTag {
        case 0:
            return LadosArr.count
        default:
            return ColoresAr.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickerTag = pickerView.tag
        switch pickerTag {
        case 0:
            nroLadosSelec = LadosArr[row]
        case 1:
            colorRellenoSelec = ColorsArr[row]
        case 2:
            colorBordeSelec = ColorsArr[row]
        default:
            NSLog("Error")
        }
    }
    
    override func viewDidLoad() {
        PickerLados.delegate = self
        PickerLados.dataSource = self
        PickerBorde.delegate = self
        PickerBorde.dataSource = self
        PickerRelleno.delegate = self
        PickerRelleno.dataSource = self
    }
    
    @IBAction func IniciarView(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToNextView" , sender: self)
    }

}

