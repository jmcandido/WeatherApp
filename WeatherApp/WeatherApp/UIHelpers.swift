
import UIKit

func createLabel(tamanhoFonte: CGFloat, weight: UIFont.Weight = .regular, cor: UIColor?, texto: String, alinhamento: NSTextAlignment? = nil) -> UILabel{
    
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: tamanhoFonte, weight: weight)
    label.text = texto
    label.textColor = cor
    label.textAlignment = alinhamento ?? .left
    
    return label
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
 


