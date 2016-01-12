//
//  TBDirector.swift
//  Tabby2D
//
//  Created by Cyril Wei on 11/1/15.
//  Copyright © 2015 Cyril Wei. All rights reserved.
//

import SpriteKit

public class TBDirector {
    private var stageView: SKView {
        didSet {
            initStageView()
        }
    }
    
    private var scenes = [String: TBScene]()
    
    public init(stageView: SKView) {
        self.stageView = stageView
        initStageView()
    }
    
    public func registerScene(scene: TBScene, withSceneIdentifier sceneID: String) {
        scenes[sceneID] = scene
    }
    
    public func transitionToSceneWithSceneIdentifier(sceneID: String) {
        if let scene = scenes[sceneID] {
            stageView.presentScene(scene)
        }
    }
    
    private func initStageView() {
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        stageView.ignoresSiblingOrder = true
        
        stageView.showsFPS = true
        stageView.showsNodeCount = true
    }
}