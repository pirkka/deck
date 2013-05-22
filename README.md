deck
====

Co working space management system.

TODO
====
- web layoutz
- about-tekstistä puuttuu mission statement, eli mistä oikein on kyse
- onko tausta liian levoton (jäävätkö silmät harhailemaan sinne?) 
  - kontrasti tai patternin suurennus/pienennys voisi auttaa
- fontti: https://twitter.com/tomcrabtree/status/289105678256181249


ENV CONFIG EXAMPLE
==================

Deck uses loads of environment variables as a shortcut. Here's a sample .env file:

RACK_ENV=development
INVOICER_ID=1
CAPACITY=12
VAT=0.24
TOTAL_RENT=2345.34
TOTAL_SERVICES=456.06
CITY=Tampere
POSTCODE=33100
STREET_ADDRESS=Satakunnankatu 30
LAT=61.5012156
LON=23.7661498
IBAN=FI234 1234 12 123
SWIFT=FBANFIHH
INVITE_CODE=lollerisloo (needed for registrations)