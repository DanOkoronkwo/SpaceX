//
//  SpaceXViewController.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import UIKit

class SpaceXViewController: UIViewController {
    
    lazy var overlayView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleHeight, .flexibleHeight]
        
        let spinner = UIActivityIndicatorView()
        spinner.center = view.center
        spinner.style = .large
        spinner.autoresizingMask = ([.flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin])
        spinner.color = UIColor.lightGray
        view.addSubview(spinner)
        spinner.startAnimating()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(overlayView)
    
    }

    func hideOverlay() {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.overlayView.alpha = 0
            self?.overlayView.isHidden = true
        }, completion: nil)
    
    }

}
