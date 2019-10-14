CREATE KEYSPACE db WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

CREATE TABLE IF NOT EXISTS db.crimes (
    INCIDENT_ID int,
    OFFENSE_ID int,
    OFFENSE_CODE int,
    OFFENSE_CODE_EXTENSION int,
    OFFENSE_TYPE_ID varchar,
    OFFENSE_CATEGORY_ID int,
    FIRST_OCCURRENCE_DATE varchar,
    LAST_OCCURRENCE_DATE varchar,
    REPORTED_DATE varchar,
    INCIDENT_ADDRESS varchar,
    GEO_X int,
    GEO_Y int,
    GEO_LON float,
    GEO_LAT float,
    DISTRICT_ID uuid,
    PRECINCT_ID uuid,
    NEIGHBORHOOD_ID varchar,
    IS_CRIME boolean,
    IS_TRAFFIC boolean,
    PRIMARY KEY((INCIDENT_ID))
);