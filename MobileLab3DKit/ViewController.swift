//
//  ViewController.swift
//  MobileLab3DKit
//
//  Created by Nien Lam on 3/8/18.
//  Copyright © 2018 Mobile Lab. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

//
// Menu options.
//
let LightingModels: [(text: String, light: SCNMaterial.LightingModel)] = [
    ("Constant",          .constant),
    ("Lambert",           .lambert),
    ("Blinn",             .blinn),
    ("Phong",             .phong),
    ("Physically Based",  .physicallyBased)]

let LightingSchemes: [(text: String, id: Int)] = [
    ("No Lights",    0),
    ("Spot Light",   1)]

let Animations: [(text: String, file: String)] = [
    ("Idle",  ""),
    ("Samba Dancing",  "SambaDancing.dae"),
    ("Bellydancing",  "Bellydancing.dae"),
    ("Jumping",  "Jumping.dae")]

let CameraControlToggle: [(text: String, isOn: Bool)] = [
    ("Cam Ctrl On", true),
    ("Cam Ctrl Off", false)]


class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a new scene.
        let scene = SCNScene(named: "art.scnassets/main_scene.scn")!

        // Set the scene to the view.
        sceneView.scene = scene
        
        // Allows the user to manipulate the camera with gestures.
        sceneView.allowsCameraControl = true
        
        // Show statistics such as fps and timing information.
        sceneView.showsStatistics = true

        // Shows physics geometry.
        // sceneView.debugOptions = .showPhysicsShapes

        
        
        // add a tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        scnView.addGestureRecognizer(tapGesture)

//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        zombieAnimation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/Zombie.dae")
//        characterNode!.addAnimationPlayer(zombieAnimation, forKey: "animation")
//        zombieAnimation.play()

//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        zombieAnimation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/Zombie.dae")
//        characterNode!.addAnimationPlayer(zombieAnimation, forKey: "animation")
//        zombieAnimation.blendFactor = 0.0
//        zombieAnimation.stop(withBlendOutDuration: 0.2)
//        zombieAnimation.play()

//        loadAnimation(withKey: "zombie", sceneName: "art.scnassets/Zombie", animationIdentifier: "Zombie-1")
//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        characterNode!.addAnimation(animations["zombie"]!, forKey: "zombie")
//

        /*
        let menuOverlay = MenuOverlay(size: self.view.bounds.size)
        scnView.overlaySKScene = menuOverlay
        
        menuOverlay.handleLightingModelBtn = { (lightingModel) in
//            let ship = scene.rootNode.childNode(withName: "shipMesh", recursively: true)!
//            ship.geometry!.firstMaterial!.lightingModel = lightingModel
        }

        menuOverlay.handleCameramControlBtn = { (isOn) in
            scnView.allowsCameraControl = isOn
        }
        */
 
        let characterNode = sceneView.scene?.rootNode.childNode(withName: "hero_ref", recursively: true)!
        let animation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/spin.dae")

        animation.animation.blendInDuration = 0.25
        animation.animation.blendOutDuration = 0.5

        characterNode!.addAnimationPlayer(animation, forKey: "spin")
        animation.play()


    }
    
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView


//        loadAnimation(withKey: "dribble", sceneName: "art.scnassets/Dribble", animationIdentifier: "Dribble-1")
//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        characterNode!.addAnimation(animations["dribble"]!, forKey: "dribble")
        
        
//        zombieAnimation.blendFactor = 0.5
//        zombieAnimation.stop(withBlendOutDuration: 1.0)
        
//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        self.dribbleAnimation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/Dribble.dae")
//        
//        self.dribbleAnimation.animation.blendInDuration = 0.25
//        self.dribbleAnimation.animation.blendOutDuration = 0.5
//
//        characterNode!.addAnimationPlayer(self.dribbleAnimation, forKey: "dribble")
//        self.dribbleAnimation.animation.repeatCount = 2
//        self.dribbleAnimation.play()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }


    @IBAction func handleButton(_ sender: UIButton) {
        print("hello")
    
    }
    


}



