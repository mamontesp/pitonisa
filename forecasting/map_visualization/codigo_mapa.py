# se cargan las librerias
import geopandas as gpd
import pyproj
import geoplot #as gplt
import geoplot.crs as gcrs
import plotly_express as px
from datetime import datetime
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import numpy as np
import missingno as msno
import pickle

# se leen las predicciones
with open('valores_reales_y_predicciones_trimestral_3anos.pkl', 'rb') as f:
  base_comp_col_con_pred = pickle.load(f)

# se da formato a la variable temporal
base_comp_col_con_pred['ANO_TRI'] = pd.to_datetime(base_comp_col_con_pred['ANO_TRI'])
base_comp_col_con_pred['COD_MUNICIPIO']=base_comp_col_con_pred['ID_MUNICIPIO'].astype('str').str.zfill(5)
print(base_comp_col_con_pred.tail())
# se carga el shape de Colombia nivel municipio
colombia_shape = gpd.read_file("MGN_MPIO_POLITICO.shp")
colombia_shape.to_file('MGN_MPIO_POLITICO.geojson', driver='GeoJSON')
# we read the object that we've just written
colombia_shape = gpd.read_file('MGN_MPIO_POLITICO.geojson')
# we define the pojection type
colombia_shape.to_crs(pyproj.CRS.from_epsg(4326),inplace=True)
# se seleccionan las variables de interes del shape
colombia_shape = colombia_shape[['MPIO_CCNCT','MPIO_CNMBR','DPTO_CNMBR','geometry']]
# se visualiza el shape 
geoplot.polyplot(colombia_shape, edgecolor='darkgrey', facecolor='lightgrey', linewidth=.3,figsize=(12, 8))
# se define el index
colombia_shape.set_index('MPIO_CCNCT',inplace=True)
colombia_shape.head()


# se arregla la variable temporal para que sea aceptada por el mapa y se hace el logaritmo de los suscriptores por temas esteticos
base_comp_col_con_pred.set_index('COD_MUNICIPIO',inplace=True)
base_comp_col_con_pred.ANO_TRI = base_comp_col_con_pred.ANO_TRI.apply(lambda x: x.strftime('%Y-%m-%d'))
base_comp_col_con_pred['lgSUSCRIPTORES']= np.log(base_comp_col_con_pred['SUSCRIPTORES'])
base_comp_col_con_pred.head()


#se hace el mapa
fig = px.choropleth(base_comp_col_con_pred,
  geojson=colombia_shape.geometry, 
  locations= base_comp_col_con_pred.index, 
  color="lgSUSCRIPTORES", 
  hover_name="ID_MUNICIPIO",
  animation_frame='ANO_TRI', 
  color_continuous_scale=px.colors.sequential.Plasma)
fig.update_geos(fitbounds="geojson")
fig.show()

