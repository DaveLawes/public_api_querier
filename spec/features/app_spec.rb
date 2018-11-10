describe 'app.rb' do

  it 'returns the most sold item' do
    most_sold = %x(ruby app.rb most_sold)
    expect(most_sold).to eq "Heavy Duty Concrete Watch\n"
  end

  it 'returns a message when unknown question is asked' do
    unknown_question = %x(ruby app.rb xxx)
    expect(unknown_question).to eq "Sorry, unknown question\n"
  end

end
