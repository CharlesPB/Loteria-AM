//
//  ViewControllerJugador.swift
//  ProyFinal
//
//  Created by Carlos Pérez 2 on 3/14/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewControllerJugador: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPopoverPresentationControllerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var btNuevaTabla: UIButton!
    @IBOutlet weak var btnZoom: UIButton!
    
    
    var nombreImgZoom : String!
    
    var audioPlayer: AVAudioPlayer?
    
    var listaCartas = [String](arrayLiteral: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49")
    
    
    var posOcupadas = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var ficha = "fichaRoja"
    
    var listaTabla = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    var listaBackUp = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    
    
    
    var gano = false
    var listaComoGanar = [Bool](arrayLiteral: false, false, false, false, false, false)
    
    
    
    // Variables para que vibre
    let selection = UISelectionFeedbackGenerator()
    let notification = UINotificationFeedbackGenerator()
    
    
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
        
        print(listaComoGanar)
        let longPress = UILongPressGestureRecognizer(target:self, action: "manejaGestoLongPress:")
        self.collectionView.addGestureRecognizer(longPress)
       
        btnZoom.isHidden = true
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! CollectionViewCellTabla
        
       
        cell.fondo.frame.size.width = collectionView.frame.width / 4
        cell.fondo.frame.size.height = collectionView.frame.height / 4
        
        cell.fondo.bringSubviewToFront(cell.btFicha)
        
        // Si está ocupada la carta, se pone la ficha y se pone gris
        if (posOcupadas[indexPath.row] == true) {
            cell.btFicha.isHidden = false
            cell.fondo.isHidden = false
            cell.fondo.bringSubviewToFront(cell.btFicha)
        }
        else { // Si no está ocupada, se quita la ficha
            cell.btFicha.isHidden = true
            cell.fondo.isHidden = true
        }
        
        
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
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: self.width, height: self.height)
//        print(size)
//
//        return size
//
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! UICollectionViewCell
        //        let myCellImage = UIImageView(image: UIImage(named: ficha))
        
        // Vibra cuando se pone o quita una ficha
        selection.selectionChanged()
        
        // vibra en iphone 6s
        //AudioServicesPlaySystemSound(1519)
        
        nombreImgZoom = listaTabla[indexPath.item]
        
        if posOcupadas[indexPath.item] == false {
            posOcupadas[indexPath.item] = true
            //listaTabla[indexPath.item] = "ficha"
            
        } else {
            listaTabla[indexPath.item] = listaBackUp[indexPath.item]
            posOcupadas[indexPath.item] = false
            
        }
        
        checarGano()
        collectionView.reloadData()
        
        if gano == true {
            
            // se manda una mensaje de felicitaciones en caso de que ya se hayan llenado suficientes en la tabla
            
            // vibra cuando gana
            notification.notificationOccurred(.success)
            
            // iphone 6s
            //AudioServicesPlaySystemSound(1519)
            
            do{
                if let fileURL = Bundle.main.path(forResource: "winning", ofType: "mp3", inDirectory: "soundsLoteria") {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                } else {
                    print("No file with specified name exists")
                }
                audioPlayer?.play()
            } catch {
                print("coudn't load the file")
            }
            
            let alerta = UIAlertController(title: "Felicidades", message: "Haz ganado", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)

            
//            for i in 0...posOcupadas.count-1 {
//                posOcupadas[i] = false
//            }
            gano = false
//            for i in 0...listaTabla.count-1 {
//                listaTabla[i] = listaBackUp[i]
//            }
        }
    }
    
    @IBAction func limpiarTabla(_ sender: UIButton) {
        for i in 0...posOcupadas.count-1 {
            posOcupadas[i] = false
        }
        for i in 0...listaTabla.count-1 {
            listaTabla[i] = listaBackUp[i]
        }
        collectionView.reloadData()
    }
    // función para validar si ya se ganó
    func checarGano(){
        // checar horizontales
        if (listaComoGanar[1] == true){
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
        if (listaComoGanar[0] == true){
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
        if (listaComoGanar[2] == true){
            if ((posOcupadas[0] == true) && (posOcupadas[5] == true) && (posOcupadas[10] && true) && (posOcupadas[15] == true) ) {
                gano = true
            }
            if ((posOcupadas[3] == true) && (posOcupadas[6] == true) && (posOcupadas[9] && true) && (posOcupadas[12] == true) ) {
                gano = true
            }
        }
        
        //checar cuadro chico
        if (listaComoGanar[3] == true){
            if ((posOcupadas[0] == true) && (posOcupadas[1] == true) && (posOcupadas[4] && true) && (posOcupadas[5] == true) ) {
                gano = true
            }
            if ((posOcupadas[1] == true) && (posOcupadas[2] == true) && (posOcupadas[5] && true) && (posOcupadas[6] == true) ) {
                gano = true
            }
            if ((posOcupadas[2] == true) && (posOcupadas[3] == true) && (posOcupadas[6] && true) && (posOcupadas[7] == true) ) {
                gano = true
            }
            if ((posOcupadas[4] == true) && (posOcupadas[5] == true) && (posOcupadas[8] && true) && (posOcupadas[9] == true) ) {
                gano = true
            }
            if ((posOcupadas[5] == true) && (posOcupadas[6] == true) && (posOcupadas[9] && true) && (posOcupadas[10] == true) ) {
                gano = true
            }
            if ((posOcupadas[7] == true) && (posOcupadas[6] == true) && (posOcupadas[11] && true) && (posOcupadas[10] == true) ) {
                gano = true
            }
            if ((posOcupadas[8] == true) && (posOcupadas[12] == true) && (posOcupadas[9] && true) && (posOcupadas[13] == true) ) {
                gano = true
            }
            if ((posOcupadas[13] == true) && (posOcupadas[14] == true) && (posOcupadas[9] && true) && (posOcupadas[10] == true) ) {
                gano = true
            }
            if ((posOcupadas[11] == true) && (posOcupadas[14] == true) && (posOcupadas[15] && true) && (posOcupadas[10] == true) ) {
                gano = true
            }
        }
        
        //checar cuadro grande (esquinas)
        if (listaComoGanar[4] == true) {
            if ((posOcupadas[0] == true) && (posOcupadas[3] == true)  && (posOcupadas[12] && true) && (posOcupadas[15] == true) ) {
                gano = true
            }
        }
        
        // checar llena
        if (listaComoGanar[5] == true) {
            if ((posOcupadas[0] == true) && (posOcupadas[1] == true)  && (posOcupadas[2] == true) && (posOcupadas[3] == true) && (posOcupadas[4] == true) && (posOcupadas[5] == true)  && (posOcupadas[6] == true) && (posOcupadas[7] == true) && (posOcupadas[8] == true) && (posOcupadas[9] == true)  && (posOcupadas[10] == true) && (posOcupadas[11] == true) && (posOcupadas[12] == true) && (posOcupadas[13] == true)  && (posOcupadas[14] == true) && (posOcupadas[15] == true)) {
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
    
    @IBAction func manejaGestoLongPress(_ sender: UILongPressGestureRecognizer) {
        
        let posicion = sender.location(in: self.collectionView)
        
        if let indexPath = self.collectionView.indexPathForItem(at: posicion){
            let cell = self.collectionView.cellForItem(at: indexPath)
            nombreImgZoom = listaTabla[indexPath.item]
            performSegue(withIdentifier: "seguePopOver", sender: indexPath)
        }
        
        
        
    }
    
    
    
    // método de delegado de popover presentation controller
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return .none
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaZoom = segue.destination as! ViewControllerPopOver
        vistaZoom.popoverPresentationController!.delegate = self
        //vistaZoom.popoverPresentationController?.sourceRect
        //vistaZoom.popoverPresentationController?.sourceRect = CGRect(self.view.bounds.midX, self.view.bounds.midY,0.0,0.0)
        // width 350, height 400 del popover
        /*
         let inicioX = (self.view.bounds.maxX - 350)
         let inicioY = (self.view.bounds.maxY - 400)
         vistaZoom.popoverPresentationController?.sourceRect = CGRect(x: inicioX, y: inicioY, width: 0.0, height: 0.0)
         
         let viewForSource = sender as! UIView
         vistaZoom.popoverPresentationController?.sourceView = viewForSource
         vistaZoom.popoverPresentationController?.sourceRect = viewForSource.bounds
         */
        
       
        //vistaZoom.popoverPresentationController?.preferredContentSize = CGSize(350, 400)
        
        vistaZoom.nombreImg = nombreImgZoom
        
    }
    
}

extension  ViewControllerJugador: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let size = CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height / 4)
        return size
        
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout
//        collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1.0
//    }
}
