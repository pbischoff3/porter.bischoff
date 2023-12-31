# Load required packages
library(ggplot2)
library(dplyr)
library(gridExtra)

# Create a data frame from the provided .csv data
# Data provided directly in the code
data <- read.csv(text = "
interruptions,name_of_pair,Mean,Std.Deviation,Std.Error.Mean,lower_95_CI,upper_95_CI,t,df,Sig
0,Sci_Ident_AVE - Sci_Ident_AVE_post,-0.3135,0.8762,0.0704,-0.4526,-0.1745,-4.455,154,0
0,Sci_Career_Mot_AVE - Sci_Career_Mot_AVE_post,-2.60E-11,0.948150779,0.076157303,-0.150447843,0.150447843,0,154,1
0,Sci_Interest_Ave - Sci_Interest_Ave_post,-0.137634409,0.767096714,0.061614691,-0.259353495,-0.015915323,-2.234,154,0.027
0,Self_Determin_Ave - Self_Determin_Ave_post,0.008602151,0.720698302,0.057887881,-0.105754666,0.122958967,0.149,154,0.882
0,Self_Efficacy_Ave - Self_Efficacy_Ave_post,0.088172043,0.793259318,0.063716122,-0.037698394,0.214042481,1.384,154,0.168
0,Communal_Sci_Ave - Communal_Sci_Ave_post,-0.070967742,0.832239192,0.066847061,-0.203023312,0.061087828,-1.062,154,0.29
1,Sci_Ident_AVE - Sci_Ident_AVE_post,-0.2933,0.9217,0.119,-0.5314,-0.0552,-2.465,59,0.017
1,Sci_Career_Mot_AVE - Sci_Career_Mot_AVE_post,-0.177777778,0.846987943,0.109345673,-0.396577965,0.041022409,-1.626,59,0.109
1,Sci_Interest_Ave - Sci_Interest_Ave_post,-0.144444444,0.653447087,0.084359656,-0.313247726,0.024358838,-1.712,59,0.092
1,Self_Determin_Ave - Self_Determin_Ave_post,-0.055555556,0.893935767,0.115406611,-0.286483651,0.17537254,-0.481,59,0.632
1,Self_Efficacy_Ave - Self_Efficacy_Ave_post,0.066666667,0.685606664,0.08851144,-0.110444315,0.243777648,0.753,59,0.454
1,Communal_Sci_Ave - Communal_Sci_Ave_post,0.083333333,0.662771104,0.085563382,-0.087878598,0.254545265,0.974,59,0.334
2,Sci_Ident_AVE - Sci_Ident_AVE_post,-0.3478,0.8317,0.0867,-0.5201,-0.1756,-4.011,91,0
2,Sci_Career_Mot_AVE - Sci_Career_Mot_AVE_post,-0.06884058,0.818793364,0.085365109,-0.238407882,0.100726723,-0.806,91,0.422
2,Sci_Interest_Ave - Sci_Interest_Ave_post,-0.097826087,0.676733596,0.070554355,-0.237973645,0.042321471,-1.387,91,0.169
2,Self_Determin_Ave - Self_Determin_Ave_post,0.018115942,0.73023677,0.076132446,-0.13311181,0.169343694,0.238,91,0.812
2,Self_Efficacy_Ave - Self_Efficacy_Ave_post,-0.094202899,0.723453404,0.075425231,-0.244025855,0.055620058,-1.249,91,0.215
2,Communal_Sci_Ave - Communal_Sci_Ave_post,-0.057971014,0.645466383,0.067294522,-0.191643316,0.075701287,-0.861,91,0.391
3,Sci_Ident_AVE - Sci_Ident_AVE_post,-0.2476,0.8609,0.1328,-0.5159,0.0206,-1.864,41,0.069
3,Sci_Career_Mot_AVE - Sci_Career_Mot_AVE_post,0.103174603,0.912093085,0.140739018,-0.181053611,0.387402817,0.733,41,0.468
3,Sci_Interest_Ave - Sci_Interest_Ave_post,-0.134920635,0.886696386,0.136820223,-0.411234681,0.141393411,-0.986,41,0.33
3,Self_Determin_Ave - Self_Determin_Ave_post,-0.007936508,0.688614709,0.106255557,-0.222523958,0.206650942,-0.075,41,0.941
3,Self_Efficacy_Ave - Self_Efficacy_Ave_post,0.007936508,0.780827493,0.120484298,-0.235386468,0.251259484,0.066,41,0.948
3,Communal_Sci_Ave - Communal_Sci_Ave_post,0.126984127,0.525513717,0.081088527,-0.036777475,0.290745729,1.566,41,0.125
4,Sci_Ident_AVE - Sci_Ident_AVE_post,0.0824,0.7987,0.137,-0.1963,0.361,0.601,33,0.552
4,Sci_Career_Mot_AVE - Sci_Career_Mot_AVE_post,0.098039216,0.979690777,0.168015582,-0.243791056,0.439869488,0.584,33,0.564
4,Sci_Interest_Ave - Sci_Interest_Ave_post,-0.049019608,1.028654618,0.176412812,-0.407934172,0.309894956,-0.278,33,0.783
4,Self_Determin_Ave - Self_Determin_Ave_post,0.264705882,0.867596284,0.148791535,-0.038012772,0.567424537,1.779,33,0.084
4,Self_Efficacy_Ave - Self_Efficacy_Ave_post,0.323529412,0.933785223,0.160142845,-0.002283655,0.649342479,2.02,33,0.052
4,Communal_Sci_Ave - Communal_Sci_Ave_post,0.058823529,0.76748129,0.131621955,-0.208963352,0.326610411,0.447,33,0.658
5,Sci_Ident_AVE - Sci_Ident_AVE_post,-0.4,0.5774,0.2182,-0.934,0.134,-1.833,6,0.116
5,Sci_Career_Mot_AVE - Sci_Career_Mot_AVE_post,-0.571428571,0.534522484,0.202030509,-1.065779418,-0.077077725,-2.828,6,0.03
5,Sci_Interest_Ave - Sci_Interest_Ave_post,-0.523809524,0.690065559,0.260820266,-1.162013723,0.114394675,-2.008,6,0.091
5,Self_Determin_Ave - Self_Determin_Ave_post,-0.714285714,0.487950037,0.184427778,-1.165564231,-0.263007197,-3.873,6,0.008
5,Self_Efficacy_Ave - Self_Efficacy_Ave_post,-0.238095238,0.370899094,0.14018668,-0.581119688,0.104929212,-1.698,6,0.14
5,Communal_Sci_Ave - Communal_Sci_Ave_post,-0.476190476,0.766356045,0.289655359,-1.184951606,0.232570654,-1.644,6,0.151
")

# Rename the columns
colnames(data) <- c("interruptions", "Pair", "Mean", "Std.Deviation", "Std.Error.Mean",
                    "Lower", "Upper", "t", "df", "Sig")

# Get unique pair names
pair_names <- unique(data$Pair)

# List to store individual graphs
graphs <- list()

# New names for the pairs
new_pair_names <- c("Science Identity", "Science Career Motivation", "Science Interest",
                    "Self-Determination", "Self-Efficacy", "Community in Science")

# Define the color gradient
color_gradient <- colorRampPalette(c("#96c48f", "#136307"))

# Generate graphs for each pair
for (i in seq_along(pair_names)) {
  # Filter data for the specific pair
  pair_data <- data %>%
    filter(Pair == pair_names[i])
  
  # Filter significant data points (Sig <= 0.05)
  sig_data <- pair_data %>%
    filter(Sig <= 0.05)
  
  # Create plot for the specific pair
  plot <- ggplot(pair_data, aes(x = factor(interruptions), y = Mean, fill = factor(interruptions))) +
    geom_bar(stat = "identity", position = "dodge") +
    geom_errorbar(aes(ymin = Mean - Std.Error.Mean, ymax = Mean + Std.Error.Mean),
                  position = position_dodge(width = 0.9), width = 0.25) +
    labs(x = "Rate of Medical Interruptions", y = "Pre/Post Semester Change") +
    ggtitle(new_pair_names[i]) +
    scale_fill_manual(values = color_gradient(length(unique(pair_data$interruptions)))) +
    scale_x_discrete(labels = c("0" = "Control")) +  # Modify labels for "0"
    theme_minimal() +
    theme(legend.position = "none") +
    theme(panel.border = element_rect(color = "black", fill = NA))
  
  # Add significance points to the plot
  if (nrow(sig_data) > 0) {
    plot <- plot +
      geom_point(data = sig_data, aes(y = Mean + Std.Error.Mean + 0.2), shape = 16, size = 3, color = "black")
  }
  
  # Store the plot in the list
  graphs[[i]] <- plot
}

# Combine graphs into a grid
combined_plot <- grid.arrange(grobs = graphs, nrow = 3, ncol = 2, padding = unit(10, "cm"))

# Display the combined plot
print(combined_plot)