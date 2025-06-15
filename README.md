---

# MultiGENN: multiplex graph ensemble neural network for plasma proteomic profiling of neurodegenerative biomarkers

---

## Abstract
Neurodegeneration involves complex biological processes, with the resulting diseases classified according to different pathogenesis, highlighting the need for precise identification of neuropathological features for effective diagnosis. Recently, plasma biomarkers have emerged as cost-effective and minimally invasive tools for identifying neuropathological features, with their diagnostic potential further enhanced by the application of machine learning (ML) techniques. However, existing ML-based approaches primarily focus on analyzing the independent effect of proteins, often neglecting the synergetic effect arising from protein-protein interactions (PPIs) and failing to account for the diverse roles of different PPI types. This limitation hinders diagnostic accuracy and reduces the depth of biological insights into disease mechanisms. In this study, we propose MultiGENN, a novel ML-based method designed for plasma proteomic profiling of neurodegenerative biomarkers. MultiGENN captures the synergetic effects induced by interactions between proteins, reflecting the global properties of PPIs, and integrates physical, functional, and regulatory PPIs to utilize diverse synergetic effects between proteins, providing a multifaceted reflection of the biological properties associated with disease mechanisms in neurodegeneration. Experimental results on the UK Biobank cohort demonstrated that MultiGENN achieves a 7.1% higher performance across key metrics compared to existing ML-based approaches. Importantly, MultiGENN identified key biomarkers, such as NEFL and GFAP, while demonstrating the added value of integrating multiple PPI networks for improved predictive accuracy. Longitudinal analyses further revealed that MultiGENN effectively predicts disease progression, highlighting its potential for early diagnosis.

<b>Keywords</b>: Neurodegenerative diseases; Blood-based biomarkers; Protein-protein interactions; Multiplex graph ensemble; Graph neural network; Plasma proteomic profiling.

![Image](https://github.com/user-attachments/assets/6e0c0258-f663-43c2-957a-707f30cf7e80)

---

## Data description

### Study participants
The dataset used in this study was sourced from the UK Biobank (UKB), which recruited over 500,000 participants aged 39–70 between 2006 and 2010, with long-term monitoring of their health outcomes (additional details can be at: https://biobank.ndph.ox.ac.uk/showcase/). From the UKB participants, 906 individuals with complete data on four neurodegenerative biomarkers (Aβ42/40, GFAP, NfL, and pTau181) were selected for the analytical cohort. Given that higher levels of GFAP, NfL, and pTau indicate increased risk, while lower levels of Aβ42/40 signify greater risk, the reciprocal of Aβ42/40 (Aβ40/42) was used in this study to maintain consistency in predictions. For each participant, the positivity and negativity for the biomarkers were determined using the ‘cutoff’ implemented in R (https://github.com/choisy/cutoff). Of the participants, 783 had follow-up data on the biomarkers, with an average follow-up duration of 3.25 years, enabling the assessment of longitudinal changes. The demographic characteristics of the study participants are presented as below.

|      Characteristics     | Total participants (N=906) | Follow-up participants (N=783) |            |          |
|:------------------------:|:--------------------------:|:------------------------------:|:----------:|:--------:|
|                          |                            |            Baseline            |  Follow-up | P-value* |
|      Female, No. (%)     |         491 (54.2)         |          422   (53.9)          |            |     –    |
|   Education, med. (IQR)  |          7 (3–17)          |           7   (3–17)           |            |     –    |
|    Age, med. (IQR), yr   |         58 (54–64)         |           58 (53–64)           | 61 (57–67) |  <0.0001 |
|  Aβ-positivity, No. (%)  |         192 (21.2)         |           162 (20.7)           | 265 (33.8) |  <0.0001 |
| GFAP-positivity, No. (%) |         175 (19.3)         |           155 (19.8)           | 205 (26.2) |  0.0027  |
|  NfL-positivity, No. (%) |         227 (25.1)         |           189 (24.1)           | 236 (30.1) |  0.0075  |
| pTau-positivity, No. (%) |         212 (23.4)         |           182 (23.2)           | 163 (20.8) |   0.247  |

### Plasma samples
The plasma samples of participants were profiled by the Olink Platform, where 1,463 proteins were totally assayed (further details can be found at: https://olink.com/). For the initial data for protein expression, proteins with a missing frequency greater than 5% were excluded, and missing values were estimated using the k-nearest neighbor method. Subsequently, protein expression levels were standardized through Z-score normalization and then scaled using the logistic function.

---

### Code description

<b>MATLAB (version R2024b)</b>
- <b>Software</b>
  - MATLAB (version R2024b)

- <b>Main code</b>
  - MultiGENN

- <b>Data setting</b>
  - Xdata: independent effect of target proteins
  - Ydata: real diagnosis label set for biomarkers
  - Split two data into train/valid/test sets

- <b>Parameter setting</b>
  - Uppi: propagation parameter
  - Babt, Bgfa, Bnfl, Btau: estimation parameters

- <b>Model parameter</b>
  - epoch: maximum number of epoch
  - rate: learning rate
  - gamma: regularization coefficient

- <b>Model implementation</b>
  - Model training
  - Risk estimation

---
