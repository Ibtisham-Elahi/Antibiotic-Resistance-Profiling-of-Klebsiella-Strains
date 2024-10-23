## Antibiotic-Resistance-Profiling-of-Klebsiella-Strains
# In this project i used various packages make sure you install them
# I collected the reference sequences of five strains of Klebsiella 

path <- "C:/Klebsiella_AMR_Project/data"
fasta_files <- list.files(path, pattern = "\\.fasta$", full.names = TRUE)
print(fasta_files)

# now its time to check the integrity of each file

library(Biostrings)
fasta_files <- list.files("C:/Klebsiella_AMR_Project/data", pattern = "\\.fasta$", full.names = TRUE)
genomes <- lapply(fasta_files, readDNAStringSet)
names(genomes) <- gsub("\\.fasta$", "", basename(fasta_files))
genome_lengths <- sapply(genomes, length)
print(genome_lengths)

# I performed DTU ResFinder and download Phenotype and tab separated files in txt format

path <- "C:/Klebsiella_AMR_Project/results"
txt_files <- list.files(path, pattern = "\\.txt$", full.names = TRUE)
print(txt_files)

## most important task now,
# Make sure name each file according to strain followed by tab separated file are amr results and pheno table 
# I used the data in phenotype and amr results to plot a bar graph to visualise the status of each antibiotic, either this strain is resistant or not
# for the 1st strain

library(ggplot2)

phenotype_table_path_baa2146 <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_strain_ATCC_BAA-2146_pheno_table.txt"
phenotype_table_baa2146 <- read.table(phenotype_table_path_baa2146, header = TRUE, sep = "\t", stringsAsFactors = FALSE)

phenotype_plot_data_baa2146 <- subset(phenotype_table_baa2146, select = c("gentamicin", "No.resistance"))

colnames(phenotype_plot_data_baa2146)[2] <- "Resistant"

plot_baa2146 <- ggplot(phenotype_plot_data_baa2146, aes(x = gentamicin, fill = Resistant)) +
  geom_bar(position = "dodge", stat = "count", width = 0.7) +  # Adjust bar width
  labs(x = "Antibiotics", y = "Count", title = "Resistance Distribution for Antibiotics (First Strain)") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),  # Increase text size and angle for x-axis labels
    axis.title = element_text(size = 14),  # Increase size of axis titles
    plot.title = element_text(size = 16, hjust = 0.5)  # Center and increase title size
  )

print(plot_baa2146)

ggsave(file.path("C:/Klebsiella_AMR_Project/visualizations", "Resistance_Distribution_Klebsiella_BAA-2146.png"), 
       plot_baa2146, width = 10, height = 6, units = "in")

# for the 2nd strain

library(ggplot2)
phenotype_table_path_qd23 <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_strain_QD23_pheno_table.txt"
amr_results_path_qd23 <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_strain_QD23Res_Finder_results_tab.txt"

phenotype_table_qd23 <- read.table(phenotype_table_path_qd23, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

phenotype_plot_data_qd23 <- subset(phenotype_table_qd23, select = c("gentamicin", "Resistant"))

colnames(phenotype_plot_data_qd23)[2] <- "Resistant"

plot_qd23 <- ggplot(phenotype_plot_data_qd23, aes(x = gentamicin, fill = Resistant)) +
  geom_bar(position = "dodge", stat = "count", width = 0.7) +  # Adjust bar width
  labs(x = "Antibiotics", y = "Count", title = "Resistance Distribution for Antibiotics (Second Strain)") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),  # Increase text size and angle for x-axis labels
    axis.title = element_text(size = 14),  # Increase size of axis titles
    plot.title = element_text(size = 16, hjust = 0.5)  # Center and increase title size
  )

print(plot_qd23)

ggsave(file.path("C:/Klebsiella_AMR_Project/visualizations", "Resistance_Distribution_Klebsiella_QD23.png"), 
       plot_qd23, width = 10, height = 6, units = "in")

# for the 3rd strain

library(ggplot2)

phenotype_table_path_third_strain <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_subsp._pneumoniae_HS11286_pheno_table.txt"
amr_results_path_third_strain <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_subsp._pneumoniae_HS11286_ResFinder_results_tab.txt"

