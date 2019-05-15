class CSVCompare:
    def __init__(self):
        pass

    def compareCSVs(self):
        output_expected = open('output_expected.csv', 'r')
        output_simulated = open('output_simulated.csv', 'r')
        print(output_expected)
        print(output_simulated)
        output_expected.close()
        output_simulated.close()

CSVCompare().compareCSVs()