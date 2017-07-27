//
//  GameOver.swift
//  BeatTheJedi
//
//  Created by Vinod Aroumougame on 27/07/2017.
//  Copyright © 2017 Vinod Aroumougame. All rights reserved.
//

import Foundation
import UIKit

class GameOver: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = String(GameVariable.Status.score)
        GameVariable.Status.score = 0
    }
    
    
    @IBOutlet weak var score: UILabel!
    
}
