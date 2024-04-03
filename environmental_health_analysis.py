
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

# First Python part
with open('cause_of_deaths.csv', mode ='r')as file:
    data = pd.read_csv(file)

data_subsetCol = data[['Country/Territory', 'Year', 'Acute Hepatitis']]
Country = ["India", "China", "Pakistan", "Indonesia"]
data_subsetCol['Year'] = pd.to_numeric(data_subsetCol['Year'], errors='coerce')
data_subsetCol['Acute Hepatitis'] = pd.to_numeric(data_subsetCol['Acute Hepatitis'], errors='coerce')

x_data = data_subsetCol[data_subsetCol['Country/Territory'].isin(Country)]
grouped_data = x_data.groupby(['Country/Territory', 'Year'])['Acute Hepatitis'].sum().reset_index()
pivot_data = grouped_data.pivot(index='Year', columns='Country/Territory', values='Acute Hepatitis')
country_sums = pivot_data.sum().sort_values()
sorted_countries = country_sums.index
pivot_data = pivot_data.reindex(columns=sorted_countries)
colors = ['cyan', 'orange', 'red', 'green']
plt.stackplot(pivot_data.index, pivot_data.values.T, labels=pivot_data.columns, colors=colors)
plt.xlabel('Year')
plt.ylabel('Acute Hepatitis')
plt.legend(loc='upper right')
plt.title('Stackplot of Acute Hepatitis by Country')
plt.show()

# Second Python part
with open ('AirQuality.csv', mode ='r') as f:
    data = pd.read_csv(f)

state_name = ["Jharkhand", "Gujarat", "Haryana", "TamilNadu", "Delhi"]
data_subset = data[data['State'].isin(state_name)][['Pollutants', 'State', 'Avg']]
data_subset = data_subset.groupby(['Pollutants', 'State']).mean().reset_index()
new_data = data_subset.pivot("Pollutants", "State", "Avg")
ax = sns.heatmap(new_data, cmap='Blues')
plt.title("Figure E - Heatmap of States and Pollutants")
plt.show()
