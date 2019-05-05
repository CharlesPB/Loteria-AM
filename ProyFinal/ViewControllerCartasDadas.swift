//
//  ViewControllerCartasDadas.swift
//  ProyFinal
//
//  Created by Daniela Garcia on 4/6/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit



class ViewControllerCartasDadas: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //@IBOutlet weak var img: UIImageView!
    
    var imgFoto: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!]
    
     var listaCartasYaDadas = [String]()
    var listaCartasYaDadasOrdenadas = [String]()
    
    var rotationAngle : CGFloat!
    var width : CGFloat!
    var height : CGFloat!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool { return false
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        listaCartasYaDadas = listaCartasYaDadas.reversed()
        
        
        
        rotationAngle = 90 * (.pi/180)

        var y = pickerView.frame.origin.y
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
//        pickerView.frame = CGRect(x: 0, y: y, width: view.frame.width, height: 400)
       pickerView.frame = CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height - 200)
        
        
        width = view.frame.width - 600
        height = view.frame.height - 100
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return listaCartasYaDadas.count
        //return imgFoto.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        img.image = UIImage(named: listaCartasYaDadas[row])!
//
//
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        rotationAngle = -90 * (.pi/180)
        
        
        let foto = UIImageView(image: UIImage(named: listaCartasYaDadas[row]))
       //var foto = UIImageView(frame: CGRectMake(0, 50, 320, 320))
        
        //var foto = UIImageView(image: imgFoto[row])
        
        foto.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        foto.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleBottomMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleRightMargin.rawValue | UIView.AutoresizingMask.flexibleLeftMargin.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
        foto.contentMode = UIView.ContentMode.scaleAspectFit
        
        //foto = UIImageView(image: UIImage(named: listaCartasYaDadas[row]))
        
        // Fixing image size in picker view
        // hh
        
        
        let containerView = UIView(frame: CGRect(x:0,y:0,width:width,height:height))

        let imageView = UIImageView()

        if let image = UIImage(named: "1") {
            let ratio = image.size.width / image.size.height
            if containerView.frame.width > containerView.frame.height {
                let newHeight = (containerView.frame.width / ratio) + 100
                foto.frame.size = CGSize(width: containerView.frame.width - 400, height: newHeight)
            }
            else{
                let newWidth = containerView.frame.height * ratio
                foto.frame.size = CGSize(width: newWidth, height: containerView.frame.height)
            }
        }

         foto.contentMode = UIView.ContentMode.scaleAspectFit
        
//        switch (row) {
//        case 0:
//            foto = UIImageView(image: imgFoto[row])
//        case 1:
//            foto = UIImageView(image: imgFoto[row])
//        case 2:
//            foto = UIImageView(image: imgFoto[row])
//        case 3:
//            foto = UIImageView(image: imgFoto[row])
//        case 4:
//            foto = UIImageView(image: imgFoto[row])
//        case 5:
//            foto = UIImageView(image: imgFoto[row])
//        case 6:
//            foto = UIImageView(image: imgFoto[row])
//
//        default:
//            foto.image = nil
//            return foto
//        }
        
        return foto
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return view.frame.width - 100
    }
}


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


