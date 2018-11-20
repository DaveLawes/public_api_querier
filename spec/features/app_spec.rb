describe 'app.rb' do

  it 'returns the most sold item' do
    most_sold = %x(ruby app.rb most_sold)
    expect(most_sold).to eq "Heavy Duty Concrete Watch\n"
  end

  it 'returns the total spend for a given email' do
    total_spend = %x(ruby app.rb total_spend schimmel_quincy@ernser.io)
    expect(total_spend).to eq "245.01\n"
  end

  it 'returns the most loyal customer' do
    most_loyal = %x(ruby app.rb most_loyal)
    expect(most_loyal).to eq "travis_kshlerin@wunsch.net\n"
  end

  it 'returns a message when unknown question is asked' do
    unknown_question = %x(ruby app.rb xxx)
    expect(unknown_question).to eq "Unknown question\n"
  end

  it 'returns a message when email is not provided for total_spend' do
    no_email = %x(ruby app.rb total_spend)
    expect(no_email).to eq "Email required\n"
  end

end
