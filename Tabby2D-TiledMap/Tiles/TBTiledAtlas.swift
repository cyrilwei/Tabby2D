//
//  TBTiledAtlas.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/15/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit
import SwiftyJSON

public struct TBTiledAtlas {
    public var name: String
    public var tiles: [String]
}

extension TBTiledAtlas {
    public static func parse(json: JSON) -> TBTiledAtlas {
        let name = json["name"].stringValue
        let tiles = json["tiles"].arrayObject as? [String] ?? [String]()

        return TBTiledAtlas(name: name, tiles: tiles)
    }
}

extension TBTiledAtlas: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Atlas: \(name), tiles: \(tiles)"
    }
}
