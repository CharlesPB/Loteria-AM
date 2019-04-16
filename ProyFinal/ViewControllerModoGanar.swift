//
//  ViewControllerModoGanar.swift
//  ProyFinal
//
//  Created by Alumno on 3/27/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit

class ViewControllerModoGanar: UIViewController {
   
    var listaModoGanarSeleccionado = [Bool](arrayLiteral: true, false, false, false, false, false)
    
    //var listaModoGanar = [String](arrayLiteral: "Vertical", "Horizontal", "Diagonal", "Cuadro Chico", "Cuadro Grande")
    //var modoGanar : String!
    
    let selection = UISelectionFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Seleccionar cómo ganar"
        
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func seleccionaModoGanar( sender: UIButton) {
        // Vertical
        if (sender.tag == 0) {
            // Vertical check
            if (!listaModoGanarSeleccionado[sender.tag]) {
            sender.setBackgroundImage(UIImage(named: "verticalCheck"), for: .normal)
                listaModoGanarSeleccionado[sender.tag] = true
            }
            // Vertical uncheck
            else {
                sender.setBackgroundImage(UIImage(named: "vertical"), for: .normal)
                listaModoGanarSeleccionado[sender.tag] = false
            }
        }
        else {
            // Horizontal
            if (sender.tag == 1) {
                // Horizontal check
                if (!listaModoGanarSeleccionado[sender.tag]) {
                    sender.setBackgroundImage(UIImage(named: "horizontalCheck"), for: .normal)
                    listaModoGanarSeleccionado[sender.tag] = true
                }
                    // Horizontal uncheck
                else {
                    sender.setBackgroundImage(UIImage(named: "horizontal"), for: .normal)
                    listaModoGanarSeleccionado[sender.tag] = false
                }
            }
            else {
                // Diagonal
                if (sender.tag == 2) {
                    // Diagonal check
                    if (!listaModoGanarSeleccionado[sender.tag]) {
                        sender.setBackgroundImage(UIImage(named: "diagonalCheck"), for: .normal)
                        listaModoGanarSeleccionado[sender.tag] = true
                    }
                        // Diagonal uncheck
                    else {
                        sender.setBackgroundImage(UIImage(named: "diagonal"), for: .normal)
                        listaModoGanarSeleccionado[sender.tag] = false
                    }
                }
                else {
                    // Cuadro chico
                    if (sender.tag == 3) {
                        // Cuadro chico check
                        if (!listaModoGanarSeleccionado[sender.tag]) {
                            sender.setBackgroundImage(UIImage(named: "cuadroChicoCheck"), for: .normal)
                            listaModoGanarSeleccionado[sender.tag] = true
                        }
                            // Cuadro chico uncheck
                        else {
                            sender.setBackgroundImage(UIImage(named: "cuadroChico"), for: .normal)
                            listaModoGanarSeleccionado[sender.tag] = false
                        }
                    }
                    else {
                        // Cuadro grande
                        if (sender.tag == 4) {
                            // Cuadro grande check
                            if (!listaModoGanarSeleccionado[sender.tag]) {
                                sender.setBackgroundImage(UIImage(named: "cuadroGrandeCheck"), for: .normal)
                                listaModoGanarSeleccionado[sender.tag] = true
                            }
                                // Cuadro grande uncheck
                            else {
                                sender.setBackgroundImage(UIImage(named: "cuadroGrande"), for: .normal)
                                listaModoGanarSeleccionado[sender.tag] = false
                            }
                        }
                        else {
                            // Llena
                            if (sender.tag == 5) {
                                // Llena check
                                if (!listaModoGanarSeleccionado[sender.tag]) {
                                    sender.setBackgroundImage(UIImage(named: "llenaCheck"), for: .normal)
                                    listaModoGanarSeleccionado[sender.tag] = true
                                }
                                    // Llena uncheck
                                else {
                                    sender.setBackgroundImage(UIImage(named: "llena"), for: .normal)
                                    listaModoGanarSeleccionado[sender.tag] = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaJugador = segue.destination as! ViewControllerJugador
        // Si no se seleccionó un modo de ganar, no se puede proseguir
        if (!listaModoGanarSeleccionado[0] && !listaModoGanarSeleccionado[1] && !listaModoGanarSeleccionado[2] && !listaModoGanarSeleccionado[3] && !listaModoGanarSeleccionado[4] && !listaModoGanarSeleccionado[5]) {
            //mandar un mensaje de alerta
            let alerta = UIAlertController(title: "Error", message: "Se debe seleccionar al menos una forma de ganar", preferredStyle: .alert)
        
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
            alerta.addAction(accion)
            
            present(alerta, animated: true, completion: nil)
        }
        else {
            vistaJugador.listaComoGanar = listaModoGanarSeleccionado
            
        }
        
       
    }
    

}
