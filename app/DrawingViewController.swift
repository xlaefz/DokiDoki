//
//  DrawingViewController.swift
//
//  Created by Jason Zheng on 2017-03-25.
//

import UIKit
import RxSwift
import SVProgressHUD

class DrawingViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var canvasView: CanvasView?
    let transition = CircularTransition()
    
    var recorder: Recorder {
        return Recorder.shared
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
    }
    @IBAction func publishButtonDidTap(_ sender: Any) {
        let _ = recorder.serializedDicts()
        
        SVProgressHUD.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            SVProgressHUD.showSuccess(withStatus: "Arrived :)")
            self?.recorder.clear()
            self?.canvasView?.clear()
        }
    }

  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }

}
