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
    
    
    var array = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Seventh Cell", "Eighth Cell", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! UICollectionViewCell
        
//        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 40))
//        title.textColor = UIColor.black
//        title.text = array[indexPath.row]
//        title.textAlignment = .center
        
        //let containerView = UIView(frame: CGRect(x:0,y:0,width:320,height:500))
        //let imageView = UIImageView()
        collectionView.isPagingEnabled = true;
        listaCartas.shuffle()
        let myCellImage = UIImageView(image: UIImage(named: listaCartas[indexPath.row]))
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
    

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        
        self.title = "Modo jugador"
        listaCartas.shuffle()

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
