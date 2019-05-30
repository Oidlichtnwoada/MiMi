# generate input.csv and output_expected.csv
#python ./generateinputandexpectedoutput.py
# compile sources
make compile
# simulate
make sim
# compare the result
python ../../../python/csvcomparator.py