//
//  SKTableViewNode.swift
//  SceneTest
//
//  Created by HanHaikun on 2020/1/20.
//  Copyright © 2020 HanHaikun. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

fileprivate enum UIlayer: CGFloat {
    case BackgroundLayer, ForegroundLayer
}

//  MARK: - SKTableViewNode

public class SKTableViewNode: SKNode {
    
    //  MARK: - public
    //Delegate
    public weak var delegate: SKTableViewDelegate?
    public weak var dataSource: SKTableViewDataSource?
    
    //Appearance
    public var backgroundNode: SKNode? {
        didSet {
            oldValue?.removeFromParent()
            if backgroundNode != nil {
                backgroundLayer.addChild(backgroundNode!)
            }
        }
    }
    public var tableHeaderNode: SKNode?
    public var tableFooterNode: SKNode?
    
    
    //  MARK: - public method
    
    //Update method, to bo called in scene's update.
    public func update(_ currentTime: TimeInterval) {
        
    }
    
    
    //  MARK: - private
    private var backgroundLayer: SKNode = SKNode()
    private var foregroundLayer: SKNode = SKNode()
    
}


//  MARK: - SKTableViewNodeCell

public class SKTableViewNodeCell: SKNode {
    
}


//  MARK: - SKTableViewNodeHeadFoot

public class SKTableViewNodeHeadFoot: SKNode {
    
}


//  MARK: - SKTableViewDelegate

public protocol SKTableViewDelegate: class {
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, heightForRowAt indexPath: IndexPath) -> CGFloat
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, heightForHeaderInSection section: Int) -> CGFloat
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, heightForFooterInSection section: Int) -> CGFloat
    
//    @available(iOS 7.0, *)
//    func tableView(_ tableView: SKTableViewNode, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
//
//    @available(iOS 7.0, *)
//    func tableView(_ tableView: SKTableViewNode, estimatedHeightForHeaderInSection section: Int) -> CGFloat
//
//    @available(iOS 7.0, *)
//    func tableView(_ tableView: SKTableViewNode, estimatedHeightForFooterInSection section: Int) -> CGFloat
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, viewNodeForHeaderInSection section: Int) -> SKTableViewNodeHeadFoot?
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, viewNodeForFooterInSection section: Int) -> SKTableViewNodeHeadFoot?
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    
    @available(iOS 3.0, *)
    func tableView(_ tableView: SKTableViewNode, willDeselectRowAt indexPath: IndexPath) -> IndexPath?
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, didSelectRowAt indexPath: IndexPath)
    
    @available(iOS 3.0, *)
    func tableView(_ tableView: SKTableViewNode, didDeselectRowAt indexPath: IndexPath)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, indentationLevelForRowAt indexPath: IndexPath) -> Int
    
}

public extension SKTableViewDelegate {
    
}


//  MARK: - SKTableViewDataSource

public protocol SKTableViewDataSource: class {
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, numberOfRowsInSection section: Int) -> Int
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, cellForRowAt indexPath: IndexPath) -> SKTableViewNodeCell
    
    
    @available(iOS 2.0, *)
    func numberOfSections(in tableView: SKTableViewNode) -> Int // Default is 1 if not implemented
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, titleForHeaderInSection section: Int) -> String? // fixed font style. use custom view (UILabel) if you want something different
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, titleForFooterInSection section: Int) -> String?
    
    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, canEditRowAt indexPath: IndexPath) -> Bool
    
    
    // Moving/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, canMoveRowAt indexPath: IndexPath) -> Bool
    
    
    // Index
    
    @available(iOS 2.0, *)
    func sectionIndexTitles(for tableView: SKTableViewNode) -> [String]? // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, sectionForSectionIndexTitle title: String, at index: Int) -> Int // tell table which section corresponds to section title/index (e.g. "B",1))
    
    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    
    
    // Data manipulation - reorder / moving support
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: SKTableViewNode, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    
}

public extension SKTableViewDataSource {
    func tableView(_ tableView: SKTableViewNode, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: SKTableViewNode) -> Int {
        return 1
    }
    
    func tableView(_ tableView: SKTableViewNode, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(_ tableView: SKTableViewNode, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(_ tableView: SKTableViewNode, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: SKTableViewNode, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func sectionIndexTitles(for tableView: SKTableViewNode) -> [String]? {
        return nil
    }
    
    func tableView(_ tableView: SKTableViewNode, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: SKTableViewNode, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: SKTableViewNode, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
}
