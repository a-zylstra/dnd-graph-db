// create race nodes
LOAD CSV WITH HEADERS FROM "file:///dnd_race.csv" AS x
MERGE(r:Race {name:x.Race});