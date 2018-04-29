//
//  WelcomePageViewController.swift
//  DellMedHLA
//
//  Created by Jonathan Wong  on 4/28/18.
//  Copyright © 2018 Jonathan Wong . All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class WelcomePageViewController: UIViewController {
    
    let startBT: UIButton = {
        let buttonView = UIButton()
        buttonView.setTitle("Start", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        buttonView.setTitleColor(UIColor.darkGray, for: .highlighted)
        buttonView.backgroundColor = UIColor.init(red: 178/255, green: 95/255, blue: 54/255, alpha: 1.0)
        buttonView.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        buttonView.addTarget(self, action: #selector(WelcomePageViewController.start), for: .touchUpInside)
        buttonView.alpha = 0.0
        return buttonView
    }()
    
    let foregroundImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named:"LaunchScreenForeground")
        imgView.alpha = 0.0
        return imgView
    }()
    
    let backgroundImage: UIImageView = {
       let imgView = UIImageView()
       imgView.image = UIImage(named:"LaunchScreenBackground")
       return imgView
    }()

    let backgroundTint: UIView = {
        let tintView = UIView()
        tintView.backgroundColor = UIColor.darkGray
        tintView.layer.opacity = 0.75
        return tintView
    }()
    
    let namesLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.text = "Jonathan Wong and Zaineb Marediya"
        label.alpha = 0.0
        return label
    }()

    //MARK: Setting Up View
    
     override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(backgroundTint)
        view.addSubview(foregroundImage)
        view.addSubview(startBT)
        view.addSubview(namesLabel)
        setupConstraints()
    }
    
    //MARK: Animating View
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 1.0, animations: {
            self.foregroundImage.alpha = 1.0
            self.startBT.alpha = 1.0
            self.namesLabel.alpha = 1.0
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startBT.layer.cornerRadius = startBT.frame.height/4
    }
   
    func setupConstraints() {
        backgroundImage.autoPinEdgesToSuperviewEdges()
        backgroundTint.autoPinEdgesToSuperviewEdges()
        foregroundImage.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        foregroundImage.autoAlignAxis(toSuperviewAxis: .vertical)
        foregroundImage.autoSetDimensions(to: CGSize(width: Constants.Screen.height/1.25*1.32, height: Constants.Screen.height/1.25))
        startBT.autoAlignAxis(.vertical, toSameAxisOf: foregroundImage)
        startBT.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30)
        startBT.autoSetDimensions(to: CGSize(width: 100, height: 60))
        namesLabel.autoAlignAxis(.vertical, toSameAxisOf: foregroundImage)
        namesLabel.autoPinEdge(.top, to: .bottom, of: foregroundImage, withOffset: -10)
    }
    
    @objc func start() {
        let vc = MainFormViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
