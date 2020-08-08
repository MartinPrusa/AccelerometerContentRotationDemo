//
//  ViewController.swift
//  VideoRotation
//
//  Created by Martin Prusa on 06.08.2020.
//

import UIKit
import AVKit
import CoreMotion

final class ViewController: UIViewController {
    private let motionManager = CMMotionManager()
    private var timer: Timer!
    private var playerLayer: AVPlayerLayer!
    private var looper: AVPlayerLooper!
    private var player: AVQueuePlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = Bundle.main.url(forResource: "rodney-thps3", withExtension: "mp4") else { return }

        motionManager.startAccelerometerUpdates()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(update), userInfo: nil, repeats: true)

        let playerItem = AVPlayerItem(url: url)
        player = AVQueuePlayer(items: [playerItem])
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds

        view.layer.addSublayer(playerLayer)
        player.play()
    }

    @objc func update() {
        if let accelerometerData = motionManager.accelerometerData {
            let rotation = CATransform3DMakeRotation(-accelerometerData.acceleration.x.cgFloatRounded / 6.38, 0, 0, 1.0)
            let scale = CATransform3DScale(rotation, 2.5, 4, 1.0)
            self.playerLayer.transform = scale
        }
    }
}
