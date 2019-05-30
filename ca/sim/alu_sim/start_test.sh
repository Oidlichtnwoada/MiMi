# compile sources
make compile
# simulate
make sim
# compare the result
python ../../../python/csvcomparator.py
# clean up after yoursefl
make clean