//
//  ViewController.swift
//  ARDicee
//
//  Created by henry on 12/01/2019.
//  Copyright © 2019 HenryNguyen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // All the methods are from SceneKit Framework
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_earth_nightmap.jpg")
        // add the material property --> an array of materials
        sphere.materials = [material]
        //create an object
        let node = SCNNode()
        
        node.position = SCNVector3(0, 0.1, -0.5)
        
        node.geometry = sphere
        // rootNode can have many chilrenNode
        sceneView.scene.rootNode.addChildNode(node)
        //add some light
        sceneView.automaticallyUpdatesLighting = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
  
}
