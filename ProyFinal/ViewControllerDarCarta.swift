//
//  ViewControllerDarCarta.swift
//  ProyFinal
//
//  Created by Carlos Pérez 2 on 3/14/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit

class ViewControllerDarCarta: UIViewController {
    
    @IBOutlet weak var imgCarta: UIImageView!
    
    var listaCartas = [String](arrayLiteral: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46")
    
    var listaCartasDadas = [String]()
    
    
    var index : Int = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Dar la carta"
        
        listaCartas.shuffle()
        imgCarta.image = UIImage(named: listaCartas[index])
        listaCartasDadas.append(listaCartas[index])
        listaCartas.remove(at: index)
        index = index + 1
        
        
    }
    

    
    @IBAction func siguienteCarta(_ sender: UIButton) {
        if index < listaCartas.count{
            imgCarta.image = UIImage(named: listaCartas[index])
            listaCartasDadas.append(listaCartas[index])
            listaCartas.remove(at: index)
            index = index + 1
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vistaCartasDadas = segue.destination as! TableViewControllerCartasDadas
        vistaCartasDadas.listaCartasYaDadas = listaCartasDadas
    }
    

}
