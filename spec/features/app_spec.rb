describe 'app.rb' do

  it 'returns the most sold item' do
    most_sold = %x( ruby app.rb )
    expect(most_sold).to eq "Heavy Duty Concrete Watch\n"
  end

end