CREATE KEYSPACE db WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

CREATE TABLE IF NOT EXISTS db.crimes (
    INCIDENT_ID varchar,
    OFFENSE_ID varchar,
    OFFENSE_CODE varchar,
    OFFENSE_CODE_EXTENSION varchar,
    OFFENSE_TYPE_ID varchar,
    OFFENSE_CATEGORY_ID varchar,
    FIRST_OCCURRENCE_DATE varchar,
    LAST_OCCURRENCE_DATE varchar,
    REPORTED_DATE varchar,
    INCIDENT_ADDRESS varchar,
    GEO_X varchar,
    GEO_Y varchar,
    GEO_LON varchar,
    GEO_LAT varchar,
    DISTRICT_ID varchar,
    PRECINCT_ID varchar,
    NEIGHBORHOOD_ID varchar,
    IS_CRIME varchar,
    IS_TRAFFIC varchar,
    UUID uuid,
    PRIMARY KEY((ID))
);