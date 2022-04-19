## Criando uma requisição

1 - Primeiramente não esqueça de realizar a importação da dependência

```swift
import PagPay
```

2 - Criar objeto com a informações do pagamento do tipo `PagPayRequest`.

```swift
private func createPaymentRequest() -> PagPayRequest {
   let amount = AmountModel(value: 2000, currency: "BRL")
            
   let items = [
      ItemModel(reference: nil,
               name: "mochila",
               quantity: 1,
               unitAmount: 3500
      )
   ]
   
   return PagPayRequest(referenceId: "REF-ID",
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

3 - Cria um método com as informações do comerciante do tipo `MerchantInfoRequest`
Obs: O `clientId` é recuperado na etapa de `Credenciais de Autenticação`

```swift
private func createMerchantInfoRequest() -> MerchantInfoRequest {
   return MerchantInfoRequest(
            clientId: "d7f06e36-87ed-47c8-85de-4928bec3c4f3", 
            appName: "App SDK Demo iOS"
         )
}
```

3 - No evento de clique do botão, deve ser instânciada a classe `PagPay` e logo após chamar o método `redirectPagBank`.

```swift
   let pagPay = PagPay()
   pagPay.redirectPagBank(
         merchantInfo: createMerchantInfoRequest(), 
         request: createPaymentRequest(), 
         delegate: self, 
         env: .PROD)
```

4 - Por fim deve-se implementar o delegate `PagPayRedirectProtocol` no seu ViewController para receber as notificações de sucesso ou erro da chamada de criação do pedido.

```swift
extension ViewController: PagPayRedirectProtocol {
    func onSuccessToRedirect(deepLinkCode: String) {
        
    }
    
    func onErrorToRedirect(error: ApiError) {
        
    }
}
```