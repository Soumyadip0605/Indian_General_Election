copy States
from 'C:\DA\states.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';


copy partywise_results
from 'C:\DA\partywise_results.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';


copy statewise_results
from 'C:\DA\statewise_results.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

copy constituencywise_results
from 'C:\DA\constituencywise_results.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

copy constituencywise_details
from 'C:\DA\constituencywise_details.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

