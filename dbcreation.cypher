// // create Race nodes
// LOAD CSV WITH HEADERS FROM "file:///dnd_race.csv" AS x
// MERGE(:Race {name:x.Race});

// create Class nodes
LOAD CSV WITH HEADERS FROM "file:///dnd_class.csv" AS x
MERGE(:Class {name:x.Class});

// // create Ability nodes
// LOAD CSV WITH HEADERS FROM "file:///dnd_race.csv" AS x
// MERGE(:Ability {name:x.Ability});

// create BonusChoice nodes
MERGE(:BonusChoice);

// create Race nodes except for half-elf which has a choice
LOAD CSV WITH HEADERS FROM "file:///dnd_race.csv" AS x
WITH x
WHERE x.Race <> "Half-Elf"
MERGE(r:Race {name:x.Race})
MERGE(a:Ability {name:x.Ability});
MERGE(r)-[:GRANTSABILITYBONUSTO]->(a);

// create choice node for half-elf
LOAD CSV WITH HEADERS FROM "file:///dnd_race.csv" AS x
WITH x
WHERE x.Race = "Half-Elf"
MERGE(r:Race {name:x.Race})
MERGE(a:Ability {name:x.Ability})
MERGE(r)-[:HASCHOICE]->(:StatBonusChoice);