phenotype_table_third_strain <- read.table(phenotype_table_path_third_strain, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

amr_results_third_strain <- read.table(amr_results_path_third_strain, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

phenotype_plot_data_third <- subset(phenotype_table_third_strain, select = c("gentamicin", "No.resistance"))

colnames(phenotype_plot_data_third) <- c("Antibiotics", "Resistance")

plot_third <- ggplot(phenotype_plot_data_third, aes(x = Antibiotics, fill = Resistance)) +
  geom_bar(position = "dodge", stat = "count") +
  labs(x = "Antibiotics", y = "Count", title = "Resistance Distribution for Antibiotics (Third Strain)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10))

print(plot_third)

ggsave(file.path("C:/Klebsiella_AMR_Project/visualizations", "Resistance_Distribution_Klebsiella_HS11286.png"), 
       plot_third, width = 10, height = 6, units = "in")

# for the 4th strain 

library(ggplot2)

phenotype_table_path_fourth <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_subsp._pneumoniae_NTUH-K2044_pheno_table.txt"
amr_results_path_fourth <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_subsp._pneumoniae_NTUH-K2044_ResFinder_results_tab.txt"

phenotype_table_fourth <- read.table(phenotype_table_path_fourth, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

amr_results_fourth <- read.table(amr_results_path_fourth, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

phenotype_plot_data_fourth <- subset(phenotype_table_fourth, select = c("gentamicin", "No.resistance"))

colnames(phenotype_plot_data_fourth) <- c("Antibiotics", "Resistance")

plot_fourth <- ggplot(phenotype_plot_data_fourth, aes(x = Antibiotics, fill = Resistance)) +
  geom_bar(position = "dodge", stat = "count") +
  labs(x = "Antibiotics", y = "Count", title = "Resistance Distribution for Antibiotics (Fourth Strain)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10))  # Rotate labels and adjust size

print(plot_fourth)

ggsave(file.path("C:/Klebsiella_AMR_Project/visualizations", "Resistance_Distribution_Klebsiella_NTUH-K2044.png"), 
       plot_fourth, width = 10, height = 6, units = "in")

#for the 5th strain

library(ggplot2)

phenotype_table_path_fifth <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_subsp._rhinoscleromatis_stra_Zzj1txr_pheno_table.txt"
amr_results_path_fifth <- "C:/Klebsiella_AMR_Project/results/Klebsiella_pneumoniae_subsp._rhinoscleromatis_stra_Zzj1txr_ResFinder_results_tab.txt"

phenotype_table_fifth <- read.table(phenotype_table_path_fifth, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

amr_results_fifth <- read.table(amr_results_path_fifth, header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

phenotype_plot_data_fifth <- subset(phenotype_table_fifth, select = c("gentamicin", "No.resistance"))

colnames(phenotype_plot_data_fifth) <- c("Antibiotics", "Resistance")

plot_fifth <- ggplot(phenotype_plot_data_fifth, aes(x = Antibiotics, fill = Resistance)) +
  geom_bar(position = "dodge", stat = "count") +
  labs(x = "Antibiotics", y = "Count", title = "Resistance Distribution for Antibiotics (Fifth Strain)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10))  # Rotate labels and adjust size

print(plot_fifth)

ggsave(file.path("C:/Klebsiella_AMR_Project/visualizations", "Resistance_Distribution_Klebsiella_rhinoscleromatis_Zzj1txr.png"), 
       plot_fifth, width = 10, height = 6, units = "in")

## The first strain is resistant to the most antibiotic, now i used those antibiotics and compare them with the other strains


library(ggplot2)
library(reshape2)

resistance_data <- data.frame(
  Antimicrobial = c("Gentamicin", "Ciprofloxacin", "Amoxicillin", "Piperacillin", 
                    "Trimethoprim", "Chloramphenicol", "Fosfomycin"),
  Strain1 = c("NR", "R", "R", "R", "R", "R", "R"),
  Strain2 = c("R", "NR", "R", "NR", "NR", "NR", "R"),
  Strain3 = c("NR", "R", "NR", "NR", "R", "NR", "NR"),
  Strain4 = c("R", "NR", "R", "R", "R", "R", "R"),
  Strain5 = c("NR", "R", "NR", "R", "NR", "R", "NR")
)

plot_data <- melt(resistance_data, id.vars = "Antimicrobial",
                  variable.name = "Strain", value.name = "Resistance")

plot_data$Resistance <- factor(plot_data$Resistance, levels = c("R", "NR"), labels = c("Resistant", "Not Resistant"))

plot_data$Strain <- factor(plot_data$Strain, levels = c("Strain1", "Strain2", "Strain3", "Strain4", "Strain5"))

plot <- ggplot(plot_data, aes(x = Antimicrobial, fill = Resistance)) +
  geom_bar(position = "dodge") +
  labs(x = "Antimicrobial", y = "Count", 
       title = "Antimicrobial Resistance Profiles of Five Strains") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_brewer(palette = "Set3") + 
  facet_wrap(~ Strain)  

print(plot)
ggsave(file.path("C:/Klebsiella_AMR_Project/visualizations", "antimicrobial_resistance_profiles.png"), 
       plot, width = 10, height = 6, units = "in")
