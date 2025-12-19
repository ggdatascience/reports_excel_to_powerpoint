* Encoding: UTF-8.

*Databestand openen.
GET
  FILE='padnaam'.
EXECUTE.
DATASET NAME OKO2025 WINDOW=FRONT.

*Syntaxen uitvoeren.
CD 'padnaam'.
INSERT file='01 - Opleiding kind-1219-vragenlijst-kind [4].sps'.
INSERT file='02 - Leeftijd-1219-vragenlijst-kind [5].sps'.
INSERT file='03 - Gender-1219-vragenlijst-kind [2].sps'.
INSERT file='04 - Geografische indicator-1219-vragenlijst-kind [6].sps'.
INSERT file='07 - Ervaren gezondheid-1219-vragenlijst-kind [2].sps'.
INSERT file='08 - Geluk-1219-vragenlijst-kind [1].sps'.
INSERT file='09 - Psychische klachten-WHO-5-12-19-jarigen[2].sps'.
INSERT file='12 - Eenzaamheid-1219-vragenlijst-kind [2].sps'.
INSERT file='14 - Functioneren school-1219-vragenlijst-kind [2] - OKO 2025.sps'
INSERT file='15 - Bewegen-1219-vragenlijst-kind _7.0_.sps'.
INSERT file='16 - Stress-1219-vragenlijst-kind [1].sps'.
INSERT file='18 - Pesten op school en of online -1219-vragenlijst-kind [4].sps'.
INSERT file='20a - Alcoholgebruik-1219-vragenlijst-kind-basis [3].sps'.
INSERT file='20b - Alcoholgebruik binge en aangeschoten-1219-vragenlijst-kind [4].sps'.
INSERT file='GMJ2023_Alcohol 4 wkn zonder slokjes_aanvulling basis.sps'.
INSERT file='21 - Roken -1219-vragenlijst-kind [3.3].sps'.
INSERT file='22 - Gebruik wiet of hasj-12-19-jarigen [4].sps'.
INSERT file='23 - Sociale steun-12-19-jarigen [2.1].sps'.
INSERT file='24 - Weerbaarheid-1219-vragenlijst-kind [4](2).sps'.
INSERT file='26 - Social media gebruik-12-19-jarigen.sps'.
INSERT file='27 - Gamen-1219-vragenlijst-kind [7].sps'.
INSERT file='OKO 01 - Thuis.sps'.
INSERT file='OKO 02 - Thuis na 22 uur.sps'.
INSERT file='OKO 03 - Chillen met vrienden.sps'.
INSERT file='OKO 04 - School.sps'.
INSERT file='OKO 05 - Vrije tijd.sps'.
INSERT file='OKO 06 - Locatie alcohol.sps'.
INSERT file='OKO 07 - Verkrijgen alcohol.sps'.
INSERT file='OKO 08 - Houding ouders alcohol[2].sps'.
INSERT file='OKO 09 - Vrienden alcohol roken vapen drugs.sps'.
INSERT file='OKO 10 - Houding ouders roken en vapen.sps'.
INSERT file='OKO 11 - Roken en of vapen (4 cat).sps'.
INSERT file='OKO 12 - Overig druggebruik.sps'.

*Eindbestand opslaan.
SAVE OUTFILE='padnaam' 
  /COMPRESSED.
