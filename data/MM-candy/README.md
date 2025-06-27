# Josh Madison M&M Milk Chocolate Color Counts Dataset

## Description

This repository contains a dataset on the colour distribution of M&M Milk Chocolate candies based on data originally published by Josh Madison. The data were extracted and compiled from his December 2, 2007 blog post, *M&M’s Color Distribution Analysis*, into a structured CSV format for reuse and analysis.

## Files

- `MM_Madison_wide.csv`: A comma-separated values (CSV) file with 48 rows and 9 columns, representing individual M&M packages and colour counts compiled from Josh Madison’s blog post.

## Format

Each row represents one M&M package. The dataset includes the following variables:

- **pkg**
    — Package identifier (1–48). Each corresponds to a single M&M package sampled from one 48-pack case.
  
- **weight_oz**
    - Weight of the package in ounces.

- **year**
    — Year in which the data were collected.

- **blue**, **brown**, **green**, **orange**, **red**, **yellow**
    — Count of M&Ms of each respective colour in the package.

## Source

Josh Madison’s original blog post:  
https://joshmadison.com/2007/12/02/mms-color-distribution-analysis/

## Citation

If you use this dataset, please cite the original source and this repository as follows:

### Original blog post

Madison, J. (2007, December 2). *M&M’s Color Distribution Analysis* [Blog post]. https://joshmadison.com/2007/12/02/mms-color-distribution-analysis/

```bibtex
@online{ ,
  author       = {Madison, Josh},
  year         = {2007},
  month        = {dec},
  title        = {{M\&M}'s Color Distribution Analysis},
  note         = {Blog post},
  url          = {https://joshmadison.com/2007/12/02/mms-color-distribution-analysis/}
}
```

### Dataset repository

Madison, J. (2025). *Josh Madison M&M Milk Chocolate Color Counts Dataset* [Data set]. GitHub. https://github.com/statistical-grimoire/book/tree/main/data/MM-candy

```bibtex
@online{ ,
  author       = {Pisklak, Jeffrey M.},
  title        = {Josh Madison {M\&M} Milk Chocolate Color Counts Dataset},
  year         = {2025},
  organization = {GitHub},
  url          = {https://github.com/statistical-grimoire/book/tree/main/data/MM-candy},
  note         = {Data set}
}
```

