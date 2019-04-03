//
//  ViewControllerJugador.swift
//  ProyFinal
//
//  Created by Carlos Pérez 2 on 3/14/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit

class ViewControllerJugador: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var listaCartas = [String](arrayLiteral: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46")
    
    
    var posOcupadas = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var ficha = "fichaRoja"
    
    var listaTabla = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    var listaBackUp = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    
    var gano = false
    var comoGanar : String! = "Vertical"
    var modoGanar : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        
        self.title = "Modo jugador"
        listaCartas.shuffle()
        for i in 0...15 {
            listaTabla[i] = listaCartas[i]
            listaBackUp[i] = listaCartas[i]
        }
        
        modoGanar = comoGanar
        print(modoGanar)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! UICollectionViewCell
        
        
        
        collectionView.isPagingEnabled = true;
        
        
        //let nombreCarta = listaCartas[indexPath.row]
        let myCellImage = UIImageView(image: UIImage(named: listaTabla[indexPath.row]))
        cell.backgroundView = myCellImage
        
        /*if let image = UIImage(named: "taza") {
         let ratio = image.size.width / image.size.height
         if containerView.frame.width > containerView.frame.height {
         let newHeight = containerView.frame.width / ratio
         imageView.frame.size = CGSize(width: containerView.frame.width, height: newHeight)
         }
         else{
         let newWidth = containerView.frame.height * ratio
         imageView.frame.size = CGSize(width: newWidth, height: containerView.frame.height)
         }
         }*/
        
        //cell.contentView.addSubview(imageView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! UICollectionViewCell
        //        let myCellImage = UIImageView(image: UIImage(named: ficha))
        
        if posOcupadas[indexPath.item] == false {
            posOcupadas[indexPath.item] = true
            listaTabla[indexPath.item] = "ficha"
            
        } else {
            listaTabla[indexPath.item] = listaBackUp[indexPath.item]
            posOcupadas[indexPath.item] = false
            
        }
        
        checarGano()
        collectionView.reloadData()
        
        if gano == true {
            
            // se manda una mensaje de felicitaciones en caso de que ya se hayan llenado suficientes en la tabla
            
            let alerta = UIAlertController(title: "Felicidades", message: "Haz ganado", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)

            
            for i in 0...posOcupadas.count-1 {
                posOcupadas[i] = false
            }
            gano = false
            for i in 0...listaTabla.count-1 {
                listaTabla[i] = listaBackUp[i]
            }
        }
    }
    
    // función para validar si ya se ganó
    func checarGano(){
        // checar horizontales
        if modoGanar == "Horizontal" {
            if ((posOcupadas[0] == true) && (posOcupadas[1] == true) && (posOcupadas[2] && true) && (posOcupadas[3] == true) ) {
                gano = true
            }
            if ((posOcupadas[4] == true) && (posOcupadas[5] == true) && (posOcupadas[6] && true) && (posOcupadas[7] == true) ) {
                gano = true
            }
            if ((posOcupadas[8] == true) && (posOcupadas[9] == true) && (posOcupadas[10] && true) && (posOcupadas[11] == true) ) {
                gano = true
            }
            if ((posOcupadas[12] == true) && (posOcupadas[13] == true) && (posOcupadas[14] && true) && (posOcupadas[15] == true) ) {
                gano = true
            }
        }
        // checar verticales
        if modoGanar == "Vertical" {
            if ((posOcupadas[0] == true) && (posOcupadas[4] == true) && (posOcupadas[8] && true) && (posOcupadas[12] == true) ) {
                gano = true
            }
            if ((posOcupadas[1] == true) && (posOcupadas[5] == true) && (posOcupadas[9] && true) && (posOcupadas[13] == true) ) {
                gano = true
            }
            if ((posOcupadas[2] == true) && (posOcupadas[6] == true) && (posOcupadas[10] && true) && (posOcupadas[14] == true) ) {
                gano = true
            }
            if ((posOcupadas[3] == true) && (posOcupadas[7] == true) && (posOcupadas[11] && true) && (posOcupadas[15] == true) ) {
                gano = true
            }
        }
        
        // checar diagonales
        if modoGanar == "Diagonal"{
            if ((posOcupadas[0] == true) && (posOcupadas[5] == true) && (posOcupadas[10] && true) && (posOcupadas[15] == true) ) {
                gano = true
            }
            if ((posOcupadas[3] == true) && (posOcupadas[6] == true) && (posOcupadas[9] && true) && (posOcupadas[12] == true) ) {
                gano = true
            }
        }
        
        //checar cuadro chico centro
        if modoGanar == "Cuadro Chico"{
            if ((posOcupadas[5] == true) && (posOcupadas[6] == true) && (posOcupadas[9] && true) && (posOcupadas[10] == true) ) {
                gano = true
            }
        }
        
        //checar cuadro grande
        //cuetro esquinas
        if modoGanar == "Cuadro Grande"{
            if ((posOcupadas[0] == true) && (posOcupadas[3] == true) && (posOcupadas[12] && true) && (posOcupadas[15] == true) ) {
                gano = true
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Función para generar una nueva tabla
    //Al darle click al botón Nueva Tabla
    @IBAction func generaNuevaTabla(_ sender: Any) {
        listaCartas.shuffle()
        for i in 0...15 {
            listaTabla[i] = listaCartas[i]
            listaBackUp[i] = listaCartas[i]
        }
        for i in 0...posOcupadas.count-1 {
            posOcupadas[i] = false
        }
        gano = false
        collectionView.reloadData()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
