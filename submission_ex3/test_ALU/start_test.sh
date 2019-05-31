# compile sources
make compile
# simulating the test bench
make sim
# compare the result
python ./csvcomparator.py
# cleaning up
make clean