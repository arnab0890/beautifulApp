//
//  ViewController.swift
//  beautifulApp
//
//  Created by arnab maity on 11/12/17.
//  Copyright © 2017 arnab maity. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var dogSound: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.isHidden = true
        button.imageView?.contentMode = .scaleAspectFit
        
        let soundFile = Bundle.main.path(forResource: "Dog-bark-and-sniffing", ofType: "mp3")
        
        do{
            try dogSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func hideLabel(){
        label.isHidden = true
    }
    @IBAction func bowbow(_ sender: Any) {
        dogSound.play()
        label.isHidden = false
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        
    }
    

}

