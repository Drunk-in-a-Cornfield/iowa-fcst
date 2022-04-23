import keras
import numpy as np
import datetime

counties = ['ADAIR', 'ADAMS', 'ALLAMAKEE', 'APPANOOSE', 'AUDUBON', 'BENTON', 'BLACK HAWK', 'BOONE', 'BREMER', 'BUCHANAN', 'BUENA VIST', 'BUENA VISTA', 'BUTLER', 'CALHOUN', 'CARROLL', 'CASS', 'CEDAR', 'CERRO GORD', 'CERRO GORDO', 'CHEROKEE', 'CHICKASAW', 'CLARKE', 'CLAY', 'CLAYTON', 'CLINTON', 'CRAWFORD', 'DALLAS', 'DAVIS', 'DECATUR', 'DELAWARE', 'DES MOINES', 'DICKINSON', 'DUBUQUE', 'EMMET', 'FAYETTE', 'FLOYD', 'FRANKLIN', 'FREMONT', 'GREENE', 'GRUNDY', 'GUTHRIE', 'HAMILTON', 'HANCOCK', 'HARDIN', 'HARRISON', 'HENRY', 'HOWARD', 'HUMBOLDT', 'IDA', 'IOWA', 'JACKSON', 'JASPER', 'JEFFERSON', 'JOHNSON', 'JONES', 'KEOKUK', 'KOSSUTH', 'LEE', 'LINN', 'LOUISA', 'LUCAS', 'LYON', 'MADISON', 'MAHASKA', 'MARION', 'MARSHALL', 'MILLS', 'MITCHELL', 'MONONA', 'MONROE', 'MONTGOMERY', 'MUSCATINE', "O'BRIEN", 'OBRIEN', 'OSCEOLA', 'PAGE', 'PALO ALTO', 'PLYMOUTH', 'POCAHONTAS', 'POLK', 'POTTAWATTA', 'POTTAWATTAMIE', 'POWESHIEK', 'RINGGOLD', 'SAC', 'SCOTT', 'SHELBY', 'SIOUX', 'STORY', 'TAMA', 'TAYLOR', 'UNION', 'VAN BUREN', 'WAPELLO', 'WARREN', 'WASHINGTON', 'WAYNE', 'WEBSTER', 'WINNEBAGO', 'WINNESHIEK', 'WOODBURY', 'WORTH', 'WRIGHT']
counties_encoding = {county: num for num, county in enumerate(counties) }

def load_model():
	return keras.models.load_model("deep_learning_rnn_model")

def serve_model(county_string, date_zero, day_count, model):
	time_steps = 6
	predictions = []
	for d in range(day_count):
		date = date_zero - datetime.timedelta(days=time_steps - 1)
		sample_x_features = []
		for i in range(time_steps):
			feature_vec = np.zeros((len(counties) + 2))
			feature_vec[0] = date.toordinal()
			feature_vec[1] = date.weekday()
			feature_vec[2 + counties_encoding[county_string]] = 1
			sample_x_features.append(feature_vec)

			date = date + datetime.timedelta(days=1)

		predictions.append(model.predict(np.array([sample_x_features]))[0][0])
		date_zero = date_zero + datetime.timedelta(days=1)
	return predictions
		

if __name__ == "__main__":
	print(serve_model("POLK", datetime.datetime.now() - datetime.timedelta(days=5), 10, load_model()))