
#
# Exemplo usado para verificar se model e valido, quando é removido o attributo "parameter"
# Exemplo: ./spec/models/player_spec.rb
#
shared_examples "model without required attribute" do |model, parameter|

  subject { model.new(model_attributes.except(parameter.to_sym)).valid? }
  it      { should be false }

end

#
# Exemplo usado para verificar que um campo nao é buscavel.
# Exemplo: ./spec/models/player_spec.rb
#
shared_examples "unsearchable attribute" do | search_term |
  subject { Player.search(search_term).results.size }
  it      { should eq(0) }
end