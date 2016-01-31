//
//  TBTiledMap.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/15/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit
import SwiftyJSON

public enum TBMapRenderOrder: String {
    case RightDown = "RightDown"
    case RightUp = "RightUp"
    case LeftDown = "LeftDown"
    case LeftUp = "LeftUp"
}

public enum TBMapOrientation: String {
    case Orthogonal = "Orthogonal"
    case Isometric = "Isometric"
    case Staggered = "Staggered"
    case Hexagonal = "Hexagonal"
}

public enum TBMapScrollingType: String {
    case Infinite = "Infinite"
    case Finite = "Finite"
    case Fixed = "Fixed"
}

public struct TBTiledMap {
    public static let defaultTileSize = CGSizeMake(64.0, 32.0)

    public var version: Double

    public var orientation: TBMapOrientation
    public var renderOrder: TBMapRenderOrder

    public var xScrollingType: TBMapScrollingType
    public var yScrollingType: TBMapScrollingType
    
    public var tileWidth: CGFloat
    public var tileHeight: CGFloat
    
    public var backgroundcolor: UIColor

    public var atlases: [TBTiledAtlas]
    
    public var segments: [TBTiledMapSegment]

    public var layout: [Int]
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

        let orientation = TBMapOrientation(rawValue: json["orientation"].stringValue) ?? TBMapOrientation.Isometric
        let renderOrder = TBMapRenderOrder(rawValue: json["renderOrder"].stringValue) ?? TBMapRenderOrder.RightDown
        
        let xScrollingType = TBMapScrollingType(rawValue: json["xScrollingType"].stringValue) ?? TBMapScrollingType.Finite
        let yScrollingType = TBMapScrollingType(rawValue: json["yScrollingType"].stringValue) ?? TBMapScrollingType.Finite

        let tileWidth = CGFloat(json["tileWidth"].intValue)
        let tileHeight = CGFloat(json["tileHeight"].intValue)

        var atlases = [TBTiledAtlas]()
        for atlasJSON in json["atlases"].arrayValue {
            atlases.append(TBTiledAtlas.parse(atlasJSON))
        }

        var segments = [TBTiledMapSegment]()
        for segmentJSON in json["segments"].arrayValue {
            segments.append(TBTiledMapSegment.parse(segmentJSON))
        }

        let layout = json["layout"].arrayValue.map({ $0.intValue })

        return TBTiledMap(version: version
                , orientation: orientation
                , renderOrder: renderOrder
                , xScrollingType: xScrollingType
                , yScrollingType: yScrollingType
                , tileWidth: tileWidth
                , tileHeight: tileHeight
                , backgroundcolor: UIColor.blackColor()
                , atlases: atlases
                , segments: segments
                , layout: layout)
    }
}

extension TBTiledMap: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Tabby2D Tiled Map(version: \(version)); tile size: \(tileWidth)*\(tileHeight); atlases: \(atlases); segments: \(segments); layout: \(layout)"
    }
}