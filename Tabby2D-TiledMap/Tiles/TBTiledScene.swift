//
//  TBTiledScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/1/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit

public class TBTiledScene: TBScene {
    private var map: TBTiledMap?
    
    public var atlasName: String {
        return map?.atlases.first?.name ?? ""
    }
    

    public func loadMap(map: TBTiledMap) {
        self.map = map
    }
    
    public override func didMoveToView(view: SKView) {
        super.didMoveToView(view)

        addMapNodes()
    }
    
    private func addMapNodes() {
        guard let map = map else { return }
        
        let halfTileWidth = map.tileWidth / 2.0
        let halfTileHeight = map.tileHeight / 2.0
        
        let tileSize = CGSizeMake(map.tileWidth, map.tileHeight)
        
        let atlas = SKTextureAtlas(named: atlasName)
        let atlasTiles = map.atlases.first?.tiles ?? [String]()
        
        for layer in map.segments.flatMap({ $0.layers }) {
            let mapNode = SKNode()
            mapNode.zPosition = layer.zPosition

            mapNode.position = CGPointMake(CGFloat(layer.xOffset - layer.yOffset) * halfTileWidth, CGFloat(layer.xOffset + layer.yOffset) * halfTileHeight)

            for y in 0..<layer.height {
                for x in 0..<layer.width {
                    let tileIndex = layer.data[y * layer.width + x] - 1
                    if tileIndex < 0 {
                        continue
                    }
                    
                    let node = SKSpriteNode(texture: atlas.textureNamed(atlasTiles[tileIndex]), size: tileSize)
                    node.userInteractionEnabled = false
                    
                    node.position = CGPointMake(CGFloat(x - y) * halfTileWidth, CGFloat(x + y) * halfTileHeight)
                    mapNode.addChild(node)
                }
            }
            self.addChild(mapNode, toLayer: layer.baseWorldLayer)
        }
    }
}