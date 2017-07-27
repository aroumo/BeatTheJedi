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
    var timersurvive: Timer!
    var timeennemy: Timer!
    var timeenwalk1: Timer!
    var timeenwalk2: Timer!
    var vitesse: Double = 0.02
    var life: Int = 2
    var arraybull = [UIImageView]()
    var arrayenemy = [UIImageView]()
    var trooperimg = [UIImage]()
    var enemyimg1 =  [UIImage(named: "Ennemies1.png")!, UIImage(named: "Ennemies2.png")!, UIImage(named: "Ennemies3.png")!, UIImage(named: "Ennemies2.png")!]
    var enemyimg2 =  [UIImage(named: "Ennemies4.png")!, UIImage(named: "Ennemies5.png")!, UIImage(named: "Ennemies6.png")!, UIImage(named: "Ennemies5.png")!]
    var HP_img =  [UIImage(named: "heart1.png")!, UIImage(named: "heart2.png")!, UIImage(named: "heart3.png")!]
    var Obiwan_img =  [UIImage(named: "WalkingObiWan1.png")!, UIImage(named: "ObiWan.png")!, UIImage(named: "WalkingObiWan2.png")!, UIImage(named: "ObiWan.png")!]
    var MaceWindu_img =  [UIImage(named: "WalkingMaceWindu1.png")!, UIImage(named: "MaceWindu.png")!, UIImage(named: "WalkingMaceWindu2.png")!, UIImage(named: "MaceWindu.png")!]
    var Yoda_img =  [UIImage(named: "Walking_Yoda1.png")!, UIImage(named: "Standing_Yoda.png")!, UIImage(named: "Walking_Yoda2.png")!, UIImage(named: "Standing_Yoda.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.center = CGPoint(x: 135, y: 552)
        WalkingTrooper()
        makeBullet()
        makeEnemy()
    }
    
    @IBOutlet weak var Player: UIImageView!
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var HPbar: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch : UITouch! = touches.first!
        
        location = touch.location(in: self.view)
        
        Player.center = location
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch : UITouch! = touches.first!
        
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
        timecreatebull = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {(l:Timer) in
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
        let j = arc4random_uniform(UInt32(self.view.frame.maxX - 20))
        let k = arc4random_uniform(UInt32(100))
        var imgenemy = UIImage()
        if (k <= 50) {
            imgenemy = UIImage(named: "Ennemies1.png")!
        }
        else if (k <= 85) {
            imgenemy = UIImage(named: "Ennemies4.png")!
        }
        else if (k <= 90) {
            imgenemy = UIImage(named: "ObiWan.png")!
        }
        else if (k <= 95) {
            imgenemy = UIImage(named: "MaceWindu.png")!
        }
        else {
            imgenemy = UIImage(named: "Standing_Yoda.png")!
        }
        let enemy = UIImageView(image : imgenemy)
        enemy.frame = CGRect(x: Int(j), y: Int(self.view.frame.minY), width: 34, height: 80)
        enemy.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(enemy)
        if (k <= 50) {
            WalkingEnemy(enemy: enemy, choice: 0)
        }
        else if (k <= 85) {
            WalkingEnemy(enemy: enemy, choice: 1)
        }
        else if (k <= 90) {
            WalkingEnemy(enemy: enemy, choice: 2)
        }
        else if (k <= 95) {
            WalkingEnemy(enemy: enemy, choice: 3)
        }
        else {
            WalkingEnemy(enemy: enemy, choice: 4)
        }
        arrayenemy += [enemy]
    }
    
    func MoveEnemy() {
        timeennemy = Timer.scheduledTimer(withTimeInterval: self.vitesse, repeats: true, block: {(l:Timer) in
            self.arrayenemy.forEach({(enemy: UIImageView) in
                enemy.center.y = enemy.center.y + 1
                self.arraybull.forEach({(bullet: UIImageView) in
                    if (enemy.frame.intersects(bullet.frame)) {
                        self.arrayenemy.remove(at: self.arrayenemy.index(of : enemy)!)
                        enemy.removeFromSuperview()
                        self.arraybull.remove(at: self.arraybull.index(of : bullet)!)
                        bullet.removeFromSuperview()
                        GameVariable.Status.score += 5
                        self.Score.text = String(GameVariable.Status.score)
                    }
                })
                if (enemy.frame.intersects(self.Player.frame)) {
                    self.life -= 1
                    if (self.life == -1) {
                        self.GameOver()
                        self.life = 2
                    }
                    else {
                        self.HPbar.image = self.HP_img[self.life]
                        self.arrayenemy.remove(at: self.arrayenemy.index(of : enemy)!)
                        enemy.removeFromSuperview()
                    }
                }
            })
        })
    }
    
    func WalkingEnemy(enemy: UIImageView, choice: Int) {
        var i = 0
        if (choice == 0) {
            timeenwalk1 = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(l:Timer) in
                enemy.image = self.enemyimg1[i]
                i += 1
                if (i == 4) {
                    i = 0
                }
            })
        }
        else if (choice == 1) {
            timeenwalk2 = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(l:Timer) in
                enemy.image = self.enemyimg2[i]
                i += 1
                if (i == 4) {
                    i = 0
                }
            })
        }
        else if (choice == 2) {
            timeenwalk2 = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(l:Timer) in
                enemy.image = self.Obiwan_img[i]
                i += 1
                if (i == 4) {
                    i = 0
                }
            })
        }
        else if (choice == 3) {
            timeenwalk2 = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(l:Timer) in
                enemy.image = self.MaceWindu_img[i]
                i += 1
                if (i == 4) {
                    i = 0
                }
            })
        }
        else {
            timeenwalk2 = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: {(l:Timer) in
                enemy.image = self.Yoda_img[i]
                i += 1
                if (i == 4) {
                    i = 0
                }
            })
        }
    }
    
    func GameOver() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameOver") as! GameOver!
        self.navigationController?.pushViewController(secondViewController!, animated: true)
        self.present(secondViewController!, animated: true)
    }
}
