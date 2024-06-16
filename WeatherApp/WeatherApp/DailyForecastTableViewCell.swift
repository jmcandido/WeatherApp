//
//  UTableViewCell.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 15/06/24.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "DailyForecast"
    
    private lazy var weekDayLabel : UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste ,texto: "TER")
        return label
    }()
    
    private lazy var climateLabel : UIImageView = {
        let imageView = createImageView(escala: .scaleAspectFit, icone: UIImage.inconNuvem)
        return imageView
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste ,texto: "min 25ºC")
        return label
    }()
    
    private lazy var maxTemperature: UILabel = {
        let label = createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste ,texto: "max 25ºC")
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){}
    
    private func setHierachy(){}
    
    private func setConstraints (){}
    
    

}
