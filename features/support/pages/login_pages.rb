

class LoginPage
    include Capybara::DSL

    def abrir
        visit "/"
    end

    def campo_email
        return find("#email")
    end

    def campo_senha
        return find("#password")
    end

    def botao_entar
        click_button "Entrar"
    end

end