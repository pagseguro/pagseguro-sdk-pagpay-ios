//
//  ViewController.swift
//  AppExample
//
//  Created by Andre Luis dos Santos Oliveira on 03/05/22.
//

import UIKit
import PagPay

class ViewController: UIViewController {
    let pagPayButtonViewCode = PagPayPaymentButton(frame: .zero, theme: .green)
    
    @IBOutlet weak var pagPayButtonOutlet: PagPayPaymentButton!
    
    let pagPayService = PSPagPay()
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagPayButtonOutlet()
        setupPagPayButtonViewCode()
    }
    
    func setupPagPayButtonViewCode() {
        view.addSubview(pagPayButtonViewCode)
        pagPayButtonViewCode.translatesAutoresizingMaskIntoConstraints = false
        pagPayButtonViewCode.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0).isActive = true
        pagPayButtonViewCode.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        pagPayButtonViewCode.heightAnchor.constraint(equalToConstant: 58.0).isActive = true
        pagPayButtonViewCode.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150.0).isActive = true
        pagPayButtonViewCode.addTarget(self, action: #selector(buttonViewCodeTapped), for: .touchUpInside)
    }
    
    func setupPagPayButtonOutlet() {
        pagPayButtonOutlet.setupGrayTheme()
    }
    
    private func createMerchantInfoRequest() -> MerchantInfoRequest {
       return MerchantInfoRequest(
                clientId: "SEU_CLIENT_ID_AQUI",
                appName: "App example iOS GitHub"
             )
    }
    
    private func createPaymentRequest() -> PagPayRequest {
       let amount = AmountModel(value: 100, currency: "BRL")
                
       let items = [
          ItemModel(reference: nil,
                   name: "Fone de Ouvido Bluetooth",
                   quantity: 1,
                   unitAmount: 100
          )
       ]

       let shipping = ShippingModel(
                         address: AddressModel(
                            street: "Av. Brigadeiro Faria Lima",
                            number: "1.384",
                            complement: "ap 1",
                            district: "SP",
                            city: "São Paulo",
                            state: "SP",
                            country: "BRA",
                            postalCode: "01452002"
                         )
                      )
       
       return PagPayRequest(referenceId: "REF-ID-85415444",
                            amount: amount,
                            items: items,
                            shipping: shipping,
                            notificationUrls: ["https://webhook.site/c2a91025-7461-4cdb-862d-5d7c2ece1a08"],
                            redirectUrl: "https://meu-e-commerce.com.br")
    }
    
    @objc private func buttonViewCodeTapped() {
        redirect()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        redirect()
    }
    
    private func redirect() {
        loading.startAnimating()
        pagPayService.redirectPagBank(
            merchantInfo: createMerchantInfoRequest(),
            request: createPaymentRequest(),
            delegate: self,
            env: .SANDBOX)
    }
}

extension ViewController: PagPayRedirectProtocol {
    func onSuccessToRedirect(deepLinkCode: String) {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            print(deepLinkCode)
        }
    }
    
    func onErrorToRedirect(error: ApiError) {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            let alert = UIAlertController(
                title: "Serviço indisponível",
                message: error.message,
                preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
