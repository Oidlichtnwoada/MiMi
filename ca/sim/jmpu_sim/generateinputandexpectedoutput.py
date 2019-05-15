import sys

sys.path.append('../../../python/')

from inputandoutputexpectedgenerator import InputAndOutputExpectedGenerator as IAOEGenerator

generator = IAOEGenerator()

with open('input.csv', 'r+') as input_file, open('output_expected.csv', 'r+') as output_file:
    # do manipulations to both files with the methods of the generator or change them manually
    pass
