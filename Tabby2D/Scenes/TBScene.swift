//
//  TBScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 11/1/15.
//  Copyright © 2015 Cyril Wei. All rights reserved.
//

import SpriteKit

public enum WorldLayer: CGFloat {
    case StaticBackground = -2048, DynamicBackground = -1024, Characters = 0, Foreground = 1024, Camera = 2048, HUD = 4096

    var nodeName: String {
        switch self {
        case .StaticBackground: return "staticbg"
        case .DynamicBackground: return "dynamicbg"
        case .Characters: return "characters"
        case .Foreground: return "foreground"
        case .Camera: return "camera"
        case .HUD: return "HUD"
        }
    }

    public var nodePath: String {
        return self == HUD ? "/world/\(Camera.nodeName)/\(nodeName)" : "/world/\(nodeName)"
    }

    static var allLayers = [StaticBackground, DynamicBackground, Characters, Foreground, HUD]
}

public class TBScene: SKScene, TBGameInputDelegate {
    private var lastUpdateTime: CFTimeInterval?

    public var theCamera: SKCameraNode = SKCameraNode() {
        didSet {
            oldValue.removeFromParent()

            self.addCamera()
        }
    }

    private var theWorld: SKNode?

    public override func didMoveToView(view: SKView) {
        super.didMoveToView(view)

        createTheWorld()
        addCamera()

        createWorldLayers()
    }

    public override func addChild(node: SKNode) {
        if let world = theWorld {
            world.addChild(node)
        } else {
            super.addChild(node)
        }
    }

    public func addChild(node: SKNode, toLayer layer: WorldLayer) {
        if let layerNode = self[layer.nodePath].first {
            layerNode.addChild(node)
        }
    }

    func createWorldLayers() {
        for layer in WorldLayer.allLayers {
            let layerNode = SKNode()
            layerNode.name = layer.nodeName
            layerNode.zPosition = layer.rawValue

            if layer == .HUD {
                self.theCamera.addChild(layerNode)
            } else {
                self.addChild(layerNode)
            }
        }
    }

    private func createTheWorld() {
        let worldNode = SKNode()
        worldNode.name = "world"
        self.addChild(worldNode)

        self.theWorld = worldNode
    }

    private func addCamera() {
        theCamera.name = WorldLayer.Camera.nodeName
        theCamera.zPosition = WorldLayer.Camera.rawValue
        self.addChild(theCamera)

        self.camera = theCamera
    }
    
    public func updateWithTimeInterval(timeInterval: CGFloat) {
        
    }
    
    public override func update(currentTime: CFTimeInterval) {
        guard let lastUpdateTime = self.lastUpdateTime else {
            self.lastUpdateTime = currentTime
            return
        }
        
        let timeInterval = CGFloat(currentTime - lastUpdateTime)
        self.lastUpdateTime = currentTime
        
        self.updateWithTimeInterval(timeInterval)
    }
}