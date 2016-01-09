//
//  TBTiledScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/1/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit

public class TBTiledScene: TBScene {
    public static let defaultTileSize = CGSizeMake(64.0, 32.0)
    public var tileSize: CGSize

    public init(size: CGSize, tileSize: CGSize = TBTiledScene.defaultTileSize) {
        self.tileSize = tileSize

        super.init(size: size)
    }

    public required init?(coder aDecoder: NSCoder) {
        self.tileSize = TBTiledScene.defaultTileSize

        super.init(coder: aDecoder)
    }
}