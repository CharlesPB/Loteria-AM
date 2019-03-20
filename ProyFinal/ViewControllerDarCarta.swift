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
    
    var listaCartas = [String](arrayLiteral: "taza", "baston", "pastillero", "jarabe", "cafe", "termometro", "cama", "libros", "juegos de mesa", "enfermero", "inyeccion", "pastillas", "suero", "reloj", "lentes", "bolsa", "dentadura", "sillon", "lupa", "pijamas", "cepillo", "maletin", "pantunflas", "bufanda", "guantes", "camion", "fotos", "camara", "sombrero")
    
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
        imgCarta.image = UIImage(named: listaCartas[index])
        listaCartasDadas.append(listaCartas[index])
        listaCartas.remove(at: index)
        index = index + 1
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
