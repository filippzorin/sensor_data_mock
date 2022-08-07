  CREATE TABLE IF NOT EXISTS default.sensor_data (
    sensor_id String,
    timestamp DateTime64(6),
    param_0 Float32,
    param_1 Float32,
    param_2 Float32,
    param_3 Float32,
    param_4 Float32
  ) ENGINE = Kafka SETTINGS kafka_broker_list = 'kafka:9092',
                            kafka_topic_list = 'sensor_data',
                            kafka_group_name = 'group1',
                            kafka_format = 'JSONEachRow';

CREATE TABLE IF NOT EXISTS default.view (
    sensor_id String,
    timestamp DateTime64(6),
    param_0 Float32,
    param_1 Float32,
    param_2 Float32,
    param_3 Float32,
    param_4 Float32
) ENGINE = MergeTree()
ORDER BY (sensor_id, timestamp);


CREATE MATERIALIZED VIEW IF NOT EXISTS default.consumer TO default.view (
    sensor_id String,
    timestamp DateTime64(6),
    param_0 Float32,
    param_1 Float32,
    param_2 Float32,
    param_3 Float32,
    param_4 Float32
) AS
SELECT
  *
FROM
  default.sensor_data;
