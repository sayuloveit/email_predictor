require_relative '../lib/evaluator'
require_relative '../lib/analyser'
require_relative '../lib/constants'
require_relative '../lib/patterns'

describe Analyser do

  let(:email_patterns) {EMAIL_PATTERNS}
  let(:analyser) { Analyser.new(email_patterns) }
  let(:evaluator) { Evaluator.new(EXAMPLES, analyser) }

  describe '#match_patterns' do
    context 'only one pattern for email -' do

      it 'gives corresponding first_name.last_name pattern' do
        expect(evaluator.match_patterns('alphasights.com').first).to eq email_patterns[:first_name_dot_last_name]
      end

      it 'gives corresponding first_initial.last_initial pattern' do
        expect(evaluator.match_patterns('apple.com').first).to eq email_patterns[:first_initial_dot_last_initial]
      end

    end

    context 'more than one pattern for email -' do

      it 'gives corresponding first_name.last_initial and first_initial.last_name pattern' do
        expect(evaluator.match_patterns('google.com')).to eq [email_patterns[:first_name_dot_last_initial], email_patterns[:first_initial_dot_last_name]]
      end

    end
  end

end