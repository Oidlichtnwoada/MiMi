# generate input.csv and output_expected.csv
python3 ./generateinputandexpectedoutput.py
# compile sources
make 'compile'
# simulate
make 'sim'
# compare the result
python3 ../../../python/csvcompare.py