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
        let label = createLabel(tamanhoFonte: 10, weight: .semibold, cor: UIColor.corContraste, texto: "13:00")
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = createLabel(tamanhoFonte: 14, cor: UIColor.corContraste, texto: "25ºC")
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = createImageView(escala: .scaleAspectFit, icone: UIImage.iconeSol)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
    }
    
    private func steHierarchy (){
        
    }
    
    private func setConstraints(){
        
    }
    
}
