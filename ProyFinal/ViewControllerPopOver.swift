//
//  ViewControllerPopOver.swift
//  ProyFinal
//
//  Created by Carlos Pérez 2 on 4/25/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit

class ViewControllerPopOver: UIViewController {
    
    @IBOutlet weak var imgSeleccionada: UIImageView!
    
    var nombreImg : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgSeleccionada.image = UIImage(named: nombreImg)
    }
    
    /*
     override func viewWillAppear(_ animated: Bool) {
     let vista1 = presentingViewController as! ViewControllerJugador
     
     }
     
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
