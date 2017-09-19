# The lab was not entirely clear on if we need to output anything to the console, besides printing each line as was given in the starting code for the lab, so I added some print statements throughout just to show that it runs correctly. Hopefully this is sufficient for the purposes of this lab.

#!/usr/bin/env python
import argparse

# Replace the string value of the following variable with your names.
ME = 'Elizabeth Andrews';
COLLABORATORS = ['NONE']

def process_file(infile):
	titles = set()

	# Loop through each line of the file
	for line in infile:
		
		# This prints each line. You will not want to remove this line.
		print line.rstrip() + '\n'


		# code to clean the lines
		# extract song title
		# splits the line using "<SEP>" as the seperator
		line = line.split("<SEP>")[3]

		print "Before removing extra text: ", line

		# eliminate superfluous text
		# remove characters in between or after the following chars
		for a in line:
			if a == '{' or a == '[' or a == '(' or a == ':' or a == '"':
				line = line.split(a, 1)[0]
		# eliminate punctuation
		# remove all following typical punctuation marks
			elif a == "." or a == "?" or a == "&" or a == ";" or a == "!":
				line = line.replace(a, "")
		# removes "feat" phrase from song title
			for word in line.split():
				if word == "feat":
					line = line.split(word, 1)[0]
		# convert line to lowercase using python function
			line = line.lower()


		print "After removing extra chars and converting to lowercase: ", line
		
		# adds the clean line to the titles
		# may want to keep this line
		lower_case_clean_title = line
		titles.add(lower_case_clean_title)

	# begin calculating bigram counts for each word

	bigram_count = {}
	list_words = []

	# loops through all titles in titles
	for title in titles:

		list_words = []
		# loops through each word in the title
		for word in title.split():
			if word not in bigram_count.keys():
				bigram_count[word] = {}
			list_words.append(word)

		# the above loop adds each word to the bigram_count dictionary, without adding duplicates

		# for each word in the line (except the last word), store the next word in a dictionary where the key is the number of times that word appears after it
		count = 0
		while count < (len(list_words) - 1):
			first = list_words[count]
			next_word = list_words[count+1]
		# if the next word hasn't been seen yet, store it with the number "1" as the key
			if next_word not in bigram_count[first].keys():
				bigram_count[first][next_word] = 1
		# if there is already an entry for the next word, increase the key by 1
			else:
				bigram_count[first][next_word] += 1
			count += 1

	# prints out each word and the count of all words that follow it throughout the file
	print "\nBigram count for each word:"
	print bigram_count
	
	# define most_common_word function inside process_file function
	def most_common_word(word):
		max_num = 0
		to_return = ''
		# loop through all entries in bigram_count for the inputted word
		# compare the number stored for each word, and store the maximum as the value to be returned
		for i in bigram_count[word]:
			if bigram_count[word][i] >= max_num:
				max_num = bigram_count[word][i]
				to_return = i
		return to_return

	
	# Since there wasn't any example output given in the lab, I wasn't sure if you wanted me to show this function working with a specific input, so I just left it as passing in a generic word when the method is called. If you change the variable passed in to any word in the text file, you will see that it does work.
	most_common_word = most_common_word(word)
	return most_common_word


# get_file_name method, written using examples from class

def get_file_name():
	parser = argparse.ArgumentParser()
	parser.add_argument('file_name')
	return parser.parse_args().file_name

# main method, prints authors name and collaborators
def main():
	print 'CSCI 305 Lab 1 submitted by %s' %ME
	print '   with help from %s\n\n' % ', '.join(COLLABORATORS)
	file_name = get_file_name()
	with open(file_name, 'r') as infile:
		process_file(infile)

if __name__ == '__main__':
	main()

	

# Internet sources used (mostly to figure out syntax):
# https://www.tutorialspoint.com/list_append.htm
# https://mail.python.org/pipermail/tutor/2006-March/046004.html
# stackoverflow.com/questions/1602934/check-if-a-given-key-already-exists-in-a-dictionary
# stackoverflow.com/questions/3559559/how-to-delete-a-character-from-a-string-using-python
# stackoverflow.com/questions/14368986/how-to-add-a-period-at-end-of-print
# https://docs.python.org/3/
# https://en.wikipedia.org/wiki/Bigram
# https://docs.python.org/2/tutorial/datastructures.html
# stackoverflow.com/questions/16333296/how-do-you-create-nested-dict-in-python
# https://docs.python.org/3/library/stdtypes.html#string-methods
