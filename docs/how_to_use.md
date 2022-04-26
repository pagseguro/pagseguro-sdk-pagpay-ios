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

   let shipping = ShippingModel(
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
                  )
   
   return PagPayRequest(referenceId: "REF-ID",
                        amount: amount,
                        items: items,
                        shipping: shipping,
                        notificationUrls: ["https://meusite.com/pedidos/pagamentos"])
}
```

3 - Cria um método com as informações do comerciante do tipo `MerchantInfoRequest`

Obs: O `clientId` é recuperado na etapa de [`Credenciais de Autenticação`](./../README.md#credenciais-de-autenticação)

```swift
private func createMerchantInfoRequest() -> MerchantInfoRequest {
   return MerchantInfoRequest(
            clientId: "SEU_CLIENT_ID_AQUI", 
            appName: "App SDK Demo iOS"
         )
}
```

4 - No evento de clique do botão, deve ser instânciada a classe `PagPay` e logo após chamar o método `redirectPagBank`.

```swift
   let pagPay = PagPay()
   pagPay.redirectPagBank(
         merchantInfo: createMerchantInfoRequest(),
         request: createPaymentRequest(),
         delegate: self,
         env: .PROD)
```

5 - Por fim deve-se implementar o delegate `PagPayRedirectProtocol` no seu ViewController para receber as notificações de sucesso ou erro da chamada de criação do pedido.

```swift
extension ViewController: PagPayRedirectProtocol {
    func onSuccessToRedirect(deepLinkCode: String) {
        
    }
    
    func onErrorToRedirect(error: ApiError) {
        
    }
}
```
<br>
<br>

## Tabela com informações de cada campo do payload

|      Campo          |              Tipo               | Obrigatório |                                               Descrição                                               |
|---------------------|---------------------------------|-------------|-------------------------------------------------------------------------------------------------------|
|   referenceId       |    String (1-200 caracteres)    |     Sim     |                             Identificador próprio atribuído para o pedido                             |
|   items             |    Array of Object              |     Sim     |                      Objeto contendo as informações dos itens inseridos no pedido                     |
|   └──reference      |    String (1-255 caracteres)    |     Não     |                             Identificador próprio atribuído para o item                               |
|   └──name           |    String (1-100  caracteres)   |     Sim     |                                             Nome do item                                              |
|   └──quantity       |    Int (min = 1, max = 999)     |     Sim     |                                          Quantidade do item                                           |
|   └──unitAmount     | Int (min = 1, max = 999999900 ) |     Sim     |                                             Valor do item                                             |
|   shipping          |             Object              |     Não     |                         Objeto contendo as informações de entrega do pedido                           |
|    └──address       |             Object              |     Sim     |                    Objeto contendo as informações de endereço de entrega do pedido                    |
|    └──└──street     |    String (1-160 caracteres)    |     Sim     |                                 Rua do endereço de entrega do pedido                                  |
|    └──└──number     |    String (1-20 caracteres)     |     Sim     |                                Número do endereço de entrega do pedido                                |
|    └──└──complement |    String (1-40 caracteres)     |     Não     |                             Complemento do endereço de entrega do pedido                              |
|    └──└──district   |    String (1-60 caracteres)     |     Sim     |                                Bairro do endereço de entrega do pedido                                |
|    └──└──city       |    String (1-90 caracteres)     |     Sim     |                                Cidade do endereço de entrega do pedido                                |
|    └──└──state      |             String              |     Sim     |                 Código do Estado do endereço de entrega do pedido. Padrão ISO 3166-2                  |
|    └──└──country    |             String              |     Sim     |               Código do País do endereço de entrega do pedido. Padrão ISO 3166-1 alfa-3               |
|    └──└──postalCode |      String (8 caracteres)      |     Sim     |                                 CEP do endereço de entrega do pedido                                  |
|    amount           |             Object              |     Sim     |             Objeto contendo as informações do valor a ser utilizado na criação do pedido              |
|     └──value        | Int (min = 1, max = 999999900)  |     Sim     |                                            Valor do pedido                                            |
|     └──currency     |             String              |     Sim     |                      Sigla da moeda que representa o valor do pedido. Fixo "BRL"                      |
|    notificationUrls |         Array of String         |     Sim     | Objeto contendo as urls que receberão as notificações do pedido (por ora, somente aceitamos uma url.) |