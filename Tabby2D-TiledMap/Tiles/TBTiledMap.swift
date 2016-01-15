//
//  TBTiledMap.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/15/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit
import SwiftyJSON

public enum TBMapRenderOrder {
    case RightDown
    case RightUp
    case LeftDown
    case LeftUp
}

public enum TBMapOrientation: String {
    case Orthogonal = "orthogonal"
    case Isometric = "isometric"
    case Staggered = "staggered"
    case Hexagonal = "hexagonal"
}

public struct TBTiledMap {
    public static let defaultTileSize = CGSizeMake(64.0, 32.0)

    public var version: Double
    public var width: Int
    public var height: Int

    public var orientation: TBMapOrientation
    public var renderOrder: TBMapRenderOrder
    
    public var tileWidth: CGFloat
    public var tileHeight: CGFloat
    
    public var backgroundcolor: UIColor

    public var layers: [TBTiledLayer]
    public var atlases: [TBTiledAtlas]
}

extension TBTiledMap {
    public static func loadFromFile(named fileName: String) -> TBTiledMap? {
        guard let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: ".json"), let mapData = try? String(contentsOfFile: filePath) else { return nil }
        
        return parse(mapData)
    }

    public static func parse(dataString: String) -> TBTiledMap {
        let json = JSON.parse(dataString)

        return parse(json)
    }

    private static func parse(json: JSON) -> TBTiledMap {
        let version = json["version"].doubleValue
        let width = json["width"].intValue
        let height = json["height"].intValue

        let orientation = TBMapOrientation(rawValue: json["orientation"].stringValue) ?? TBMapOrientation.Isometric

        let tileWidth = CGFloat(json["tileWidth"].intValue)
        let tileHeight = CGFloat(json["tileHeight"].intValue)

        var layers = [TBTiledLayer]()
        for layerJSON in json["layers"].arrayValue {
            layers.append(TBTiledLayer.parse(layerJSON))
        }

        var atlases = [TBTiledAtlas]()
        for atlasJSON in json["atlases"].arrayValue {
            atlases.append(TBTiledAtlas.parse(atlasJSON))
        }

        return TBTiledMap(version: version
                , width: width
                , height: height
                , orientation: orientation
                , renderOrder: .RightDown
                , tileWidth: tileWidth
                , tileHeight: tileHeight
                , backgroundcolor: UIColor.blackColor()
                , layers: layers
                , atlases: atlases)
    }
}

extension TBTiledMap: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "TMX(version: \(version)) map size: \(width)*\(height), tile size: \(tileWidth)*\(tileHeight). layers: \(layers). atlases: \(atlases)"
    }
}