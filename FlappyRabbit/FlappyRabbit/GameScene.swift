//
//  GameScene.swift
//  FlappyRabbit
//
//  Created by Кристина Ярлыкова on 21.04.2020.
//  Copyright © 2020 Кристина Ярлыкова. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var backgroundNode : SKNode!
    var rabbitNode : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        backgroundNode = self.childNode(withName: "background")!
        rabbitNode = (self.childNode(withName: "rabbit") as! SKSpriteNode)
        
        let moveBackground = SKAction.move(by: CGVector(dx: -1600, dy: 0), duration: 40)
        
        backgroundNode.run(moveBackground)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        rabbitNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 2))
        
    }
}

