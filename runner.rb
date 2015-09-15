require_relative 'lib/constants'
require_relative 'lib/patterns'
require_relative 'lib/analyser'
require_relative 'lib/evaluator'
require_relative 'lib/predictor'

analyser = Analyser.new(EMAIL_PATTERNS)
evaluator = Evaluator.new(EXAMPLES, analyser)
evaluator.match_patterns
predictor = Predictor.new(evaluator)

PREDICT.each_with_index do |(name, domain), index|
  puts "#{index + 1}. predicted emails for #{name} at #{domain}"
  puts predictor.predict(name, domain)
  puts
end