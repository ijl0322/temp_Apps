//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import AVFoundation
import CoreAudioKit

class PlaygroundViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        self.view.backgroundColor = .lightGray
    }
}


let viewController = PlaygroundViewController()
//var owlAudio = AVAudioPlayer()


//PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController.view
