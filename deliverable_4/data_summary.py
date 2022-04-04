import psycopg2
from connect import connect
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np


COUNTRY_COLOURS = {
    "Bolivia": "blue",
    "Brazil": "green",
    "Canada": "red",
    "Colombia": "purple",
    "Indonesia": "brown",
    "Mexico": "orange",
    "Thailand": "yellow",
    "United States": "black",
    "Vietnam": "pink",
}

COUNTRIES = ["Bolivia",
    "Brazil",
    "Canada",
    "Colombia",
    "Indonesia",
    "Mexico",
    "Thailand",
    "United States",
    "Vietnam"]


def lifeExpQuery(cur):
    country_names = []
    years = []
    life_exp = []
    sql = """
    select c."Name", m."Year", h."Life expectancy at birth, female (years)", h."Life expectancy at birth, male (years)"
    from "Fact_Table" as f
    join "Health" as h on h."HealthKey" = f."HealthKey"
    join "Country" as c on c."CountryKey" = f."CountryKey"
    join "Month" as m on m."MonthKey" = f."MonthKey"
    """
    cur.execute(sql)
    data = cur.fetchall()

    for row in data:
        country_names.append(row[0])
        years.append(row[1])
        if (row[2] == None or row[3] == None):
            life_exp.append(None)
        else:
            life_exp.append((row[2] + row[3])/2)

    return (country_names, years, life_exp)


def scatterPlotLifeExp(data):
    country = np.asarray(data[0])
    year = np.asarray(data[1])
    lifeExp = np.asarray(data[2])
    
    for i in range(len(country)):
        plt.scatter(year[i], lifeExp[i], color=COUNTRY_COLOURS[country[i]], label=country[i])
    plt.legend(handles=[mpatches.Patch(color=COUNTRY_COLOURS[c], label=c) for c in COUNTRIES])
    plt.xlabel('Year')
    plt.ylabel('Life Expectancy Average (Years)')
    plt.show()


def boxPlot():
    pass


def histogram():
    pass


if __name__ == '__main__':
    conn = connect()
    cur = conn.cursor()

    lifeExp = lifeExpQuery(cur)
    scatterPlotLifeExp(lifeExp)

    cur.close()
    conn.close()

