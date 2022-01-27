## Criando uma requisição

1 - Criar objeto com a informações do pagamento do tipo PagPayRequest.

```xml
private func createPayload() -> PagPayRequest {
        let amount = AmountModel(value: 2000, currency: "BRL")
                
        let items = [ItemModel(reference: nil,
                            name: "mochila",
                            quantity: 1,
                            unitAmount: 3500)
        ]
         
        return PagPayRequest(referenceId: "Michael Jon Carter",
                             amount: amount,
                             items: items,
                             shipping: ShippingModel(
                                address: AddressModel(
                                    street: "rua street",
                                    number: "123",
                                    complement: "ap 1",
                                    district: "SP",
                                    city: "Guarulhos",
                                    state: "SP",
                                    country: "BRA",
                                    postalCode: "12345678"
                                )
                             ),
                             notificationUrls: ["https://meusite.com/pedidos/pagamentos"],
                             customer: nil)
    }
```

2 - Cria um método com as informações do Comerciante do tipo MerchantInfoRequest
Obs: O 'clientId' é recuperado na etapa de Credenciais de Autenticação

```xml
private func createMerchantPayload() -> MerchantInfoRequest {
   return MerchantInfoRequest(clientId: "d7f06e36-87ed-47c8-85de-4928bec3c4f3", appName: "App SDK Demo iOS")
}
```

3 - No evento do clique do botão, chamar o método payWithPagPayClient.

```xml
@objc private func payWithPagPayClient() {
   pagPay.redirectPagBank(merchantInfo: createMerchantPayload(), request: createPayload(), delegate: self, env: .PROD)
}
```

4 - É possível implementar a classe CheckoutPagBankProtocol para receber os retornos de sucesso ou erro para a chamada realizada

```xml
protocol PagBankRedirectHandlerProtocol{
    func onSuccessRedirect()
    func onError(error: PagBankError)
}
```