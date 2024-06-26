//
//  UTableViewCell.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 15/06/24.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static let identifier: String = "DailyForecast"
    
    private lazy var weekDayLabel : UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste)
        return label
    }()
    
    private lazy var climateLabel : UIImageView = {
        let imageView = createImageView(escala: .scaleAspectFit, icone: UIImage.iconeNuvem)
        return imageView
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste)
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = createStackView(arrangedSubviews: [weekDayLabel,climateLabel,  minTemperatureLabel, maxTemperatureLabel], eixo: .horizontal)
        
        stackView.spacing = 15
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        return stackView
    }()
    
    
    private func setupView(){
        backgroundColor = .clear
        selectionStyle = .none
        setHierachy()
        setConstraints()
    }
    
    private func setHierachy(){
        contentView.addSubview(stackView)
        
    }
    
    func loadData(weekDay:String?, min:String?, max:String?, icon: UIImage?){
        weekDayLabel.text = weekDay
        minTemperatureLabel.text = "min \(min ?? "")"
        maxTemperatureLabel.text = "max \(max ?? "")"
        climateLabel.image = icon
    }
    
    private func setConstraints (){
        stackView.setConstraintsToParent(contentView)
        NSLayoutConstraint.activate([
            weekDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
            climateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    

}
