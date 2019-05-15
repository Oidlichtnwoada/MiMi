import sys

sys.path.append('../../../python/')

from inputandoutputexpectedgenerator import InputAndOutputExpectedGenerator as IAOEGenerator

generator = IAOEGenerator()

input_file = open('input.csv', 'r+')
output_expected = open('output_expected.csv', 'r+')

# do manipulations to both files with the methods of the generator or change them manually

input_file.close()
output_expected.close()