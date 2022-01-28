![LogoPagSeguro](https://user-images.githubusercontent.com/68859160/114778858-c77e8e00-9d4b-11eb-8c67-e97eade6534f.png)


# Pagar com PagBank iOS SDK
---
## Introdução
O Pagar com PagBank é o produto do PagSeguro que permite aos vendedores utilizar o app PagBank como método de pagamento no checkout do seu próprio aplicativo. Este produto confere mais segurança aos vendedores devido aos padrões de validação de conta e cartões de crédito, adotados pelo PagBank. 

![botoesPagPay](docs/images/example_light_button.png)

---
## SDK

A SDK disponibiliza um botão de pagamentos que facilita a integração do Merchant, através de suas credenciais pode enviar os dados do seu pedido e nossa SDK irá realizar a integração com nossos serviços. 

___
## Conceitos Básicos

Antes de fazer uso da biblioteca é importante que o desenvolvedor realize alguns procedimentos básicos, além de assimilar alguns conceitos importantes para o correto funcionamento de sua aplicação. É necessário ter em mãos o token da conta PagSeguro que será configurado como vendedor (Seller), tal token pode ser obtido no ibanking do PagSeguro.

___
## Históricos de Versão
* 0.0.1 : **Versão inicial publicada** - 25/05/2021
* 0.0.2 : **Versão atualizada publicada** - 24/01/2022

---
## Pré-requisitos
* Possuir uma conta PagSeguro.
* Para utilizar o Pagar com PagBank, é necessário que o seu aplicativo seja desenvolvido em Swift.

---
## Integrando o Pagar com PagBank
Para integrar a biblioteca (SDK) em seu projeto, siga os passos abaixo.
1. Faça o download da versão mais recente da biblioteca. 
2. Abra o projeto do seu aplicativo pelo Xcode.
3. Arraste o arquivo `pagpay.framework` para dentro do seu projeto. Selecione `Copy itens if need`, `Created group`, `Add to target`.

![imagem3](https://user-images.githubusercontent.com/68859160/114779283-4a074d80-9d4c-11eb-9ac8-6b0d28185a52.png)

4. Selecione seu projeto no Project Navigator e, em seguida, selecione seu targert no menu Targets. Depois vá em `frameworks, Libaries, and Embedded Content` e garanta que seu framework esteja `Embed & Sing`

![Imagem4](https://user-images.githubusercontent.com/68859160/114779354-65725880-9d4c-11eb-80bd-7e18eafec923.png)
___
## Receba as notificações de pagamento
O PagSeguro poderá enviar notificações via webhook para seu ambiente sempre que um evento (uma mudança de status de transação) acontecer, possibilitando a automação de seus processos de gestão de vendas.

Acesse o link para mais informações: https://dev.pagseguro.uol.com.br/reference/charge-webhook

___
## Credenciais de Autenticação
As soluções públicas do PagSeguro requerem autenticação e através dela identificamos e autorizamos o integrador a utilizar nossas APIs e seus recursos, bem como eventuais configurações adicionais.

* Primeiro passo - Ter uma conta PagSeguro

Para criar uma conta no nosso ambiente de Sandbox, acesse o link: https://acesso.pagseguro.uol.com.br/sandbox

* Segundo passo - Criar uma Aplicação para utilizar o Pagar com PagBank.

Acesse o link: https://dev.pagseguro.uol.com.br/reference/connect-create-client

___
## Ambientes disponíveis 

* Produção - https://api.pagseguro.com/
* Sandbox  - https://sandbox.api.pagseguro.com/

___
## Instalação
Saiba como utilizar o Pagar com PagBank no seu aplicativo iOS.

* [Como usar os botões](docs/buttons.md)
* [Como criar uma requisição de pagamento](docs/requisicao.md)
* [Como simular um pagamento em Sandbox](docs/sandbox.md)
___

## Como devolver/cancelar um pagamento recebido?
Acessando o iBanking no link https://acesso.pagseguro.uol.com.br/, você pode através do menu "Extratos e Relatórios", acessar a opção Extrato de Transações identificar a transação que deseja devolver/cancelar, ao acessar os detalhes da transação a opção de devolver/cancelar estará disponível.

___
## Fluxo
![Imagem](docs/images/fluxo.png)

___
## Copyright

Todos os direitos reservados. O UOL é uma marca comercial do UNIVERSO ONLINE S / A. O logotipo do UOL é uma marca comercial do UNIVERSO ONLINE S / A. Outras marcas, nomes, logotipos e marcas são de propriedade de seus respectivos proprietários. As informações contidas neste documento pertencem ao UNIVERSO ONLINE S/A. Todos os direitos reservados. UNIVERSO ONLINE S/A. - Av. Faria Lima, 1384, 6º andar, São Paulo / SP, CEP 01452-002, Brasil. O serviço PagSeguro não é, nem pretende ser comparável a serviços financeiros oferecidos por instituições financeiras ou administradoras de cartões de crédito, consistindo apenas de uma forma de facilitar e monitorar a execução das transações de comércio electrónico através da gestão de pagamentos. Qualquer transação efetuada através do PagSeguro está sujeita e deve estar em conformidade com as leis da República Federativa do Brasil. Aconselhamos que você leia os termos e condições cuidadosamente.
___
## Aviso Legal

O UOL não oferece garantias de qualquer tipo (expressas, implícitas ou estatutárias) com relação às informações nele contidas. O UOL não assume nenhuma responsabilidade por perdas e danos (diretos ou indiretos), causados por erros ou omissões, ou resultantes da utilização deste documento ou a informação contida neste documento ou resultantes da aplicação ou uso do produto ou serviço aqui descrito. O UOL reserva o direito de fazer qualquer tipo de alterações a quaisquer informações aqui contidas sem aviso prévio.
