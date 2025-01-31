# DatasetTo23file
Get the raw data of a sample out of a larger dataset in Eigenstrat/Plink format


# Extracting Populations from EIGENSTRAT/PLINK and Converting to 23andMe Format

## 📌 Overview
This repository provides a step-by-step guide and scripts to extract specific populations from a dataset in **EIGENSTRAT format** (`.geno`, `.snp`, `.ind`) and convert them into **23andMe format** using **PLINK**.

## 🚀 Features
- Converts **EIGENSTRAT** to **PLINK binary format** (`.bed/.bim/.fam`)
- Extracts specific populations or individuals
- Converts extracted individuals to **23andMe format**
- Automates the process with shell scripts

## 📥 Requirements
Before you begin, ensure you have:
- **PLINK 1.9+** ➜ [Download Here](https://www.cog-genomics.org/plink/1.9/)
- **EIGENSOFT** ➜ [Download Here](https://github.com/DReichLab/EIG)


## 🔄 Step 1: Convert EIGENSTRAT to PLINK
Create a `convertf_parfile.txt` file with the following content:
```text
genotypename: dataset.geno
snpname: dataset.snp
indivname: dataset.ind
outputformat: PACKEDPED
genotypeoutname: dataset.bed
snpoutname: dataset.bim
indivoutname: dataset.fam
```
Run the conversion:
```bash
convertf -p convertf_parfile.txt
```
After this, you should have:
```
dataset.bed  dataset.bim  dataset.fam
```

## 📌 Step 2: Prepare a List of Individuals to Extract
Extract **FID IID** from `.fam`:
```bash
awk '{print $1, $2}' dataset.fam > samples_to_extract.txt
```
If you only need specific individuals, filter them:
```bash
awk 'NR==FNR{a[$1]; next} $2 in a {print $1, $2}' your_individuals_list.txt dataset.fam > filtered_samples.txt
```

## 🔄 Step 3: Extract and Convert to 23andMe Format
The script `extract_individuals_23andMe.sh` is already included in this repository. Simply run:

### **Run the Script:**
1. **Make it executable**:
   ```bash
   chmod +x extract_individuals_23andMe.sh
   ```
2. **Run the script**:
   ```bash
   ./extract_individuals_23andMe.sh
   ```


## 📂 Output Structure
After running the script, each individual will have a **23andMe-style** file:
```
extracted_samples_23andMe/
├── MAL-005_23andMe.txt
├── MAL-009_23andMe.txt
├── MAL-011_23andMe.txt
└── ...
```

## 🔗 Resources
- **PLINK 1.9 Documentation**: https://www.cog-genomics.org/plink/1.9/
- **EIGENSOFT Documentation**: https://github.com/DReichLab/EIG

## 🤝 Contributions
Feel free to **open issues or pull requests** to improve this repository! 🚀

---
Happy Genotyping! 🧬



