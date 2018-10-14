class MyContainer
  extend Dry::Container::Mixin

  register 'note.contract.create' do
    Note::Contract::Create
    #Note::Contract::CreateUK
  end
end
