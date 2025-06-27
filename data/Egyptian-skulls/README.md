# **Thomson & Randall-MacIver's 1905 Comparative Craniometric Data on Ancient Egyptian Skulls**

## Description

This repository contains data sets with measurements of male and female Egyptian skulls originally collected and published by Arthur Thomson and D. Randall-MacIver in their 1905 work, *Ancient Races of the Thebaid - Being an Anthropometrical Study of the Inhabitants of Upper Egypt From the Earliest Prehistoric Times to the Mohammedan Conquest Based Upon the Examination of Over 1,500 Crania.*

## Files

- `Thomson_Randall-MacIver_1905.csv`: The complete dataset compiled from the 32 original tables reporting absolute skull measurements. This comma-separated values (CSV) file contains 1,565 rows and 23 columns.

- `skull_cap_partial_wide.csv`: A wide-format dataset containing estimated cranial capacities of male and female skulls based on Thomson and Randall-MacIver’s measurements.

- `./appendix_csvs/`: A directory containing individual CSV files for each of the 32 measurement tables.

- `./data_gen/`: A directory containing the R code used to generate and process the data files.

- `./table_imgs/`: A directory of photographs for each of the original 32 tables.

## Format

**table**

- The original table number from which the data were sourced.

**start_date**

- The beginning (earliest year) of the estimated historical date range, expressed as an integer for sorting. Negative values represent years BC (Before Christ [sic] Era). See Details below.

**end_date**

- The end (latest year) of the estimated historical date range. Expressed as an integer for sorting. Negative values represent years BC (Before Christ [sic] Era). See Details below.

**start_era**

- The calendar era corresponding to `start_date`.

**end_era**

- The calendar era corresponding to `end_date`.

**dynasty**

- The dynastic period of ancient Egypt with which Thomson and Randall-MacIver associated the skull.

**location**

- The archaeological site where the skull was recovered.

**sex**

- The presumed sex of the individual (male or female), as recorded by Thomson and Randall-MacIver (1905). See 'Details'.

**gol**

- Glabello-Occipital Length in millimetres.

**ool**

- Ophryo-Occipital Length in millimetres.

**bbh**

- Basi-Bregmatic Height in millimetres.

**mb**

- Maximum Breadth in millimetres.

**biaurb**

- Biauricular Breadth in millimetres.

**bizygb**

- Bizygomatic Breadth in millimetres.

**bnl**

- Basi-Nasal Length in millimetres.

**bal**

- Basi-Aveolar Length in millimetres.

**nah**

- Nasi-Alveolar Height in millimetres.

**nh**

- Nasal Height in millimetres.

**nw**

- Nasal Width in millimetres.

**fai**

- Flower’s Alveolar Index in millimetres.

**ga**

- Gnathic Angle.

**po**

- Prognathism or Orthognathism.

**cc**

- Estimated Cranial Capacity. See 'Details.'

## Details

This dataset was compiled from an original copy of Thomson and Randall-MacIver’s 1905 *Ancient Races of the Thebaid*, generously made available on loan by the University of Washington Library. Sincere thanks to the library staff for facilitating access to this important source.

Optical character recognition (OCR) was used to digitize the 32 measurement tables. The resulting text was then carefully reviewed and manually corrected to address recognition errors. However, some errors may remain. Notably, Thomson and Randall-MacIver report having examined 1,561 skulls, while the present dataset includes 1,565 entries, suggesting minor discrepancies that may reflect either transcription or original tabulation inconsistencies.

Start and end dates are based on the historical ranges reported by Thomson and Randall-MacIver and may not reflect current scholarly consensus in Egyptology. In cases where complete date ranges were not provided—such as the missing end date for the Fourth Dynasty, the missing start date for the Fifth Dynasty, and the absence of any range for the Thirtieth Dynasty—dates have been supplemented using W. M. F. Petrie’s *A History of Egypt* series (1894; 1905), which the original authors also used as a reference.

No absolute dates were available for the early and late predynastic periods. As Thomson and Randall-MacIver note, "it was impossible to establish a reckoning in years for the several stages of civilization which is earlier than the first recorded date..." Instead, they adopted a relative chronological scale for these periods. Because this scale is not directly comparable to the conventional date ranges used elsewhere in the dataset, it has been omitted.

Sex designations may have been based on skeletal features, burial context, or associated artifacts. The criteria used do not seem to be specified, and interpretations reflect 19th-century archaeological practices, which may not align with modern standards. As such, these classifications should be treated with prudence.

Due to the fragile nature of the specimens, Thomson and Randall-MacIver note that cranial capacity was estimated with the following calculation from Topinard's *Anthropology*:

$$\frac{\text{Max. length} \times \text{Max. Breadth} \times \text{Basi-bregmatic Height}}{2} \div 1175$$

Although units are not explicitly stated, the scale of the values suggests they are intended to represent cubic centimetres.

For further explanation of the remaining measurements, see Thomson and Randall-MacIver (1905).

It is important to emphasize that Thomson and Randall-MacIver’s work reflects 19th-century anthropological standards and assumptions, which differ substantially from contemporary knowledge and best practices. Users should be mindful of this historical context and remain aware of potential biases or limitations in the sampling strategies, measurement techniques, and interpretive frameworks used in the original study.

## References

Petrie, W. M. F. (1894). *A history of Egypt from the earliest times to the XVIth dynasty*. Methuen & Co. 

Petrie, W. M. F. (1905). *A history of Egypt from the XIXth to the XXXth dynasties*. Methuen & Co.

Thomson, A., & Randall-MacIver, D. (1905). *Ancient races of the Thebaid*. Clarendon Press.

## Citation

If you use this dataset in your research, teaching, or publications, please cite the repository as follows:

### APA-style citation:

Pisklak, J. (2025). *Thomson & Randall-MacIver's 1905 comparative craniometric data on ancient Egyptian skulls* [Data set]. GitHub. https://github.com/statistical-grimoire/book/tree/main/data/Egyptian-skulls

### BibTeX

```bibtex
@online{ ,
  author       = {Pisklak, Jeffrey M.},
  title        = {Thomson \& {Randall}-{MacIver}'s 1905 Comparative Craniometric Data on Ancient {Egyptian} Skulls},
  year         = {2025},
  organization = {GitHub},
  url          = {https://github.com/statistical-grimoire/book/tree/main/data/Egyptian-skulls},
  note         = {Data set}
}
```

Please also cite the original source of the data:

```bibtex
@book{ ,
  author    = {Thomson, Arthur and Randall-MacIver, D.},
  title     = {Ancient Races of the {Thebaid}: Being an Anthropometrical Study of the Inhabitants of {Upper} {Egypt} From the Earliest Prehistoric Times to the {Mohammedan} Conquest Based Upon the Examination of Over 1,500 Crania},
  year      = {1905},
  publisher = {Clarendon Press}
}
```






