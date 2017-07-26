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
    var timebullet: Timer!
    var timecreatebull: Timer!
    var timecreateene: Timer!
    var timertrooper: Timer!
    var timeennemy: Timer!
    var arraybull = [UIImageView]()
    var arrayenemy = [UIImageView]()
    var trooperimg = [UIImage]()
    var playerscore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.center = CGPoint(x: 135, y: 552)
        WalkingTrooper()
        makeBullet()
        makeEnemy()
    }
    
    @IBOutlet weak var Player: UIImageView!
    
    @IBOutlet weak var Score: UILabel!
    
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
    
    func WalkingTrooper() {
        var i = 0
        trooperimg = [UIImage(named: "troopers1.png")!, UIImage(named: "troopers2.png")!, UIImage(named: "troopers3.png")!, UIImage(named: "troopers4.png")!, UIImage(named: "troopers5.png")!, UIImage(named: "troopers6.png")!]
        timertrooper = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(l:Timer) in
            self.Player.image = self.trooperimg[i]
            i += 1
            if (i == 6) {
                i = 0
            }
        })
    }
    
    
    func makeBullet() {
        timecreatebull = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: {(l:Timer) in
            self.Bullet()
            self.arraybull.forEach({(bullet: UIImageView) in
                if (bullet.center.y <= self.view.frame.minY) {
                    self.arraybull.remove(at: self.arraybull.index(of : bullet)!)
                    bullet.removeFromSuperview()
                }
            })
        })
        MoveBull()
    }
    
    func Bullet() {
        let img = "mainlasershot.png"
        let imgbullet = UIImage(named: img)
        let bullet = UIImageView(image : imgbullet)
        bullet.frame = CGRect(x: self.Player.center.x + 5, y: self.Player.frame.minY + 3, width: 12, height: 30)
        bullet.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(bullet)
        arraybull += [bullet]
    }
    
    func MoveBull() {
        timebullet = Timer.scheduledTimer(withTimeInterval: 0.002, repeats: true, block: {(l:Timer) in
            self.arraybull.forEach({(bullet: UIImageView) in
                bullet.center.y = bullet.center.y - 1
            })
        })
    }
    
    func makeEnemy() {
        timecreateene = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: {(l:Timer) in
            self.Enemy()
            self.arrayenemy.forEach({(enemy: UIImageView) in
                if (enemy.center.y <= self.view.frame.minY) {
                    self.arrayenemy.remove(at: self.arrayenemy.index(of : enemy)!)
                    enemy.removeFromSuperview()
                }
            })
        })
        MoveEnemy()
    }
    
    func Enemy() {
        var j = arc4random_uniform(UInt32(self.view.frame.maxX))
        let img = "Ennemies1.png"
        let imgenemy = UIImage(named: img)
        let enemy = UIImageView(image : imgenemy)
        enemy.frame = CGRect(x: Int(j), y: Int(self.view.frame.minY), width: 24, height: 60)
        enemy.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(enemy)
        arrayenemy += [enemy]
    }
    
    func MoveEnemy() {
        timeennemy = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: {(l:Timer) in
            self.arrayenemy.forEach({(enemy: UIImageView) in
                enemy.center.y = enemy.center.y + 1
                self.arraybull.forEach({(bullet: UIImageView) in
                    if (enemy.frame.intersects(bullet.frame)) {
                        self.arrayenemy.remove(at: self.arrayenemy.index(of : enemy)!)
                        enemy.removeFromSuperview()
                        self.arraybull.remove(at: self.arraybull.index(of : bullet)!)
                        bullet.removeFromSuperview()
                        self.playerscore += 5
                        self.Score.text = String(self.playerscore)
                    }
                })
            })
        })
    }
}
