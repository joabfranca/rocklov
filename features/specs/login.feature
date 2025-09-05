#language: pt

Funcionalidade: Login
Sendo um usuário cadastrado
Quero acessar o sistema da Rocklov
Para que eu possa anunciar meus equipamentos musicais

@Login
Cenário: Login do usuário

	Dado que acesso a página principal
	Quando submeto minhas credenciais válidas "joabs@gmail.com" e "1234"
	Então sou redirecionado para o Dashboard

Esquema do Cenário: Tentar logar

	Dado que acesso a página principal
	Quando submeto minhas credenciais válidas "<email_input>" e "<senha_input>"
	Então vejo a mensagem de alerta: "<mensagem_output>"

	Exemplos:
		|email_input	 |senha_input|mensagem_output					|
		|joabs@gmail.com |12345		|Usuário e/ou senha inválidos.		|
		|joabfs@g404.com |1234		|Usuário e/ou senha inválidos.		|
		|joab%gmail.com	 |1234		|Oops. Informe um email válido!		|
		|				 |1234		|Oops. Informe um email válido!		|
		|joabs@gmail.com |			|Oops. Informe sua senha secreta!	|


