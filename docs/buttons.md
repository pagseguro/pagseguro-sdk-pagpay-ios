## Como usar

---
* Implementando o botão: 

Na SDK são disponibilizadas cinco opções de botões que podem ser utilizadas:

#### Yellow
![Exemplo de Botão Yellow](images/example_yellow_button.png)

```swift
let yellowPagPayButton = PagPayPaymentButton(frame: .zero, theme: .yellow)
```

#### Light Green
![Exemplo de Botão Light Green](images/example_light_green_button.png)

```swift
let lightGreenPagPayButton = PagPayPaymentButton(frame: .zero, theme: .lightGreen)
```

#### Green
![Exemplo de Botão Green](images/example_green_button.png)

```swift
let greenPagPayButton = PagPayPaymentButton(frame: .zero, theme: .green)
```

#### Dark
![Exemplo de Botão Dark](images/example_dark_button.png)

```swift
let darkPagPayButton = PagPayPaymentButton(frame: .zero, theme: .dark)
```

#### Light
![Exemplo de Botão Light](images/example_light_button.png)

```swift
let lightPagPayButton = PagPayPaymentButton(frame: .zero, theme: .light)
```

#### Adicionar a função que vai executar o clicar no botão
```swift
private func setupDarkPagPayButton() {
        view.addSubview(darkPagPayButton)
         
        darkPagPayButton.translatesAutoresizingMaskIntoConstraints = false
        darkPagPayButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0).isActive = true
        darkPagPayButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        darkPagPayButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        darkPagPayButton.topAnchor.constraint(equalTo: lightPagPayPaymentButton.bottomAnchor, constant: 16).isActive = true
         
        darkPagPayButton.addTarget(self, action: #selector(tapDarkButton), for: .touchUpInside)
    }
```
