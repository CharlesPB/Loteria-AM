//
//  ViewControllerModoGanar.swift
//  ProyFinal
//
//  Created by Alumno on 3/27/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit

class ViewControllerModoGanar: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var listaModoGanar = [String](arrayLiteral: "Vertical", "Horizontal", "Diagonal", "Cuadro Chico", "Cuadro Grande")
    var modoGanar : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaModoGanar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listaModoGanar[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modoGanar = listaModoGanar[indexPath.row]
        tableview.backgroundColor = UIColor.lightGray
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaJugador = segue.destination as! ViewControllerJugador
        vistaJugador.comoGanar = modoGanar
    }
    

}
