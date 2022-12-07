//
//  SecondViewController.swift
//  3.5.HomeWork2
//

//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    var cartTableView = UITableView()
    var totalLabel = UILabel()
    
    var cartProducts = [MenuModel]()
    
    var cartProducts2 = [MenuModel]()
    
    var getButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        cartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "menu_cell")
        view.addSubview(cartTableView)
        
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        cartTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -0).isActive = true
        cartTableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        cartTableView.heightAnchor.constraint(equalToConstant: view.frame.height - 0).isActive = true
        cartTableView.backgroundColor = .cyan
        
        //        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        
        view.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        totalLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
        totalLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        totalLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        totalLabel.font = .systemFont(ofSize: 23)
        
        var totalSum = 0
        
        for cartProduct in cartProducts {
            totalSum += cartProduct.price
        }
        totalLabel.text = "Заказ принят!😊 Доставка: 15 дней"
        
        
        
        
        view.addSubview(getButton)
        getButton.translatesAutoresizingMaskIntoConstraints = false
        getButton.isUserInteractionEnabled = true
        
        
        //        getButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        getButton.layer.cornerRadius = 15
        getButton.backgroundColor = .yellow
        
        
        getButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        getButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        getButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        getButton.setTitleColor(.red, for: .normal)
        getButton.setTitleColor(.orange, for: .highlighted)
        getButton.showsTouchWhenHighlighted = true
        
        
        getButton.setTitle("Спасибо за покупку!", for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 25)
        getButton.setImage(UIImage(systemName: "figure.mind.and.body"), for: .normal)
        getButton.imageEdgeInsets = UIEdgeInsets(top: -4, left: 0, bottom: 0, right: 20)
        getButton.addTarget(ThirdViewController(), action: #selector(goToShop), for: .touchUpInside)
       
    }
    
    @objc func goToShop() {
   
        let cartScreen = SecondViewController()

        cartScreen.cartProducts = cartProducts

        present(cartScreen, animated: false)
        
        }

        
        
    }
    



extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "menu_cell")
        
        cell.imageView?.image = cartProducts[indexPath.row].image
        
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.imageView?.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 0).isActive = true
        cell.imageView?.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        cell.imageView?.widthAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        cell.imageView?.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        
        cell.textLabel?.text = "\(cartProducts[indexPath.row].name) \(cartProducts[indexPath.row].price)"
        
        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.leftAnchor.constraint(equalTo: cell.imageView!.rightAnchor, constant: 0).isActive = true
        cell.textLabel?.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
        cell.textLabel?.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        cell.textLabel?.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        
        return cell
    }
}

extension ThirdViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}




