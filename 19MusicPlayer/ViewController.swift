//
//  ViewController.swift
//  18MusicPlayer
//
//  Created by Javier Gomez on 12/4/15.
//  Copyright © 2015 Javier Gomez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var volume: UISlider!
    @IBOutlet var navigate: UISlider!
    
    
    @IBAction func playButton(sender: AnyObject) {
        player.play()

    }


    @IBAction func volumeSlider(sender: AnyObject) {
        
        player.volume = volume.value

    }
    

    @IBAction func navigateSlider(sender: AnyObject) {
        
        //player es nstimer inverval y navigate es float, convertir navigate to timer
        player.currentTime = NSTimeInterval(navigate.value)
    }
    

    @IBAction func pauseButton(sender: AnyObject) {
        
        player.pause()

    }

    
    @IBAction func stopButton(sender: AnyObject) {
        
        player.pause()
        
        do
        {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("shereen", ofType: "mp3")!))
            navigate.value = 0
        }
        catch
        {
            //proccesa cualquierametodo que quieras si encuentra un error
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("shereen", ofType: "mp3")!
        
        do
        {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
            //player es nstimer hay que convertirlo a float
            navigate.maximumValue = Float(player.duration)
        }
        catch
        {
            //proccesa cualquierametodo que quieras si encuentra un error
        }
        
        //significa que nunca ustilzaremos la variable nunca le asignaremos algun valor
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateSlider"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSlider()
    {
        navigate.value = Float(player.currentTime)
    }
    
    
}

