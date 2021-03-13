describe 'Forms' do

    it 'login com sucesso' do

        visit 'http://training-wheels-protocol.herokuapp.com/login'
        
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        
        click_button 'Login'
        
        expect(find('#flash').visible?).to be true

        # obtendo o texto e perguntando se o valor contém no texto
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

        # perguntar se no elemento contém no texto
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'senha incorreta' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'
        
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis'
        
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        
        expect(find('#flash')).to have_content 'Senha é invalida!'
    end

    it 'usuário não cadastrado' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'
        
        fill_in 'userId', with: 'steve'
        fill_in 'password', with: 'jarvis!'
        
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end

end