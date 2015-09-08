require_relative '../lib/analyser'
require_relative '../lib/evaluator'
require_relative '../lib/generator'
require_relative '../lib/predictor'
require_relative '../lib/constants'
require_relative '../lib/patterns'

describe Predictor do

  let(:analyser) { Analyser.new(EMAIL_PATTERNS) }
  let(:evaluator) { Evaluator.new(EXAMPLES, analyser) }
  let(:predictor) { Predictor.new(evaluator) }

  context 'guessing email addresses given first and last name, and domain -' do

    it 'correctly guess an email for Peter Wong from alphasights.com' do
      name, domain = 'Peter Wong', 'alphasights.com'
      expect(predictor.predict(name, domain).first).to eq 'peter.wong@alphasights.com'
    end

    it 'correctly guess an email for Craig Silverstein from google.com' do
      name, domain = 'Craig Silverstein', 'google.com'
      expect(predictor.predict(name, domain)).to eq ['craig.s@google.com', 'c.silverstein@google.com']
    end

    it 'correctly guess an email for Steve Wozniak from apple.com' do
      name, domain = 'Steve Wozniak', 'apple.com'
      expect(predictor.predict(name, domain).first).to eq 's.w@apple.com'
    end

    it 'returns response when there is no pattern for given name and domain' do
      name, domain = 'Barack Obama', 'whitehouse.gov'
      expect(predictor.predict(name, domain)).to eq 'no prediction was possible for this domain'
    end

  end

  context 'generate error messages based on input' do

    it 'generates right message when part of full name is given' do
      first_name, last_name, domain = 'Vic', 'Zhu', 'alphasights.com'
      expect { predictor.predict(first_name, domain)}.to raise_error 'name must have a first and last name'
      expect { predictor.predict(last_name, domain)}.to raise_error 'name must have a first and last name'
    end

  end

end