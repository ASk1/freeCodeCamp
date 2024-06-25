#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z  $1 ]]
then
  echo "Please provide an element as an argument."
  exit;
fi

IS_INT=$($PSQL "SELECT textregexeq('$1','^[[:digit:]]?$') is_int;")
if  [[ "$IS_INT" = " t" ]]
then
  CONDITION="e.atomic_number = $1"
else
  CONDITION="e.name = '$1' OR e.symbol = '$1'"
fi

ELEMENT=$($PSQL "
SELECT 
  e.atomic_number,
  e.name,
  e.symbol,
  t.type,
  p.atomic_mass,
  p.melting_point_celsius,
  p.boiling_point_celsius
FROM elements e
JOIN properties p ON p.atomic_number=e.atomic_number
JOIN types t ON t.type_id=p.type_id
WHERE $CONDITION
;
")

if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
else
  echo "$ELEMENT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
fi
