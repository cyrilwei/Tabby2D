//
//  TBScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/15/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit
import SwiftyJSON

extension TBScene {
    public static func tiledScene(size: CGSize, map: TBTiledMap) -> TBTiledScene {
        switch map.orientation {
        case .Isometric:
            let scene = TBIsometricTiledScene(size: size)
            scene.loadMap(map)
            return scene
        default:
            return TBTiledScene(size: size)
        }
    }
}