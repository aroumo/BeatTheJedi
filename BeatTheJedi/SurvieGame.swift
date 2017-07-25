//
//  SurvieGame.swift
//  BeatTheJedi
//
//  Created by Vinod Aroumougame on 24/07/2017.
//  Copyright © 2017 Vinod Aroumougame. All rights reserved.
//

import Foundation
import UIKit


class SurvieGame: UIViewController {
    
    var location = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.center = CGPoint(x: 135, y: 552)
    }
    
    @IBOutlet weak var Player: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch : UITouch! = touches.first!
        
        location = touch.location(in: self.view)
        
        Player.center = location
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch : UITouch! = touches.first!
        
        location = touch.location(in: self.view)
        
        Player.center = location
        
    }
}
