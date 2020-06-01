//
//  GameScene.swift
//  FlappyRabbit
//
//  Created by Кристина Ярлыкова on 21.04.2020.
//  Copyright © 2020 Кристина Ярлыкова. All rights reserved.
//

import SpriteKit
import GameplayKit

//скасен - объект который организует все активное содержиое спрайт-кит
//физиксделигат обозначает что при соприкосновении мы будем делать какое либо действие (триггер)
// физикдел - методы которые можно реализовать для ответа когда объект вступает в контакт
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroundNode : SKNode!
    var rabbitNode : SKSpriteNode!
    var gameOverLabel : SKLabelNode!
    //сквью - подкласс, отображает сцену спрайт-кит
    override func didMove(to view: SKView) {
        
        
        backgroundNode = self.childNode(withName: "background")!
        
        // переводим тип через ас!
        rabbitNode = (self.childNode(withName: "rabbit") as! SKSpriteNode)
        gameOverLabel = (self.childNode(withName: "gameOverLabel") as! SKLabelNode)
        
        gameOverLabel.alpha = 0
        // это означает что мы будем оценивать даже соприкосновения/действия именно в нашей сцене
        // драйвер физ движка в сцене, он дает возможность настроить и запросить физическую систему
        //контдел - два физ тема вступают в конктакт
        //физворлд- физ моделирование связан с этой сценой
        self.physicsWorld.contactDelegate = self
        
        //скаэкшен - объект запускается спрайтом для изменения его структуры или содержимого
        let moveBackground = SKAction.move(by: CGVector(dx: -7500, dy: 0), duration: 70)
        
        backgroundNode.run(moveBackground)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //! означает что физика точно приссутствует/ что она не нан
        //физбоди - объект который добавляет физическую силу спрайту
        rabbitNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 3))
        
    }
    
    func stopGame(){
        backgroundNode.removeAllActions()
        //обозначает что кролик зависнит
        rabbitNode.physicsBody!.pinned = true
        gameOverLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    //дидбегин - вызывается когда два тема контактируют друг с другом
    // все что тут будет, будет происходить после соприкосновения объектов
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
}

