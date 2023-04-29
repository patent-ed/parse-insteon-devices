# parse-insteon-devices

Create parse-devices.sh
This script takes the text data from the Insteon plugin and organizes into a utf-8 compatible .csv file https://wiki.indigodomo.com/doku.php?id=plugins:example_db_traverse_1

Save this script as "process_data.sh" and make it executable with chmod +x process_data.sh. To run the script, provide the input file and output file names as arguments:

bash
Copy code
./process_data.sh input_file.txt output_file.csv
This script will create a new UTF-8 encoded CSV file named output_file_utf8.csv with the organized data.
