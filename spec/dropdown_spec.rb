describe 'Caixa de Opções', :dropdown do
    
    it 'item específico simples' do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3
    end

    it 'item específico com o find' do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end

    it 'qualquer item', :sample do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        # metodo sample sorteia um nome do array
        drop.all('option').sample.select_option
    end

end