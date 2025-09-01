
Dado('que acesso a página de cadastro') do                                      
    visit "http://rocklov-web:3000/signup"
end                                                                             
                                                                                
Quando('submeto o meu cadastro completo') do

    MongoDB.new.remove_user("joab@gmail.com")
    
    find("#fullName").set "Joab"
    find("#email").set "joab@gmail.com"
    find("#password").set "1234"

    click_button "Cadastrar"
end                                                                             
                                                                                
Então('sou redirecionado para o Dashboard') do                                  
    expect(page).to have_css ".dashboard"
end

Quando('submeto o meu cadastro sem o nome') do
    find("#email").set Faker::Internet.email(domain: 'gmail.com')
    find("#password").set "1234"

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "Joab"
    find("#password").set "1234"

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro com email incorreto') do
    find("#fullName").set "Joab"
    find("#email").set "joab%gmail.com"
    find("#password").set "1234"

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set "Joab"
    find("#email").set Faker::Internet.email(domain: 'gmail.com')

    click_button "Cadastrar"
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert|
  alert = find(".alert-dark")
  expect(alert.text).to eql expect_alert
end