//
//  ViewController.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 29/05/24.
//

import UIKit


class ViewController: UIViewController{
    
   
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
        let label = UILabel.createLabel(tamanhoFonte: 20, weight:.bold,cor: UIColor.corPrimaria, texto: city.name, alinhamento: .center)
        
            return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 60, weight: .bold, cor: UIColor.corPrimaria, alinhamento: .left)
            return label

    }()
    
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste, texto: "moisture")
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste)
        return label
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold,  cor: UIColor.corContraste, texto: "wind")
        return label
    }()
    
    private lazy var windValueLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold,cor: UIColor.corContraste)
        return label
    }()
    
    
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = self.view.createStackView(arrangedSubviews: [humidityLabel, humidityValueLabel], eixo: .horizontal)
        return stackView
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = self.view.createStackView(arrangedSubviews: [windLabel, windValueLabel], eixo: .horizontal)
        return stackView
    }()
    
    
    private lazy var statsStackView: UIStackView = {
        let stackView = self.view.createStackView(arrangedSubviews: [humidityStackView, windStackView], eixo: .vertical)
        
        
        stackView.spacing = 3
        stackView.backgroundColor = UIColor.cinzaSuave
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12,
                                                                     leading: 24,
                                                                     bottom: 12,
                                                                     trailing: 24)
        return stackView
    }()
    
    
    private lazy var weatherIcon:UIImageView = {
        let imageView = self.view.createImageView(escala: .scaleAspectFit, icone: UIImage(named: forecastResponse?.current.weather.first?.icon ?? "")
                                                  )
        
        return imageView
        
        
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        
        let label = UILabel.createLabel(tamanhoFonte: 12,weight: .semibold, cor: UIColor.corContraste, texto: "HOURLY FORECAST", alinhamento: .center)
        return label
    }()
    
    private lazy var dailyForecastLabel: UILabel = {
        let label = UILabel.createLabel(tamanhoFonte: 12, weight: .semibold, cor: UIColor.corContraste, texto: "NEXT DAYS",alinhamento: .center)
        return label
    }()
    
    private lazy var dailyForecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        
        return tableView
    }()
    
    private lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.indentifier)
        
        return collectionView
    }()
    
    
    private let service = Service()
    private var city = City(lat: "-6.78667", lon: "-39.29583", name: "Várzea Alegre")
    private var forecastResponse: ForecastResponse?
    
    
    override func viewDidLoad() { // executado sempre que a viewC é carregada
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    

    private func fetchData() {
        service.fecthData(city: city){ [weak self] response in
            self?.forecastResponse = response
            DispatchQueue.main.async{
                self?.loadData()
            }
            
        }
    }

    private func loadData() {
        cityLabel.text = city.name
        temperatureLabel.text = "\(Int(round(forecastResponse?.current.temp ?? 0)))ºC"
        humidityValueLabel.text = "\(forecastResponse?.current.humidity ?? 0)mm"
        windValueLabel.text = "\(forecastResponse?.current.windSpeed ?? 0)km/h"

        hourlyCollectionView.reloadData()
        dailyForecastTableView.reloadData()
        
        if forecastResponse?.current.dt.isDayTime() ?? true {
            
            backgroundView.image = UIImage(named: "backgroundDay")
        }else{
            backgroundView.image = UIImage(named: "backgroundNight")
        }
        
        weatherIcon.image = UIImage(named: forecastResponse?.current.weather.first?.icon ?? "")
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()

    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackView)
        view.addSubview(hourlyForecastLabel)
        view.addSubview(hourlyCollectionView)
        view.addSubview(dailyForecastLabel)
        view.addSubview(dailyForecastTableView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
        
    }
    
    private func setConstraints() {
            NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
                headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
                headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
                headerView.heightAnchor.constraint(equalToConstant: 150),
                
                cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
                cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
                cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
                cityLabel.heightAnchor.constraint(equalToConstant: 20),
                
                temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
                temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
                temperatureLabel.heightAnchor.constraint(equalToConstant: 71),
                
                weatherIcon.heightAnchor.constraint(equalToConstant: 86),
                weatherIcon.widthAnchor.constraint(equalToConstant: 86),
                weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
                weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
                weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15),
                
                statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
                statsStackView.widthAnchor.constraint(equalToConstant: 206),
                statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
                hourlyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
                hourlyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
                
                hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22),
                
                hourlyCollectionView.heightAnchor.constraint(equalToConstant:84),
                hourlyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hourlyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 29),
                dailyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
                dailyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -35),
                
                dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor, constant: 16),
                dailyForecastTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                dailyForecastTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                dailyForecastTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                
                
                
            ])
        }

}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        forecastResponse?.hourly.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.indentifier,
                                                            for: indexPath) as? HourlyForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let forecast = forecastResponse?.hourly[indexPath.row]
        cell.loadData(time: forecast?.dt.toHourFormat(),
                      icon: UIImage(named: forecast?.weather.first?.icon ?? ""),
                      temp: forecast?.temp.toCelsius())
        return cell
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecastResponse?.daily.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:DailyForecastTableViewCell.identifier, for: indexPath) as? DailyForecastTableViewCell else{
            
             return UITableViewCell()
        }
        
        let forecast = forecastResponse?.daily[indexPath.row]
        cell.loadData(weekDay: forecast?.dt.toWeekdayName().uppercased(), min: forecast?.temp.min.toCelsius(), max:forecast?.temp.max.toCelsius(), icon: UIImage(named: forecast?.weather.first?.icon ?? ""))
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
