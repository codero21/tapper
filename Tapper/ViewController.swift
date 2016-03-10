//
//  ViewController.swift
//  Tapper
//
//  Created by Rollin Francois on 2/24/16.
//  Copyright © 2016 Rollin Francois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    
    
    // Properties
    var maxTaps = 0
    var currentTaps:Int = 0
    
    
    // Outlets
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapsBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!){
        currentTaps++
        updateTapsLbl()
        
        if isGameOver(){
            restartGame()
           }
    }
    
    // Actions
    @IBAction func onPlayBtnPressed(sender: UIButton!){
        
        // Validate texts
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != ""{
        
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            
            tapsBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapsBtn.hidden = true
        tapsLbl.hidden = true
        
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }else{
            return false
        }
    }
    
    func updateTapsLbl(){
        tapsLbl.text = "\(currentTaps) Taps"
    }
}

