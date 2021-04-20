require "test/unit"
require_relative './poem.rb'

class PoemTest < Test::Unit::TestCase
  # should return correct poem
  def test_recite
    poem = Poem.new
    mock_data = 'This is the house that Jack built'
    assert_equal mock_data, poem.recite(1), "recite(1) should return #{mock_data}"
  end

  # should return different random poems
  def test_recite_random
    poem = Poem.new
    data1 = poem.recite_random
    data2 = poem.recite_random
    assert_not_equal data1, data2, "recite_random should return different data"
  end

  def test_input_type_invalid
    poem = Poem.new
    
    assert_raise do
      poem.recite('#') 
    end 
  end

  def test_input_number_invalid
    poem = Poem.new
    
    assert_raise do
      poem.recite(-1) 
    end 
  end

  def test_recite_subject
    poem = Poem.new
    mock_data = 'This is the rat, the malt and the house'
    assert_equal mock_data, poem.recite_subject(3), "recite_subject(3) should return #{mock_data}"
  end

  def test_recite_subject_random
    poem = Poem.new
    data1 = poem.recite_random_subject
    data2 = poem.recite_random_subject
    assert_not_equal data1, data2, "recite_random_subject should return different data"
  end

end