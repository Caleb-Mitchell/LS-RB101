#file = File.open("text.txt")
#file_data = file.read

a = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

=begin
# -------------------------------------- Problem ----------------------------------------
Explicit
  Print the longest sentence in the file based on number of words
  Print the number of words in the longest sentence
  Sentences may end with periods (.), exclamation points (!), or question marks (?)

Implicit

Keyword

# -------------------------------------- Understand -------------------------
Model

Edge

Abstract
  Given a string paragraph, split into array of sentences
  Then return max sentence

# -------------------------------------- Slice ------------------------------
Init longest_sent = []
Split into array of sentences
  First remove newline characters and replace with space (for accurate length)
  Split on the sentence-ending characters
    We now have an array of sentences as elements
      Split each element and count the number of elements within the newly split array
      longest_sent = element if the element.size > longest_sent.size
longest_sent.size

# -------------------------------------- Brainstorm ------------------------------


# -------------------------------------- Code -------------------------------------------
=end



def longest_sentence(str)
  results = str.strip.split(/[.|?|!]/).map(&:split).max_by(&:length)
  p results.join(' ')
  p results.size
end

def longest_sentence_from_file(text_file)
  str = File.read(text_file)
  results = str.strip.split(/[.|?|!]/).map(&:split).max_by(&:length)
  p results.join(' ')
  p results.size
end

longest_sentence(a)
longest_sentence_from_file('pg84.txt')
