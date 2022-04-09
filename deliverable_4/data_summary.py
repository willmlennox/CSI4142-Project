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
        if (row[2] == None or row[3] == None):
            continue
        country_names.append(row[0])
        years.append(row[1])
        life_exp.append(float((row[2] + row[3])/2))

    return (country_names, years, life_exp)


def adultLiteracyQuery(cur):
    country_names = []
    years = []
    adult_literacy = []
    sql = """
    select c."Name", m."Year", e."Literacy rate, adult female (% of females ages 15 and above)", e."Literacy rate, adult male (% of males ages 15 and above)"
    from "Fact_Table" as f
    join "Education" as e on e."EducationKey" = f."EducationKey"
    join "Country" as c on c."CountryKey" = f."CountryKey"
    join "Month" as m on m."MonthKey" = f."MonthKey"
    """
    cur.execute(sql)
    data = cur.fetchall()

    for row in data:
        if (row[2] == None or row[3] == None):
            continue
        country_names.append(row[0])
        years.append(row[1])
        adult_literacy.append(float((row[2] + row[3])/2))

    return (country_names, years, adult_literacy)


def grossEnrollmentQuery(cur):
    country_names = []
    years = []
    gross_enrollment = []
    sql = """
    select c."Name", m."Year", e."School enrollment, primary, female (% gross)", e."School enrollment, primary, male (% gross)", 
    e."School enrollment, secondary, female (% gross)", e."School enrollment, secondary, male (% gross)",
    e."School enrollment, tertiary (% gross)"
    from "Fact_Table" as f
    join "Education" as e on e."EducationKey" = f."EducationKey"
    join "Country" as c on c."CountryKey" = f."CountryKey"
    join "Month" as m on m."MonthKey" = f."MonthKey"
    """
    cur.execute(sql)
    data = cur.fetchall()

    for row in data:
        i = 2
        c = 0
        t = 0

        while i < len(row):
            if row[i] == None:
                i += 1
                continue
            else:
                t += row[i]
                i += 1
                c += 1
        if c == 0:
            continue
        else:
            gross_enrollment.append(float(t/(c*100)))
            country_names.append(row[0])
            years.append(row[1])

    return (country_names, years, gross_enrollment)


def diQuery(cur):
    country_names = []
    di = []
    sql = """
    select c."Name", f."Development Index", f."CountryKey"
    from "Fact_Table" f, "Country" c
    where f."CountryKey" < 5145 and c."CountryKey" = f."CountryKey"
    limit 144
    """
    cur.execute(sql)
    data = cur.fetchall()

    for row in data:
        if (row[1] == None):
            continue
        country_names.append(row[0])
        di.append(float(row[1]))

    return (country_names, di)


def gniPerCapQuery(cur):
    country_names = []
    years = []
    gni_per_capita = []
    sql = """
    select c."Name", m."Year", c."GNI per capita (US$)"
    from "Fact_Table" as f
    join "Country" as c on c."CountryKey" = f."CountryKey"
    join "Month" as m on m."MonthKey" = f."MonthKey"
    """
    cur.execute(sql)
    data = cur.fetchall()

    for row in data:
        if (row[2] == None):
            continue
        country_names.append(row[0])
        years.append(row[1])
        gni_per_capita.append(float(row[2].replace('$', '').replace(',', '')))

    return (country_names, years, gni_per_capita)


def scatterPlot(data, life_exp, fig):
    country = np.asarray(data[0])
    year = np.asarray(data[1])
    lifeExp = np.asarray(data[2])

    plt.figure(fig)
    
    for i in range(len(country)):
        plt.scatter(year[i], lifeExp[i], color=COUNTRY_COLOURS[country[i]], label=country[i])
    plt.legend(handles=[mpatches.Patch(color=COUNTRY_COLOURS[c], label=c) for c in COUNTRIES])
    plt.xlabel('Year')
    if life_exp:
        plt.ylabel('Life Expectancy Average (Years)')
    else:
        plt.ylabel('GNI per capita (US$)')


def boxPlotEdu(data, literacy, fig):
    country = np.asarray(data[0])
    lifeExp = np.asarray(data[2])

    plt.figure(fig)

    d = []
    for c in COUNTRIES:
        a = []
        for i in range(len(country)):
            if country[i] == c:
                a.append(lifeExp[i])
        d.append(a)
    
    plt.boxplot(d, vert=0, patch_artist=True, labels=COUNTRIES)
    if literacy:
        plt.xlabel('Adult Literacy Rate')
    else:
        plt.xlabel('Gross Enrollment')


def histogramDi(data, fig):
    di = np.asarray(data[1])

    plt.figure(fig)
    
    plt.hist(di)

    plt.xlabel('Development Index')


if __name__ == '__main__':
    conn = connect()
    cur = conn.cursor()

    lifeExp = lifeExpQuery(cur)
    scatterPlot(lifeExp, True, 1)

    gniPerCap = gniPerCapQuery(cur)
    scatterPlot(gniPerCap, False, 2)

    adultLiteracy = adultLiteracyQuery(cur)
    boxPlotEdu(adultLiteracy, True, 3)

    grossEnrollment = grossEnrollmentQuery(cur)
    boxPlotEdu(grossEnrollment, False, 4)

    di = diQuery(cur)
    histogramDi(di, 5)

    plt.show()

    cur.close()
    conn.close()

