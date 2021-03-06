# Pagar com PagBank iOS SDK

## Introdução
O Pagar com PagBank é o produto do PagSeguro que permite aos vendedores utilizar o app PagBank como método de pagamento no checkout do seu próprio aplicativo. Este produto confere mais segurança aos vendedores devido aos padrões de validação de conta e cartões de crédito, adotados pelo PagBank. 

![botoesPagPay](docs/images/example_light_button.png)

## SDK

A SDK disponibiliza um botão de pagamentos que facilita a integração do Merchant, através de suas credenciais pode enviar os dados do seu pedido e nossa SDK irá realizar a integração com nossos serviços. 

---

## Como funciona

### Conceitos

Segue alguns termos usados nessa documentação:

**Integrador**: O desenvolvedor que vai usar o SDK em seu projeto para que possa oferecer para seus clientes o pagamento usando o PagBank

**Pagador**: O usuário que quer comprar algo usando o app do Integrador

O integrador que tem interesse em oferecer pagamento via PagBank adiciona o SDK no seu projeto e com isso disponibiliza um botão no seu app que redireciona o pagamento para o app do PagBank via um deeplink. Dentro do app do PagBank o usuário seleciona a forma de pagamento e prossegue com o pagamento normalmente. Essa etapa dentro do app PagBank é invísivel para o integrador.

### Credenciais de Autenticação
As soluções públicas do PagSeguro requerem autenticação e através dela identificamos e autorizamos o integrador a utilizar nossas APIs e seus recursos, bem como eventuais configurações adicionais.

**Primeiro passo**: Ter uma conta PagSeguro

- Para criar uma conta no nosso ambiente de Sandbox [acesse o link](https://acesso.pagseguro.uol.com.br/sandbox)

**Segundo passo**: Criar uma aplicação para utilizar o pagar com PagBank.
- Mais informações sobre criação de aplicação [acesse o link](https://dev.pagseguro.uol.com.br/reference/connect-create-client)

___

## Requisitos

- Xcode 13+
- iOS 11.0+

___

## Instalação 

## CocoaPods

- Para realizar a instalação via [CocoaPods](https://cocoapods.org/)   

    Adicione as seguintes linhas no seu `Podfile`

    ```console
    use_frameworks!
    pod 'PagPay', '~> 1.0.0'
    ```

## Manual (.framework)
- Para integrar a biblioteca (SDK) em seu projeto, siga os passos abaixo.
1. Faça o download da versão mais recente da biblioteca.
2. Abra o projeto do seu aplicativo pelo Xcode.
3. Arraste o arquivo `PagPay.framework` para dentro do seu projeto. Selecione `Copy itens if need`, `Created group`, `Add to target`.

![imagem3](https://user-images.githubusercontent.com/68859160/114779283-4a074d80-9d4c-11eb-9ac8-6b0d28185a52.png)

4. Selecione seu projeto no Project Navigator e em seguida, selecione seu targets no menu targets. Depois vá em `frameworks, Libaries, and Embedded Content` e garanta que seu framework esteja `Embed & Sing`

![Imagem4](https://user-images.githubusercontent.com/68859160/114779354-65725880-9d4c-11eb-80bd-7e18eafec923.png)
___

## Manual (.xcframework)

- Para instalar o .xcframework manualmente:
  1. Faça o download da versão mais recente do `.xcframework` no repositório.
  2. Abra o projeto do seu aplicativo pelo Xcode.
  3. Arraste o arquivo `PagPay.xcframework` para dentro do seu projeto. Selecione `Copy itens if need`, `Created group`, `Add to target`.
  4. Selecione seu projeto no Project Navigator e em seguida, selecione seu targets no menu targets. Depois vá em `frameworks, Libaries, and Embedded Content` e garanta que seu framework esteja `Embed & Sing`
___

## Ultilização
Saiba como utilizar o Pagar com PagBank no seu aplicativo iOS.

* [Como usar os botões](docs/buttons.md)
* [Como criar uma requisição de pagamento](docs/how_to_use.md)

___

## Ambientes disponíveis
Temos dois ambientes disponíveis, um para realizar os testes de integração e o de produção.

:warning: Para realizar a troca do ambiente, é só mudar o parâmetro no método `redirectPagBank` que é usado no momento da requisição


| Ambiente | Parâmetro|
|----------|----------|
| Sandbox  | `pagPay.redirectPagBank(merchantInfo, paymentRequest, delegate: self, env: .SANDBOX)`|
| Produção | `pagPay.redirectPagBank(merchantInfo, paymentRequest, delegate: self, env: .PROD)`|

:warning: Depois da criação do pedido no ambiente de `SANDBOX`, você pode simular o pagamento seguindo essa [documentação](https://dev.pagseguro.uol.com.br/reference/pagando-um-pedido-com-deeplink-em-sandbox) :warning:

___


## Verificação do status do pagamento

O PagSeguro poderá enviar notificações via webhook para seu ambiente sempre que um evento (uma mudança de status de transação) acontecer, possibilitando a automação de seus processos de gestão de vendas.
Para que isso aconteça basta atribuir suas urls de notificação no atributo `notificationUrls` do objeto `PaymentRequest`

Para mais informações de qual payload é enviado via url de notificação acesse o [link](https://dev.pagseguro.uol.com.br/reference/charge-webhook) para mais informações.


___


## Como realizar o estorno um pagamento recebido?

1. Acessando o iBanking no [link](https://acesso.pagseguro.uol.com.br/).
2. Você pode através do menu "Extratos e Relatórios" 
3. Acessar a opção "Extrato de Transações" e identificar a transação que deseja realizar o estorno. 
4. Ao acessar os detalhes da transação a opção de estorno estará disponível.


<br>

Para mais informações sobre outra forma de integração acesse nossa [documentação](https://dev.pagseguro.uol.com.br/reference/criando-um-pedido-com-deeplink-pagar-com-pagbank)

<br>

Licença
=======

    Copyright 2022 PagSeguro Internet LTDA.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
