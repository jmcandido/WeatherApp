//
//  Color+Extensions.swift
//  WeatherApp
//
//  Created by João Marcelo Candido on 13/06/24.
//

import Foundation
import UIKit

extension UIColor {
    
    static let corPrimaria =  UIColor(named: "AppPrimaryColor")
    static let corContraste = UIColor(named: "constrastColor")
    static let cinzaSuave = UIColor(named: "softGray")
}


extension UIImage{
    static let iconeSol = UIImage(named: "sunIcon")
    static let iconeNuvem = UIImage(named: "cloudIcon")
    
}

extension UIView {
    func setConstraintsToParent(_ parent: UIView){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor)
            ])
    }
    
    func createStackView (arrangedSubviews:[UIView], eixo: NSLayoutConstraint.Axis) -> UIStackView{
        let stackview = UIStackView(arrangedSubviews: arrangedSubviews)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = eixo
        stackview.isLayoutMarginsRelativeArrangement = true
        
        return stackview
    }
    
    func createImageView(escala: UIView.ContentMode, icone: UIImage?) -> UIImageView{
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = icone
        imageView.contentMode = escala
        return imageView
    }
    
}

extension UILabel{
    static func createLabel(tamanhoFonte: CGFloat, weight: UIFont.Weight = .regular, cor: UIColor?, texto: String, alinhamento: NSTextAlignment? = nil) -> UILabel{
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: tamanhoFonte, weight: weight)
        label.text = texto
        label.textColor = cor
        label.textAlignment = alinhamento ?? .left
        
        return label
    }
}


