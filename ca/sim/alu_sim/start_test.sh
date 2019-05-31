# compile sources
make compile
# simulate
make sim
# compare the result
python ../../../python/csvcomparator.py
# cleaning up
make clean