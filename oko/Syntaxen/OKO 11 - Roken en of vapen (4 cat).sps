* Encoding: UTF-8.


* Aanmaken indicator: % dat nu ≥ wekelijks rookt en/of een vapet, in 4 categorieën.

COMPUTE LBRAK3S23 = 9.
IF (LBRAK3S19 = 0 AND LBGEK3S3 = 0) LBRAK3S23 = 1.
IF (LBRAK3S19 = 1 AND LBGEK3S3 = 0) LBRAK3S23 = 2.
IF (LBRAK3S19 = 0 AND LBGEK3S3 = 1) LBRAK3S23 = 3.
IF (LBRAK3S19 = 1 AND LBGEK3S3 = 1) LBRAK3S23 = 4.
EXECUTE.

VARIABLE LABELS 
  LBRAK3S23 'Wekelijks roken en/of vapen' .
EXECUTE .

VALUE LABELS
  LBRAK3S23 1' Rookt noch vapet wekelijks' 2 'Rookt minimaal wekelijks' 3 'Vapet minimaal wekelijks' 4 'Rookt en vapet minimaal wekelijks' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S23 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S23 (9) .
EXECUTE .

fre LBRAK3S23.

***EINDE SYNTAX

