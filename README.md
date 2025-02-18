# Constellation_of_RIs
Data and scripts containing statistical analyses from "A constellation of dysfunctional hybrid phenotypes enforces reproductive isolation between Caenorhabditis nematode species".
## Description of the data and file structure

Data from the assortative mating assay, ectopic sperm migration assay, spermatid morphology measurments (spermatid area, spermatid roundness, spermatid circularity and spermatid number) and hybrid male tail defect experiment. Statistical analysis of each dataset in R (R Scripts). 

### Files and variables

#### File: assortative\_mating\_data.xlsx

**Description:** Choice mating data and conspecific control mating data. 

##### Variables

* **Choice mating datasheet:**
  * **block:** refers to measurments taken in the same day/sitting.
  * **plate:** mating plate containing scored females.
  * **plate_type:** indicates which species were dyed on mating plate. A-  *C. latens* males dyed with MitoTracker and *C. remanei* females dyed with CellTracker, B - *C. remanei* males dyed with MitoTracker and *C. latens* females dyed with CellTracker.
  * **cross_type:** indicates whether the dyed male species was conspecific or heterospecific to the scored females in a given row.
  * **cross:** F1A (*C. remanei* females mating with *C. latens* males), F1B (*C. latens* females mating with *C. remanei* males), VX88 (*C. latens* conspecific mating). VX3 (*C. remanei* conspecific mating).
  * **dyed_male:** indicates which species of male was dyed with MitoTracker on the mating plate.
  * **female:** indicates species of female being scored.
  * **dyed_female:** indicates which species of female was dyed with CellTracker on the mating plate.
  * **yessperm:** number of females (of species specified in "female" column) containing fluorescent sperm after mating period.
  *  **nosperm:** number of females (of species specified in "female" column) that did not contain fluorescent sperm after mating period.
* **Conspecific control variables:**
  * **species:** species identity in conspecific mating,
  * **rep:** mating plate identity, total_fem- total females present on the mating plate, 
  * **num_with_sperm:** number of females containing fluoresent sperm after mating period.

#### File: ectopic\_sperm\_migration\_datasheet.xlsx

**Description:** Data from ectopic sperm migration assay.

##### Variables

* **date:** day on which assay was performed
* **replicate:** indicates which matings were performed on the same petri dish. 
* **plate:** identifyer that includes the replicate number and the cross.
* **cross_type:** indicates whether females underwent heterospecific matings (hybrid) or conspecific matings.
* **cross:** indicates which species were mating. F1A (*C. remanei* females mating with *C. latens* males), F1B (*C. latens* females mating with *C. remanei* males), VX88 (*C. latens* conspecific mating). VX3 (*C. remanei* conspecific mating).
* **female_strain:** strain of individual female being scored (VX88- *C. latens*, VX3- *C. remanei*).
* **male_strain:** strain of males present on mating plate with female of interest (VX88- *C. latens*, VX3- *C. remanei*).
* **sperm_present:** indicates whether fluorescent sperm was visible anywhere in the body of the female.
* **uterus:** indicates whether fluorescent sperm was visible in the female's uterus.
* **gonads:** indicates whether fluorescent sperm was visible in the female's gonads.
* **soma:** indicates whether fluorescent sperm was visible in the female's somatic (non-reproductive) tissue(s).
* **invasion_severity:** estimate of ectopic sperm number (sperm present in the gonads and/or soma). None = no ectopic sperm, mild =1-10 ectopic sperm, moderate = 11-5- ectopic sperm, severe = 51+ ectopic sperm. 
* **mating_time:** number of hours of mating opportunity.
* **invasion_time:** number of hours that female was present on petri dish not containing males after mating.


#### File: hybrid\_fertility\_data.xlsx

**Description:** Data on fertility, gonad morphology and spermatid presence/absence for *C. remanei-latens* F1 male hybrids.

#### Variables 

* **group:** indicates identity of female that produced the F1 male.
* **fertile** indicates whether the F1 male is fertile ("Y") or sterile ("N")
* **normal_gonad** indicates whether the F1 male has a normal gonad ("Y") or a deformed gonad ("N").
* **severity** indicates whether gonad deformities are mild ("M") or severe ("S"). F1 males that have normal gonads are listed as "na" in this column.
*  **sperm_present** indicates whether sperm is present ("Y") or absent ("N") in the F1 hybrid male.


#### File: tail\_defect\_datasheet.xlsx

**Description:** Data from tail defect assay. Details nature of tail defects in pure species and hybrid F1 males. 

##### Variables

* **block:** groups individuals that were evaluated on the same day.
* **parental_cross:** identity of species in parental cross. For heterospecific crosses, female species is listed first and indicated with "F" while male species is labelled "M".
* **defect:** indicates whether individual contained at least one tail defect.
* **fused_rays:** indicates whether individual had one or more fused rays.
* **missing_rays:** indicates whether individual had one or more missing rays.
* **deformed_fan:** indicates whether fan shape is abnormal.
* **deformed_tailbody:** indicates whether tail tip is abnormally shaped.
* **cuticle_intact:** indicates whether cuticle is present.
* **asymmetric:** indicates whether tail appears asymmetric due to abnormalities.
* **other_defect:** indicates whether any other tail defects were present that do not fall into another category.
* **total_number:** indicates the total number of defects for the individual (if there is a "yes" in a category, that is counted as 1 defect). 

#### File: spermatid\_morphology\_data.xlsx

**Description:** Data from spermatid morphology assays (spermatid area, circularity and roundness) and data from spermatid number assay.

##### Variables

* **Spermatid area datasheet:**
  * **parental_cross:** indicates identity of parental species (F1A- *C. remanei* females mating with *C. latens* males, F1B- *C. latens* females mating with *C. remanei* males, VX88- *C. latens* conspecific mating, VX3- *C. remanei* conspecific mating).
  * **worm:** unique identifier for each individual.
  * **group:** indicates which individuals resulted from matings on the same petri dish.
  * **sperm_id:** unique identifier for each sperm cell.
  * **areapixel:** spermatid area measurment in pixels.
  * **area_um:** spermatid area measurment in um^2. 
* **Spermatid circ + roundness datasheet:**
  * **parental_cross:** indicates identity of parental species (F1A- *C. remanei* females mating with *C. latens* males, F1B- *C. latens* females mating with *C. remanei* males, VX88- *C. latens* conspecific mating, VX3- *C. remanei* conspecific mating). 
  * **worm:** unique identifier for each individual. 
  * **sperm_id:** unique identifier for each sperm cell.
  * **circularity:** calculated using the following formula: (4area)/(pi(maxjor axis length)^2).
  * **roundness:** calculated using the following formula: (4***pi***area)/(perimeter^2).
* **Spermatid number datasheet:** 
  * **cross_type:** indicates whether females underwent heterospecific matings (hybrid) or conspecific matings.
  * **parental_cross:** indicates identity of parental species (F1A- *C. remanei* females mating with *C. latens* males, F1B- *C. latens* females mating with *C. remanei* males, VX88- *C. latens* conspecific mating, VX3- *C. remanei* conspecific mating).
  * **worm_id:** unique identifier for each individual.
  * **sperm_number:** total number of sperm observed from the given individual.

## Code/software

All code is written in R. Necessary packages are listed at the top of each script.
