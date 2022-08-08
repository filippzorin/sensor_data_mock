To start services run `docker-compose up`

Web UI:
* Sensor API: http://localhost:8000/sensor_data/
* NiFI: http://localhost:9090/nifi/
* NiFi Registry: http://localhost:19090/nifi-registry/
* Clickhouse Tabix UI: http://localhost:8080/

Check gathered data
* Open Clichouse Tabix UI
* Run query 
	```
	SELECT * FROM default.consumer
	LIMIT 100
	```