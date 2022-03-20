#!/usr/bin/python
from configparser import ConfigParser
import psycopg2


def config(filename='database.ini', section='postgresql'):
    # create a parser
    parser = ConfigParser()
    # read config file
    parser.read(filename)

    # get section, default to postgresql
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))

    return db


def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT * FROM "Population"')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)

        # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')



def event_date_grabber():
    sql = """select ev."Start Year", ev."Start Month"
    from "Event" as ev
    WHERE ev."Start Month" != 'December'
    ORDER BY ev."Start Year" asc, to_date(ev."Start Month", 'Month')
    """
    conn = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql)
        #print(cur.rowcount)
        row = cur.fetchone()
        inserter_thing(conn, row)

        while row is not None:
            #print(row[1])
            row = cur.fetchone()
            inserter_thing(conn, row)


        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        pass
    finally:

        if conn is not None:
            conn.close()

    return cur


key = 6017


decades  = {
    "2005": 1,
    "2006": 1,
    "2007": 1,
    "2008": 1,
    "2009": 1,
    "2010": 2,
    "2011": 2,
    "2012": 2,
    "2013": 2,
    "2014": 2,
    "2015": 2,
    "2016": 2,
    "2017": 2,
    "2018": 2,
    "2019": 2,
    "2020": 3,
}

quarters = {
    "January": 1,
    "February": 1,
    "March": 1,
    "April": 2,
    "May": 2,
    "June": 2,
    "July": 3,
    "August": 3,
    "September": 3,
    "October": 4,
    "November": 4,
}


def inserter_thing(conn, cur_row):
    global key
    sql = """
    INSERT INTO "Month"("MonthKey", "Name", "Quarter", "Year", "Decade")
    VALUES(%s, %s, %s, %s, %s)
    """

    try:
        cur_decade = decades[str(cur_row[0])]
        cur_quarter = quarters[str(cur_row[1])]

        print(cur_quarter)
        print(cur_decade)

        VALUES = (key, (cur_row[1]), cur_quarter, (cur_row[0]), cur_decade)
        key += 1

        cur = conn.cursor()
        cur.execute(sql, VALUES)
        # get the generated id back
        # commit the changes to the database
        conn.commit()
        # close communication with the database
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)



def get_all_event_keys():

    sql = """
    SELECT "EventKey", "Start Month", "Start Year" 
    from "Event"
    WHERE "Event"."Start Month" != 'December'
    """
    conn = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql)
        # get_corresponding_month_key(row)

        return cur.fetchall()

        # while row is not None:
        #     row = cur.fetchone()
        #     print(row)
        #
        # cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        pass
    finally:

        if conn is not None:
            conn.close()

def get_corresponding_month_key(event_info):

    sql = """
    SELECT "MonthKey", "Year"
    from "Month"
    WHERE "Name" = %s and "Year" = %s
    """
    conn = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        event_month = event_info[1]
        event_year = event_info[2]

        VALUES = (str(event_month), event_year)

        # print(event_month)
        # print(event_year)

        cur.execute(sql, VALUES)

        return cur.fetchone()

        row = cur.fetchone()
        print("monthkey:")
        print(row)

        while row is not None:
            row = cur.fetchone()
            print(row)

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        pass
    finally:

        if conn is not None:
            conn.close()


country_dict = {
    "BOL": 16,
    "BRA": 32,
    "CAN": 48,
    "COL": 64,
    "IND": 80,
    "MEX": 96,
    "THA": 112,
    "USA": 128,
    "VNM": 144,
}

years_dict = {
    2005: 6001,
    2006: 6002,
    2007: 6003,
    2008: 6004,
    2009: 6005,
    2010: 6006,
    2011: 6007,
    2012: 6008,
    2013: 6009,
    2014: 6010,
    2015: 6011,
    2016: 6012,
    2017: 6013,
    2018: 6014,
    2019: 6015,
    2020: 6016,
}


def pull_parts_fact_table(country_code):
    sql = """
    SELECT * 
    FROM "Fact_Table" as ft
    WHERE ft."CountryKey" >= %s and ft."CountryKey" <= %s
    """

    conn = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        country_val = country_dict[country_code]

        country_min = 5000 + country_val - 15
        country_max = 5000 + country_val

        VALUES = (country_min, country_max)

        cur.execute(sql, VALUES)

        return cur.fetchall()

        row = cur.fetchone()
        print(row)

        while row is not None:
            row = cur.fetchone()
            print(row)

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        pass
    finally:

        if conn is not None:
            conn.close()



def the_big_one_builder(fact_table_result, event_info, month_info):

    month_info_year = month_info[1]

    six_thousand_month_key_equiv = years_dict[month_info_year]

    for fact in fact_table_result:
        if fact[0] == six_thousand_month_key_equiv:
            VALUES = (month_info[0], fact[1], fact[2], fact[3], fact[4], event_info[0], fact[6], fact[7], fact[8], fact[9])

    return VALUES


def insert_into_fact_table(row_values):
    sql = """
    INSERT INTO "Fact_Table"
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s) 
    """
    conn = None
    try:
        # read database configuration
        params = config()
        # connect to the PostgreSQL database
        conn = psycopg2.connect(**params)
        # create a new cursor
        cur = conn.cursor()
        # execute the INSERT statement
        cur.execute(sql, row_values)
        # get the generated id back
        # commit the changes to the database
        conn.commit()
        # close communication with the database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        pass
    finally:
        if conn is not None:
            conn.close()





if __name__ == '__main__':
    # cur = get_all_event_keys()
    # fetch = pull_parts_fact_table(country_dict["BOL"])
    # print(fetch)

    event_keys = get_all_event_keys()

    for e_key in event_keys:
        month_key = get_corresponding_month_key(e_key)
        print(e_key)
        print(month_key)

        country_code = None

        if 7010 >= e_key[0] >= 7001:
            country_code = "BOL"
        elif 7020 >= e_key[0] >= 7011:
            country_code = "BRA"
        elif 7030 >= e_key[0] >= 7021:
            country_code = "CAN"
        elif 7040 >= e_key[0] >= 7031:
            country_code = "COL"
        elif 7050 >= e_key[0] >= 7041:
            country_code = "IND"
        elif 7060 >= e_key[0] >= 7051:
            country_code = "MEX"
        elif 7070 >= e_key[0] >= 7061:
            country_code = "THA"
        elif 7080 >= e_key[0] >= 7071:
            country_code = "USA"
        elif 7090 >= e_key[0] >= 7081:
            country_code = "VNM"


        fact_table_data = pull_parts_fact_table(country_code)

        print(fact_table_data)

        VALUE = the_big_one_builder(fact_table_data, e_key, month_key)
        insert_into_fact_table(VALUE)






