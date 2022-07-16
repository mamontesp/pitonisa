Bienvenido al proyecto pitonisa. Un ambiente de desarrollo de modelos estadisticos para estimar la demanda de servicios TIC en Colombia

### ¿Cómo configurar mi ambiente local?
Configuración probada en SO Linux Mint 20

- Clonar este repositorio 
- Instalar Docker
- Ejecutar desde la raíz de este repositorio
`
docker compose up postgres
`

- Conectarse a postgres con algún cliente de postgres. Para psql usar este comando:
`
psql -h 0.0.0.0 -U postgres
`

- Descargar el repositorio de airbyte https://github.com/airbytehq/airbyte y levantar el servicio:

`git clone https://github.com/airbytehq/airbyte.git

cd airbyte

docker-compose up
`
- Ir a la sección de settings en Airbyte (tuerca, lateral derecha abajo). 
- Ir a Configuration
- Click en import configuration
- Seleccionar el archivo config_airbyte.gz ubicado en la raíz de este repositorio.
- Esperar a que la página se refresque
- Ir a connections, barra lateral derecha
- Verificar que existan 9 conexiones (subscribers_tv es una de ellas)
- Correr las conexiones si es que no se están ejecutando.
- Una vez las conexiones hayan concluido su ejecución. verificar que las tablas se crearon en postgres en el esquema raw
`_airbyte_raw_fixed_internet_2010_2017                 
_airbyte_raw_fixed_internet_2017_2022                 
_airbyte_raw_fixed_internet_income                    
_airbyte_raw_local_telephone_lines                    
_airbyte_raw_subscribers_internet_mobile              
_airbyte_raw_subscribers_internet_mobile_fixed_charge 
_airbyte_raw_subscribers_tv                           
_airbyte_raw_subscribers_voice_mobile                 
_airbyte_raw_traffic_messaging_mobile
`

- Crear un ambiente virtual de python
`python3 -m venv /env`

- Habilita el ambiente virtual
`source env/bin/activate`

- Instalar las dependencias del proyecto. Asegurarse de estar en la raíz del proyecto
`pip install -r requirements.txt`

- Para correr las primeras transformaciones ejecuta el siguiente comando:
`dbt run --models dwh_stg`

- Verifica que las siguientes tablas existan en el esquema dwh_stg
`fixed_internet_2010_2017                
 fixed_internet_2017_2022                
 fixed_internet_income                   
 local_telephone_lines                   
 subscribers_internet_mobile             
 subscribers_internet_mobile_fixed_charge
 subscribers_tv                          
 subscribers_voice_mobile                
 traffic_messaging_mobile`




### Recursos:
- Definición de los términos de la convocatoria [aquí](https://postdata.gov.co/datajam-crc-2022)

