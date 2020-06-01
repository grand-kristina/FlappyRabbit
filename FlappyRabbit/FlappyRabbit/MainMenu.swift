//
//  MainMenu.swift
//  FlappyRabbit
//
//  Created by Роман Андреев on 01.06.2020.
//  Copyright © 2020 Кристина Ярлыкова. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
       var newGameBtnNode:SKSpriteNode!
       
       override func didMove(to view: SKView) {
        
           newGameBtnNode = (self.childNode(withName: "newGameBtn") as! SKSpriteNode)

       }
       
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           let touch = touches.first
           
           if let location = touch?.location(in: self) {
               let nodesArray = self.nodes(at: location)
               
               if nodesArray.first?.name == "newGameBtn" {
                    if let scene = GameScene(fileNamed: "GameScene"){
                        let transition = SKTransition.crossFade(withDuration: 1)
                        view?.presentScene(scene, transition: transition)
                    }
                   
               } 
           }
       }
       
}
