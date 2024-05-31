//
//  ViewController.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 29/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    private  lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override func viewDidLoad() { // executado sempre que a viewC é carregada
        super.viewDidLoad()
        setupView()
      
    }

    override func viewDidAppear(_ animated: Bool) { // excutado sempre a viewC aparece
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor.blue
        setHierarchy()
        setConstraints()

    }
    
    private func setHierarchy(){
        view.addSubview(customView)
    }
    
    private func setConstraints (){
        
    }

}

