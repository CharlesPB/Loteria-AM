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
    
    var listaCartas = [String](arrayLiteral: "taza", "baston", "pastillero", "jarabe", "cafe", "termometro", "cama", "libros", "juegos de mesa", "enfermero", "inyeccion", "pastillas", "suero", "reloj", "lentes", "bolsa", "dentadura", "sillon", "lupa", "pijamas", "cepillo", "maletin", "pantunflas", "bufanda", "guantes", "camion", "fotos", "camara", "sombrero")
    
    
    var posOcupadas = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var ficha = "fichaRoja"
    
    var listaTabla = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    var listaBackUp = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    
    var gano = false
    
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
        }
    }
    
    // función para validar si ya se ganó
    func checarGano(){
        // checar horizontales
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
        
        // checar verticales
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
        
        // checar diagonales
        if ((posOcupadas[0] == true) && (posOcupadas[5] == true) && (posOcupadas[10] && true) && (posOcupadas[15] == true) ) {
            gano = true
        }
        if ((posOcupadas[3] == true) && (posOcupadas[6] == true) && (posOcupadas[9] && true) && (posOcupadas[12] == true) ) {
            gano = true
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
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
