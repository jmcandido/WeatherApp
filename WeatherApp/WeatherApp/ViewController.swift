//
//  ViewController.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 29/05/24.
//

import UIKit

let corPrimaria = "AppPrimaryColor"
let corContraste = "constrastColor"
let cinzaSuave = "softGray"



func createLabel(tamanhoFonte: CGFloat, weight: UIFont.Weight = .regular, cor: String, texto: String, alinhamento: NSTextAlignment? = nil) -> UILabel{
    
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: tamanhoFonte, weight: weight)
    label.text = texto
    label.textColor = UIColor(named: cor) ?? .black
    label.textAlignment = alinhamento ?? .left
    
    return label
}

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
        let label = createLabel(tamanhoFonte: 70, weight: .bold, cor: corPrimaria, texto: "25ºC",           alinhamento: .left)
            return label

    }()
    
    
    private lazy var humidityLabel: UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold, cor: corContraste, texto: "umidade")
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold, cor: corContraste, texto: "1000mm")
        return label
    }()
    
    private lazy var windLabel: UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold,  cor: corContraste, texto: "vento")
        return label
    }()
    
    private lazy var windValueLabel: UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold,cor: corContraste, texto: "10km/h")
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
        
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        stackView.backgroundColor = UIColor(named: cinzaSuave)
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12,
                                                                     leading: 24,
                                                                     bottom: 12,
                                                                     trailing: 24)
        return stackView
    }()
    
    
    private lazy var weatherIcon:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
        
    }()
    
    override func viewDidLoad() { // executado sempre que a viewC é carregada
        super.viewDidLoad()
        setupView()
      
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()

    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackView)
        
        
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
        
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }

}

