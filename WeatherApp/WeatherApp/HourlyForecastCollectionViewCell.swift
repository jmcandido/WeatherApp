//
//  HourlyForecastCollectionViewCell.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 12/06/24.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = "HourlyForecast"
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 10, weight: .semibold, cor: UIColor.corContraste, alinhamento: .center)
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 14, cor: UIColor.corContraste, alinhamento: .center)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = createImageView(escala: .scaleAspectFit, icone: UIImage.iconeSol)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = createStackView(arrangedSubviews: [hourLabel, iconImageView, temperatureLabel], eixo: .vertical)
        
        stackview.spacing = 4
        stackview.layer.borderWidth = 1
        stackview.layer.borderColor = UIColor.corContraste?.cgColor
        stackview.layer.cornerRadius = 20
        
        stackview.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                     leading: 8,
                                                                     bottom: 8,
                                                                    trailing: 8)
        
        return stackview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
        
    }
    
    private func setHierarchy (){
        contentView.addSubview(stackView)
    }
    
    func loadData(time: String?, icon: UIImage?, temp: String?){
        hourLabel.text = time
        iconImageView.image = icon
        temperatureLabel.text = temp
    }
    
    private func setConstraints(){
        
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
    
}
