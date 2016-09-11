from flask import Flask
import csv 


app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'



# int 		type
# 0			FARMERS_MARKET
# 1			FOOD_PANTRY
# 2			SHARE_HOST_SITE
# 3			SOUP_KITCHEN
# 4			SENIOR_MEALS
# change error value?
def map_type_to_int(type_string):
	type_string = type_string.upper()
	if type_string == 'FARMERS_MARKET':
		return 0
	elif type_string == 'FOOD_PANTRY':
		return 1
	elif type_string == 'SHARE_HOST_SITE':
		return 2
	elif type_string == 'SOUP_KITCHEN':
		return 3
	elif type_string == 'SENIOR_MEALS':
		return 4
	else:
		return -1

# read in CSV file
def read_csv(file_name):
	with open(file_name, 'r') as f:
		data = [row for row in csv.DictReader(f.read().splitlines())]
	for num in range(0, 4):
		print data[num]

# def parse_csv_data(data):



# dict: Type ints 
# 	Name string	
# 	Address - Line 1	string
# 	Address - Line 2 (optional)	string
# 	City	string
# 	State	string
# 	Zip Code int


# and store in a dict 
# create json structure of a location
# convert CSV into json structure
# return all of them 
@app.route('/locations')
def return_locations():
	return 'locations json'




if __name__ == "__main__":

   read_csv('resources.csv')




