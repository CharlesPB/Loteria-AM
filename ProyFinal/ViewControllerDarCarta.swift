//
//  ViewControllerDarCarta.swift
//  ProyFinal
//
//  Created by Carlos Pérez 2 on 3/14/19.
//  Copyright © 2019 Carlos Pérez 2. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerDarCarta: UIViewController {
    
    @IBOutlet weak var imgCarta: UIImageView!
    var audioPlayer: AVAudioPlayer?
    var nombreAudio: String?
    
    var listaCartas = [String](arrayLiteral: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49")
    
    var listaCartasDadas = [String]()
    
    let selection = UISelectionFeedbackGenerator()
    
    
    //  hhh
    
    var index : Int = 0
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool { return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Dar la carta"
        
        
        listaCartas.shuffle()
        imgCarta.image = UIImage(named: listaCartas[index])
        
        do{
            if let fileURL = Bundle.main.path(forResource: listaCartas[index], ofType: "m4a", inDirectory: "soundsLoteria") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            } else {
                print("No file with specified name exists")
            }
            audioPlayer?.play()
        } catch {
            print("coudn't load the file")
        }
        
        listaCartasDadas.append(listaCartas[index])
        //listaCartas.remove(at: index)
        index = index + 1
        
        
    }
    

    
    @IBAction func siguienteCarta(_ sender: UIButton) {
        if index < listaCartas.count{
            imgCarta.image = UIImage(named: listaCartas[index])
            
            do{
                if let fileURL = Bundle.main.path(forResource: listaCartas[index], ofType: "m4a", inDirectory: "soundsLoteria") {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                } else {
                    print("No file with specified name exists")
                }
                audioPlayer?.play()
            } catch {
                print("coudn't load the file")
            }
            
            listaCartasDadas.append(listaCartas[index])
            //listaCartas.remove(at: index)
            index = index + 1
            selection.selectionChanged()
        }
    }
    
    @IBAction func btnSonido(_ sender: UIButton) {
        do{
            if let fileURL = Bundle.main.path(forResource: listaCartas[index - 1], ofType: "m4a", inDirectory: "soundsLoteria") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            } else {
                print("No file with specified name exists")
            }
            audioPlayer?.play()
        } catch {
            print("coudn't load the file")
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vistaCartasDadas = segue.destination as! ViewControllerCartasDadas
        vistaCartasDadas.listaCartasYaDadas = listaCartasDadas
        //vistaCartasDadas.listaCartasYaDadas = listaCartas
        
    }
    

}
