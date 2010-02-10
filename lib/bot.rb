require 'lib/wordplay'

# A basic implementation of a chatterbot
class Bot  
  attr_reader :name
  
  # Initializes the bot object, loads in the external YAML data
  # file and sets the bot's name. Raises an exception if
  # the data loading process fails.
  def initialize(options)
    @name = options[:name].capitalize || "Unnamed Bot"
    create_data
  end
  
  # Returns a random greeting as specified in the bot's data file
  def greeting
    random_response(:greeting)
  end
  
  # Returns a random farewell message as specified in the bot's
  # data file
  def farewell
    random_response(:farewell)
  end
  
  # Responds to input text as give by an user
  def response_to(input)
    prepared_input = preprocess(input.downcase)
    sentence = best_sentence(prepared_input)
    reversed_sentence = WordPlay.switch_pronouns(sentence)
    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end
  
  private
  
  # Chooses a random response phrase from the :responses hash
  # and substitutes metadata into the phrase
  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end
  
  # Performs preprocessing tasks upon all input to the bot
  def preprocess(input)
    perform_substitutions(input)
  end
  
  # Substitutes words and phrases on supplied input as dictated by
  # the bot's :presub data
  def perform_substitutions(input)
    @data[:presubs].each { |s| input.gsub!(s[0], s[1]) }
    input
  end
  
  # Using the single word keys from :responses, we seach for the
  # sentence that uses the most of them, as it's likely to be the
  # 'best' sentence to parse
  def best_sentence(input)
    hot_words = @data[:responses].keys.select do |k|
      k.class == String && k =~ /^\w+$/
    end
    
    WordPlay.best_sentence(input.sentences, hot_words)
  end
  
  # Using a supplied sentence, go through the bot's :responses
  # data set and collect together all phrases that could be
  # used as responses
  def possible_responses(sentence)
    responses = []
    
    # Find all patterns to try to match against
    @data[:responses].keys.each do |pattern|
      next unless pattern.is_a?(String)
      
      # For each pattern, see if the supplied sentence contains
      # a match. Remove substitution symbols (*) before checking.
      # Push all responses to the responses array.
      if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
        # If the pattern contains substitution placeholders,
        # perform the substitutions
        if pattern.include?('*')
          responses << @data[:responses][pattern].collect do |phrase|
            # First, erase everything before the placeholder
            # leaving everything after it
            matching_section = sentence.sub(/^.*#{pattern}\s+/, '')
            
            # Then substitute the text after the placeholder, with
            # the pronouns switched
            phrase.sub('*', WordPlay.switch_pronouns(matching_section)) if !phrase.nil?
          end
        else
          # No placeholders? Just add the prases to the array
          responses << @data[:responses][pattern]
        end
      end
    end
    
    # If there were no matches, add the default ones
    responses << @data[:responses][:default] if responses.empty?
    
    # Flatten the blocks of responses to a flat array
    responses.flatten
  end
  
  def create_data
    @data                         = Hash.new
    @data[:presubs]               = Presub.all.collect { |presub| [ presub.word, presub.substitution] }
    @data[:responses]             = Hash.new                     
    
    fill_responses_hash
    
    @data[:responses][:greeting]  = Greeting.all.collect { |greeting| greeting.greeting }
    @data[:responses][:farewell]  = Farewell.all.collect { |farewell| farewell.farewell }
    @data[:responses][:default]   = DefaultResponse.all.collect { |default| default.response }
  end
  
  def fill_responses_hash
     Keyword.all.collect { |keyword| 
                                      { keyword.keyword =>  keyword.responses.collect{ |response| response.response } } 
                          }.each { |relation| @data[:responses].merge! relation }
  end
end