class Poem
  attr_accessor :lyrics, :size

  def initialize()
    @lyrics = [
      'the horse and the hound and the horn that belonged to',
      'the farmer sowing his corn that kept',
      'the rooster that crowed in the morn that woke',
      'the priest all shaven and shorn that married',
      'the man all tattered and torn that kissed',
      'the maiden all forlorn that milked',
      'the cow with the crumpled horn that tossed',
      'the dog that worried',
      'the cat that killed',
      'the rat that ate',
      'the malt that lay in',
      'the house that Jack built'
    ]
    @size = @lyrics.size()
  end

  # method to return poems
  def recite(number)
    # validate number
    error_msg = validate_number(number)
    raise error_msg unless error_msg.nil?

    # get lyrics in range number to last index
    i = @size - number
    final_lyrics = []
    while i < @size
      final_lyrics.push(@lyrics[i])
      i+=1
    end

    final_lyrics = final_lyrics.join(' ')
    
    return "This is " + final_lyrics
  end

  # method to return random poems
  def recite_random
    number = rand(1..@size)
    return recite(number)
  end

  # method to return subjects
  def recite_subject(number)
    # validate number
    error_msg = validate_number(number)
    raise error_msg unless error_msg.nil?

    i = @size - number
    final_subjects = []
    while i < @size
      subjects = get_subject(@lyrics[i])
      subjects.each do |subject|
        final_subjects.push(subject)
      end
      i+=1
    end

    final_subjects = format_final_subject(final_subjects)

    return "This is " + final_subjects
  end

  # method to return random subjects
  def recite_random_subject
    number = rand(1..@size)
    return recite_subject(number)
  end

  private

  # method to parse subjects from lyric
  def get_subject(lyric)
    arr = lyric.gsub(' and ', 'and').split('and')
    subjects = []
    for item in arr
      item = item.split(' ')
      subjects.push(item[0..1].join(' ')) if item[0].downcase == 'the'
    end
    return subjects
  end

  # method to format subjects into expected output
  def format_final_subject(subjects)
    if subjects.size == 1
      subjects[0]
    elsif subjects.size == 2
      subjects[0] + ' and ' + subjects[1]
    else
      last_subject = subjects.pop()
      subjects.join(', ') + ' and ' + last_subject
    end
  end

  # method to validate input
  def validate_number(number)
    valid_number = number.class == Integer && number.positive? && number <= @size
    return "invalid number, please input number with integer dataType in range 1 - #{@size}" unless valid_number

    return nil
  end

end