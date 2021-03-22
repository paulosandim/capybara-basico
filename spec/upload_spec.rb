describe 'Upload', :upload do
    
    before(:each) do
        visit  'http://training-wheels-protocol.herokuapp.com/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/teste.txt'
        @imagem = Dir.pwd + '/spec/fixtures/nana.jpg'
    end

    it 'Upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'teste.txt'
    end

    it 'Upload com arquivo texto' do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        img = find('#new-image')
        expect(img[:src]).to include '/uploads/nana.jpg'
    end

    after(:each) do
        sleep 3
    end

end