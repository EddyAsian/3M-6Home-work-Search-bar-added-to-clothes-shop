

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var data: [MenuModel] = [
        MenuModel(image: UIImage(named: "clothes1")!, name: "Розовая футболка Lada 4x4", price: 1100),
        MenuModel(image: UIImage(named: "clothes2")!, name: "Черная футболка TiB", price: 1240),
        MenuModel(image: UIImage(named: "clothes3")!, name: "Черный топик Bratz", price: 1222),
        MenuModel(image: UIImage(named: "clothes4")!, name: "Черный топ Gender Drive", price: 1056),
        MenuModel(image: UIImage(named: "clothes5")!, name: "Желтая футболка Drift", price: 1333),
        MenuModel(image: UIImage(named: "clothes6")!, name: "Розовая футболка Patrol", price: 1111),
        MenuModel(image: UIImage(named: "clothes7")!, name: "Черная футболка Ola-La", price: 999),
        MenuModel(image: UIImage(named: "clothes8")!, name: "Полупрозрачный топ Love", price: 1666),
        MenuModel(image: UIImage(named: "clothes9")!, name: "Блузка SuperGirl", price: 1756),
        MenuModel(image: UIImage(named: "clothes10")!,name: "Свитер Vintage", price: 2222)
    ]
    


    var cartProducts = [MenuModel]()
    var filteredProducts = [MenuModel]()
    var totalSum = 0
    var floatingButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        filteredProducts = data
        
        setupCollectionView()
        
        searchBar.delegate = self 
        floatingButton.setTitle("Корзина \(totalSum) шт", for: .normal)
        floatingButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        
        floatingButton.layer.cornerRadius = 15
        floatingButton.backgroundColor = .red
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        floatingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        floatingButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        floatingButton.setTitleColor(.yellow, for: .normal)
        floatingButton.setImage(UIImage(systemName: "basket.fill"), for: .normal)
        floatingButton.imageEdgeInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 20)
        floatingButton.setTitleColor(.orange, for: .highlighted)
        floatingButton.showsTouchWhenHighlighted = true
        floatingButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
    }
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        //layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.showsHorizontalScrollIndicator = false
        
        //        imageCollectionView.delegate = self
        //        imageCollectionView.dataSource = self
    }
    
    @objc func goToCart() {
        
        let cartScreen = SecondViewController()

        cartScreen.cartProducts = cartProducts

        present(cartScreen, animated: false)
        
        
    
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu_cell", for: indexPath) as! MenuCell
        
        cell.nameProductLabel.text = filteredProducts[indexPath.row].name
        cell.imageIconView.image = filteredProducts[indexPath.row].image
        cell.priceProductLabel.text = "\(filteredProducts[indexPath.row].price) coм"
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Уточнение:", message: "Введите количество одежды", preferredStyle: .alert)
        
        var textField = UITextField()
        
        alertController.addTextField { text in
            textField = text
        }
        
        let actionOk = UIAlertAction(title: "Ok", style: .cancel) { [self] action in
            //print(self.filteredNames[indexPath.row])
            
            let inputText = textField.text!
            
            if let amount = Int(inputText) {
                var counter = 0
                
                while counter < amount {
                    self.cartProducts.append(self.filteredProducts[indexPath.row])
                    
                    counter += 1
                }
                
                self.totalSum += amount
                
                self.floatingButton.setTitle("Выбрано: \(totalSum) шт", for: .normal)
            }
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .destructive) { action in
            ()
        }
        
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        
        present(alertController, animated: true, completion: nil)

    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredProducts = []
        
        if searchText == "" {
            filteredProducts = data
        }
        
        for product in data {
            if product.name.uppercased().contains(searchText.uppercased()) {
                filteredProducts.append(product)
            }
        }
        
        collectionView.reloadData()
    }
}

        
        
        
        
        
        
        
        
        





