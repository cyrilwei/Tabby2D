//
//  TBScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 11/1/15.
//  Copyright © 2015 Cyril Wei. All rights reserved.
//

import SpriteKit

public enum WorldLayer: CGFloat {
    case StaticBackground = -100, DynamicBackground = -50, Characters = 0, Foreground = 1000, Camera = 1024, HUD = 1100

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

        let foundNodes = self[WorldLayer.HUD.nodePath]
        print(foundNodes)
    }

    public override func addChild(node: SKNode) {
        if let world = theWorld {
            world.addChild(node)
        } else {
            super.addChild(node)
        }
    }

    func createWorldLayers() {
        for layer in WorldLayer.allLayers {
            let layerNode = SKNode()
            layerNode.name = layer.nodeName

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
        self.addChild(theCamera)

        self.camera = theCamera
    }
}