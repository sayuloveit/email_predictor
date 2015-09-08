require_relative '../lib/analyser'
require_relative '../lib/constants'
require_relative '../lib/patterns'

describe Analyser do
  context 'figuring out pattern out of name and email -' do

    let(:email_patterns) { EMAIL_PATTERNS }
    let(:analyser) { Analyser.new(email_patterns) }

    it 'first name dot last name pattern' do
      analyser.analyze('Vic Zhu', 'vic.zhu@alphasights.com')
      expect(analyser.email_domain).to eq 'alphasights.com'
      expect(analyser.split_name).to eq ['vic', 'zhu']
      expect(analyser.patterns.first).to eq email_patterns[:first_name_dot_last_name]
    end

    it 'first name dot last initial pattern' do
      analyser.analyze('Vic Zhu', 'vic.z@alphasights.com')
      expect(analyser.email_domain).to eq 'alphasights.com'
      expect(analyser.split_name).to eq ['vic', 'zhu']
      expect(analyser.patterns.first).to eq email_patterns[:first_name_dot_last_initial]
    end

    it 'first initial dot last name pattern' do
      analyser.analyze('Vic Zhu', 'v.zhu@alphasights.com')
      expect(analyser.email_domain).to eq 'alphasights.com'
      expect(analyser.split_name).to eq ['vic', 'zhu']
      expect(analyser.patterns.first).to eq email_patterns[:first_initial_dot_last_name]
    end

    it 'first initial dot last initial pattern' do
      analyser.analyze('Vic Zhu', 'v.z@alphasights.com')
      expect(analyser.email_domain).to eq 'alphasights.com'
      expect(analyser.split_name).to eq ['vic', 'zhu']
      expect(analyser.patterns.first).to eq email_patterns[:first_initial_dot_last_initial]
    end

    it 'first name dot last name and first name dot last initial pattern' do
      analyser.analyze('Vic Z', 'vic.z@alphasights.com')
      expect(analyser.patterns).to eq [email_patterns[:first_name_dot_last_name], email_patterns[:first_name_dot_last_initial]]
    end

    it 'no patterns decided' do
      analyser.analyze('Vic Zhu', 'xi.zhu@alphasights.com')
      expect(analyser.email_domain).to eq 'alphasights.com'
      expect(analyser.split_name).to eq ['vic', 'zhu']
      expect(analyser.patterns).to eq []
    end

  end
end