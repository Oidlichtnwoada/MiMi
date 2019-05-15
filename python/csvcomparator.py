class CSVComparator:
    def __init__(self):
        pass

    def compareCSVs(self):
        test_successful = True
        error_count = 0
        with open('input.csv', 'r') as f1, open('output_expected.csv', 'r') as f2, open('output_simulated.csv', 'r') as f3:
            file1 = f1.readlines()
            file2 = f2.readlines()
            file3 = f3.readlines()
        with open('result.csv', 'w') as resultFile:
            for i in range(len(file2)):
                current_error_column_list = []
                expected = file2[i].replace('\n', '').split(',')
                simulated = file3[i].replace('\n', '').split(',')
                for m in range(len(expected)):
                    if expected[m] != simulated[m]:
                        test_successful = False
                        error_count = error_count + 1
                        current_error_column_list.append(m)
                if len(current_error_column_list) > 0:
                    output_line = 'Mismatching column(s) in line ' + str(i+1) + ': ' + str(current_error_column_list).replace('[','').replace(']','').replace(' ','') + ' => input was ' + file1[i]
                    resultFile.write(output_line)
        if test_successful:
            print('\nTest was SUCCESSFUL!')
        else:
            with open('result.csv', 'r') as resultFile:
                print('\n' + resultFile.read())
            print('ERROR count: ' + str(error_count))
            print('\nTest was NOT successful!')

CSVComparator().compareCSVs()