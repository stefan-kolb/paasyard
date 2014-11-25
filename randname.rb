require 'securerandom'

adjectives = %w(
	radiant shiny sparkling lucent abhorrent 
	ablaze abnormal abrasive acidic alluring 
	ambiguous apathetic aquatic auspicious axiomatic 
	barbarous bawdy belligerent berserk bewildered 
	billowy boorish brainless bustling daffy 
	damaged deadpan deafening debonair decisive 
	defective defiant demonic delirious deranged 
	devilish didactic diligent direful disastrous 
	disillusioned dispensable divergent 
	domineering draconian dynamic toxic
)

nouns = %w(
	monkey frost mist night river mouse 
	hamster elephant alligator beaver cheetah 
	cockroach coyote raven fox lion mammoth 
	squirrel weasel whale wombat yak zebra
)
# pick at random
a = SecureRandom.random_number(adjectives.length - 1)
n = SecureRandom.random_number(nouns.length - 1)
# combine with random number
number = SecureRandom.random_number(1000)
# return name
puts "#{adjectives[a]}-#{nouns[n]}-#{number}"
