Pod::Spec.new do |spec|
  spec.name         = "PagPay"
  spec.version      = "1.0.0"
  spec.summary      = "Pagar com PagBak"
  spec.description  = <<-DESC
  O Pagar com PagBank é o produto do PagSeguro que permite aos vendedores utilizar o app PagBank como método de pagamento no checkout do seu próprio aplicativo. 
  Este produto confere mais segurança aos vendedores devido aos padrões de validação de conta e cartões de crédito, adotados pelo PagBank.
  DESC
  spec.homepage     = "https://github.com/pagseguro/pagseguro-sdk-pagpay-ios"
  spec.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE.txt" }
  spec.author       = { "PagSeguro Internet LTDA" => "pagseguro.pd@uolinc.com" }
  spec.swift_version = "5.4.2"
  spec.platform     = :ios
  spec.ios.deployment_target = "11.0"
  spec.source       = { :git => "https://github.com/pagseguro/pagseguro-sdk-pagpay-ios.git", :tag => "#{spec.version}" }
  spec.frameworks = "Foundation", "UIKit"
  spec.vendored_frameworks = "PagPay.xcframework"
  spec.xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(inherited)",
    "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES" => "$(inherited)"
  }
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end