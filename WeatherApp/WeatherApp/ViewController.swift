//
//  ViewController.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 29/05/24.
//

import UIKit

let corPrimaria = "PrimaryColor"

class ViewController: UIViewController {
    
    private  lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private lazy var headerView: UIView = {
    
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
        
    }()
    
    
    private lazy var cityLabel: UILabel = {
        let label = createLabel(
                       tamanhoFonte: 20,
                       cor: corPrimaria,
                       texto: "Várzea Alegre",
                       alinhamento: .center)
        
            return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = createLabel(
                       tamanhoFonte: 70,
                       cor: corPrimaria,
                       texto: "25ºC",
                       alinhamento: .left)
            return label

    }()
    
    private lazy var weatherIcon:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
        
    }()
    
    func createLabel(tamanhoFonte: CGFloat, cor: String, texto: String, alinhamento: NSTextAlignment) -> UILabel{
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: tamanhoFonte)
        label.text = texto
        label.textColor = UIColor(named: cor)
        label.textAlignment = alinhamento
        
        return label
    }
    
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
        setHierarchy()
        setConstraints()

    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
    }
    
    private func setConstraints (){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26)
        
        ])
        
        NSLayoutConstraint.activate([
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15)
        ])
    }

}

