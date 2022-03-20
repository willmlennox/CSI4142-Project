PGDMP     &                    z           CSI4142    14.2    14.2 *    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    16394    CSI4142    DATABASE     f   CREATE DATABASE "CSI4142" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Canada.1252';
    DROP DATABASE "CSI4142";
                postgres    false            �            1255    24576    plpgsql_call_handler()    FUNCTION     �   CREATE FUNCTION public.plpgsql_call_handler() RETURNS language_handler
    LANGUAGE c
    AS '$libdir/plpgsql', 'plpgsql_call_handler';
 -   DROP FUNCTION public.plpgsql_call_handler();
       public          postgres    false            �            1259    24577    Country    TABLE       CREATE TABLE public."Country" (
    "CountryKey" integer NOT NULL,
    "Name" text NOT NULL,
    "Region" text NOT NULL,
    "Continent" text NOT NULL,
    "Currency" text NOT NULL,
    "Capital" text NOT NULL,
    "Population, Total" integer NOT NULL,
    "GNI per capita (US$)" money NOT NULL,
    "Primary Language" text,
    "Completeness of birth registration (%)" numeric,
    "Completeness of death registration with cause-of-death informat" numeric,
    "Urban population" integer,
    "Rural population" integer
);
    DROP TABLE public."Country";
       public         heap    postgres    false            �            1259    24582 	   Education    TABLE     Z  CREATE TABLE public."Education" (
    "EducationKey" integer NOT NULL,
    "Literacy rate, adult female (% of females ages 15 and above)" numeric,
    "Literacy rate, adult male (% of males ages 15 and above)" numeric,
    "Literacy rate, youth total (% of people ages 15-24)" numeric,
    "Primary completion rate, female (% of relevant age group)" numeric,
    "Primary completion rate, male (% of relevant age group)" numeric,
    "Public spending on education, total (% of GDP)" numeric,
    "Ratio of young literate females to males (% ages 15-24)" numeric,
    "School enrollment, primary, female (% gross)" numeric,
    "School enrollment, primary, male (% gross)" numeric,
    "School enrollment, secondary, female (% gross)" numeric,
    "School enrollment, secondary, male (% gross)" numeric,
    "School enrollment, tertiary (% gross)" numeric
);
    DROP TABLE public."Education";
       public         heap    postgres    false            �            1259    24587    Event    TABLE       CREATE TABLE public."Event" (
    "EventKey" integer NOT NULL,
    "Disaster Group" text,
    "Disaster Subgroup" text,
    "Disaster Type" text,
    "Disaster Subtype" text,
    "Event Name" text,
    "Start Year" integer,
    "Start Month" text,
    "Start Day" integer,
    "End Year" integer,
    "End Month" text,
    "End Day" integer,
    "Total Deaths" integer,
    "No Injured" integer,
    "No Affected" integer,
    "No Homeless" integer,
    "Total Affected" integer,
    "Total Damages, Adjusted ('000 US$)" money
);
    DROP TABLE public."Event";
       public         heap    postgres    false            �            1259    24626 
   Fact_Table    TABLE     N  CREATE TABLE public."Fact_Table" (
    "MonthKey" integer,
    "CountryKey" integer,
    "EducationKey" integer,
    "QuailtyOfLifeKey" integer,
    "HealthKey" integer,
    "EventKey" integer,
    "PopulationKey" integer,
    "Quality of Life Index" numeric,
    "Development Index" numeric,
    "Human Development Index" numeric
);
     DROP TABLE public."Fact_Table";
       public         heap    postgres    false            �            1259    24592    Health    TABLE     |  CREATE TABLE public."Health" (
    "HealthKey" integer NOT NULL,
    "Capital health expenditure (% of GDP)" numeric,
    "Current health expenditure per capita (current US$)" numeric,
    "Domestic general government health expenditure (% of current he" numeric,
    "Domestic private health expenditure (% of current health expend" numeric,
    "External health expenditure (% of current health expenditure)" numeric,
    "Out-of-pocket expenditure (% of current health expenditure)" numeric,
    "UHC service coverage index" numeric,
    "Immunization, BCG (% of one-year-old children)" numeric,
    "Immunization, DPT (% of children ages 12-23 months)" numeric,
    "Immunization, HepB3 (% of one-year-old children)" numeric,
    "Immunization, Hib3 (% of children ages 12-23 months)" numeric,
    "Immunization, measles (% of children ages 12-23 months)" numeric,
    "Immunization, Pol3 (% of one-year-old children)" numeric,
    "Hospital beds (per 1,000 people)" numeric,
    "Nurses and midwives (per 1,000 people)" numeric,
    "Physicians (per 1,000 people)" numeric,
    "Number of infant deaths" integer,
    "Stillbirth rate (per 1,000 total births)" numeric,
    "Life expectancy at birth, female (years)" numeric,
    "Life expectancy at birth, male (years)" numeric,
    "Prevalence of undernourishment (% of population)" numeric,
    "Prevalence of overweight (% of adults)" numeric
);
    DROP TABLE public."Health";
       public         heap    postgres    false            �            1259    24597    Month    TABLE     �   CREATE TABLE public."Month" (
    "MonthKey" integer NOT NULL,
    "Name" text NOT NULL,
    "Quarter" integer NOT NULL,
    "Year" integer NOT NULL,
    "Decade" integer NOT NULL
);
    DROP TABLE public."Month";
       public         heap    postgres    false            �            1259    24602 
   Population    TABLE     V  CREATE TABLE public."Population" (
    "PopulationKey" integer NOT NULL,
    "Population, male" integer,
    "Population, female" integer,
    "Population, total" integer,
    "Urban population (% of total population)" numeric,
    "Urban population growth (annual %)" numeric,
    "Rural population growth (annual %)" numeric,
    "Rural population (% of total population)" numeric,
    "Population growth (annual %)" numeric,
    "Population ages 15-64, total" integer,
    "Population ages 65 and above, total" integer,
    "Population ages 00-14, total" integer,
    "Net migration" integer
);
     DROP TABLE public."Population";
       public         heap    postgres    false            �            1259    24607    Quality of Life    TABLE     f  CREATE TABLE public."Quality of Life" (
    "QualityOfLifeKey" integer NOT NULL,
    "Unemployment, male (% of male labor force)" numeric,
    "Unemployment, female (% of female labor force)" numeric,
    "People using at least basic drinking water services, rural (% o" numeric,
    "People using at least basic drinking water services, urban (% o" numeric,
    "People using at least basic sanitation services, rural (% of ru" numeric,
    "People using at least basic sanitation services, urban (% of ur" numeric,
    "People using safely managed drinking water services, rural (% o" numeric,
    "People using safely managed drinking water services, urban (% o" numeric,
    "People using safely managed sanitation services, rural (% of ru" numeric,
    "People using safely managed sanitation services, urban (% of ur" numeric,
    "People practicing open defecation, rural (% of rural population" numeric,
    "People practicing open defecation, urban (% of urban population" numeric,
    "Maternal leave benefits (% of wages paid in covered period)" numeric,
    "Pregnant women receiving prenatal care (%)" numeric
);
 %   DROP TABLE public."Quality of Life";
       public         heap    postgres    false                      0    24577    Country 
   TABLE DATA           =  COPY public."Country" ("CountryKey", "Name", "Region", "Continent", "Currency", "Capital", "Population, Total", "GNI per capita (US$)", "Primary Language", "Completeness of birth registration (%)", "Completeness of death registration with cause-of-death informat", "Urban population", "Rural population") FROM stdin;
    public          postgres    false    209   �N                  0    24582 	   Education 
   TABLE DATA           �  COPY public."Education" ("EducationKey", "Literacy rate, adult female (% of females ages 15 and above)", "Literacy rate, adult male (% of males ages 15 and above)", "Literacy rate, youth total (% of people ages 15-24)", "Primary completion rate, female (% of relevant age group)", "Primary completion rate, male (% of relevant age group)", "Public spending on education, total (% of GDP)", "Ratio of young literate females to males (% ages 15-24)", "School enrollment, primary, female (% gross)", "School enrollment, primary, male (% gross)", "School enrollment, secondary, female (% gross)", "School enrollment, secondary, male (% gross)", "School enrollment, tertiary (% gross)") FROM stdin;
    public          postgres    false    210   <^       !          0    24587    Event 
   TABLE DATA           I  COPY public."Event" ("EventKey", "Disaster Group", "Disaster Subgroup", "Disaster Type", "Disaster Subtype", "Event Name", "Start Year", "Start Month", "Start Day", "End Year", "End Month", "End Day", "Total Deaths", "No Injured", "No Affected", "No Homeless", "Total Affected", "Total Damages, Adjusted ('000 US$)") FROM stdin;
    public          postgres    false    211   �x       &          0    24626 
   Fact_Table 
   TABLE DATA           �   COPY public."Fact_Table" ("MonthKey", "CountryKey", "EducationKey", "QuailtyOfLifeKey", "HealthKey", "EventKey", "PopulationKey", "Quality of Life Index", "Development Index", "Human Development Index") FROM stdin;
    public          postgres    false    216   E�       "          0    24592    Health 
   TABLE DATA           `  COPY public."Health" ("HealthKey", "Capital health expenditure (% of GDP)", "Current health expenditure per capita (current US$)", "Domestic general government health expenditure (% of current he", "Domestic private health expenditure (% of current health expend", "External health expenditure (% of current health expenditure)", "Out-of-pocket expenditure (% of current health expenditure)", "UHC service coverage index", "Immunization, BCG (% of one-year-old children)", "Immunization, DPT (% of children ages 12-23 months)", "Immunization, HepB3 (% of one-year-old children)", "Immunization, Hib3 (% of children ages 12-23 months)", "Immunization, measles (% of children ages 12-23 months)", "Immunization, Pol3 (% of one-year-old children)", "Hospital beds (per 1,000 people)", "Nurses and midwives (per 1,000 people)", "Physicians (per 1,000 people)", "Number of infant deaths", "Stillbirth rate (per 1,000 total births)", "Life expectancy at birth, female (years)", "Life expectancy at birth, male (years)", "Prevalence of undernourishment (% of population)", "Prevalence of overweight (% of adults)") FROM stdin;
    public          postgres    false    212   Ώ       #          0    24597    Month 
   TABLE DATA           R   COPY public."Month" ("MonthKey", "Name", "Quarter", "Year", "Decade") FROM stdin;
    public          postgres    false    213   F�       $          0    24602 
   Population 
   TABLE DATA           �  COPY public."Population" ("PopulationKey", "Population, male", "Population, female", "Population, total", "Urban population (% of total population)", "Urban population growth (annual %)", "Rural population growth (annual %)", "Rural population (% of total population)", "Population growth (annual %)", "Population ages 15-64, total", "Population ages 65 and above, total", "Population ages 00-14, total", "Net migration") FROM stdin;
    public          postgres    false    214   :�       %          0    24607    Quality of Life 
   TABLE DATA           �  COPY public."Quality of Life" ("QualityOfLifeKey", "Unemployment, male (% of male labor force)", "Unemployment, female (% of female labor force)", "People using at least basic drinking water services, rural (% o", "People using at least basic drinking water services, urban (% o", "People using at least basic sanitation services, rural (% of ru", "People using at least basic sanitation services, urban (% of ur", "People using safely managed drinking water services, rural (% o", "People using safely managed drinking water services, urban (% o", "People using safely managed sanitation services, rural (% of ru", "People using safely managed sanitation services, urban (% of ur", "People practicing open defecation, rural (% of rural population", "People practicing open defecation, urban (% of urban population", "Maternal leave benefits (% of wages paid in covered period)", "Pregnant women receiving prenatal care (%)") FROM stdin;
    public          postgres    false    215   �       y           2606    24613    Country Country_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY ("CountryKey");
 B   ALTER TABLE ONLY public."Country" DROP CONSTRAINT "Country_pkey";
       public            postgres    false    209            {           2606    24615    Education Education_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Education"
    ADD CONSTRAINT "Education_pkey" PRIMARY KEY ("EducationKey");
 F   ALTER TABLE ONLY public."Education" DROP CONSTRAINT "Education_pkey";
       public            postgres    false    210            }           2606    24617    Event Event_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY ("EventKey");
 >   ALTER TABLE ONLY public."Event" DROP CONSTRAINT "Event_pkey";
       public            postgres    false    211                       2606    24619    Health Health_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Health"
    ADD CONSTRAINT "Health_pkey" PRIMARY KEY ("HealthKey");
 @   ALTER TABLE ONLY public."Health" DROP CONSTRAINT "Health_pkey";
       public            postgres    false    212            �           2606    24621    Month Month_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Month"
    ADD CONSTRAINT "Month_pkey" PRIMARY KEY ("MonthKey");
 >   ALTER TABLE ONLY public."Month" DROP CONSTRAINT "Month_pkey";
       public            postgres    false    213            �           2606    24623    Population Population_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Population"
    ADD CONSTRAINT "Population_pkey" PRIMARY KEY ("PopulationKey");
 H   ALTER TABLE ONLY public."Population" DROP CONSTRAINT "Population_pkey";
       public            postgres    false    214            �           2606    24625 $   Quality of Life Quality of Life_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."Quality of Life"
    ADD CONSTRAINT "Quality of Life_pkey" PRIMARY KEY ("QualityOfLifeKey");
 R   ALTER TABLE ONLY public."Quality of Life" DROP CONSTRAINT "Quality of Life_pkey";
       public            postgres    false    215            �           1259    24678    fki_CountryKey    INDEX     Q   CREATE INDEX "fki_CountryKey" ON public."Fact_Table" USING btree ("CountryKey");
 $   DROP INDEX public."fki_CountryKey";
       public            postgres    false    216            �           1259    24684    fki_EducationKey    INDEX     U   CREATE INDEX "fki_EducationKey" ON public."Fact_Table" USING btree ("EducationKey");
 &   DROP INDEX public."fki_EducationKey";
       public            postgres    false    216            �           1259    24702    fki_EventKey    INDEX     M   CREATE INDEX "fki_EventKey" ON public."Fact_Table" USING btree ("EventKey");
 "   DROP INDEX public."fki_EventKey";
       public            postgres    false    216            �           1259    24696    fki_HealthKey    INDEX     O   CREATE INDEX "fki_HealthKey" ON public."Fact_Table" USING btree ("HealthKey");
 #   DROP INDEX public."fki_HealthKey";
       public            postgres    false    216            �           1259    24672    fki_MonthKey    INDEX     M   CREATE INDEX "fki_MonthKey" ON public."Fact_Table" USING btree ("MonthKey");
 "   DROP INDEX public."fki_MonthKey";
       public            postgres    false    216            �           1259    24708    fki_PopulationKey    INDEX     W   CREATE INDEX "fki_PopulationKey" ON public."Fact_Table" USING btree ("PopulationKey");
 '   DROP INDEX public."fki_PopulationKey";
       public            postgres    false    216            �           1259    24690    fki_QualityOfLifeKey    INDEX     ]   CREATE INDEX "fki_QualityOfLifeKey" ON public."Fact_Table" USING btree ("QuailtyOfLifeKey");
 *   DROP INDEX public."fki_QualityOfLifeKey";
       public            postgres    false    216            �           2606    24673    Fact_Table CountryKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "CountryKey" FOREIGN KEY ("CountryKey") REFERENCES public."Country"("CountryKey") NOT VALID;
 C   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "CountryKey";
       public          postgres    false    216    3193    209            �           2606    24679    Fact_Table EducationKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "EducationKey" FOREIGN KEY ("EducationKey") REFERENCES public."Education"("EducationKey") NOT VALID;
 E   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "EducationKey";
       public          postgres    false    210    3195    216            �           2606    24697    Fact_Table EventKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "EventKey" FOREIGN KEY ("EventKey") REFERENCES public."Event"("EventKey") NOT VALID;
 A   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "EventKey";
       public          postgres    false    211    3197    216            �           2606    24691    Fact_Table HealthKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "HealthKey" FOREIGN KEY ("HealthKey") REFERENCES public."Health"("HealthKey") NOT VALID;
 B   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "HealthKey";
       public          postgres    false    216    3199    212            �           2606    24667    Fact_Table MonthKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "MonthKey" FOREIGN KEY ("MonthKey") REFERENCES public."Month"("MonthKey") NOT VALID;
 A   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "MonthKey";
       public          postgres    false    213    3201    216            �           2606    24703    Fact_Table PopulationKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "PopulationKey" FOREIGN KEY ("PopulationKey") REFERENCES public."Population"("PopulationKey") NOT VALID;
 F   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "PopulationKey";
       public          postgres    false    214    216    3203            �           2606    24685    Fact_Table QualityOfLifeKey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Fact_Table"
    ADD CONSTRAINT "QualityOfLifeKey" FOREIGN KEY ("QuailtyOfLifeKey") REFERENCES public."Quality of Life"("QualityOfLifeKey") NOT VALID;
 I   ALTER TABLE ONLY public."Fact_Table" DROP CONSTRAINT "QualityOfLifeKey";
       public          postgres    false    3205    215    216               b  x��[ˎ�<7�b��zdee%Z�mز �q�eH�ɁV�w����[�e�ȞY����LIA�MFvUfd�[Jy���n���z���q����ۏ���_]�^ܼys��N��z������۫7���O�z��v�RK�_x�W������^o7���͋T���Խ�W-�2�zq�缀������fD��[3�F�����k��v͍�2��,�]�zo7��'�x�lⷁ�f�=_߾�R-]��@�q�gi����-�ko�x���,��#�K.���e�����7���H�ڻ�N�Җ����]��}$|�R{#|����zV�*�g��4�'m9���|�&*�/05�R^N��k!���T�U_[s%�@���l�u����9�{ñ4��XW�^H{9g��0`��q8��'�`��^ε!���e�f��Uz~ ���rE��-�%�Jx���H���k*N���{�����[˄�}\�{s������x���/����gʦ�tD�t-{��������nn��&�#���#�t�6��A�	ee�؎�0rSA�"垽�8h�#���PW�O�a�)B2KO e�Q�H;J��)ܲ���; �h�R�4\_�%)<�v�vT3ōO׶�v������w�G�g�QF�ѐ� ��k_�i���-9����;�H;z�J
d(d[��rc�tx	N�Ԧ)S�����{q�H.��O�	${����&����R�n�A~:hp�`Ph��t5��#)."�!y)jvJ:CK�Bg��i��@^-���{c)����FfS���)p�:��@j/d�|P���a������k���2�ZK��\�J�B��{	h�B�9vԁԊR��e���O�au���v�E�@j-~���iG���V�
�Z��[R+
�ZA=�T�ԋ�
-;�C��uz�ޮ߭�o�'>���U<B�w�ww����XO���Sw"��������g�S�{��Ӥ0��r"�HF����j���CZ!�3P�Rj�v���m��I\"�d�L�ނ�Pj\�w�KRе}�|��:��ܴ��2_d�R���K����̅L�
���ED�Q�.�6�Y�ѱ�KvdP+ )��/�D��d���x��^x��[ꀄ�^ٳV��IkBB6+XaB^��h� �����xZ�Jv��1�i׈�r"H �u �e�n�uĤ6(*���wZGbK�M�e�A�������#�f���[��Y(����z�h�N�dYyZ��zd�Y�����"晻83������+��D�%�E����o]�#�D��!$��P�2��Eă�h�=b\d[~G�A��$N��޹�����/h������ۇ��������I�. �r�j^�)�U!(�� ����,�@�-�� �	�,,hK�Ҋ[��m���O���מy�YՆB4u�J��V�����C�~4�p�i�m��BP!��P�҂:Ђޢ�p�N��t�B�5�_|����a�p��(�0)@Q�p�X(-����l��@T)B٣�Kc"P)����F�����p��2�rY�B�\�s��׶>U�xt�|iVP�B����5ZS�»v0=�����*('΀Z?1w�����T;߾�C糉���C�["y�@�C�I�'K� �ʆ��83���@�C�t�~_~g���ߔ�*�d?\j�^����ۃq3n� /̈́��㨏����Ҭ@ ��O|.9�:�� ��N~_�|Tr5W��K��"m�o����f��x�~���o7ۼ���Ϗ�>���f�a���������-���ҟ���mE	�^)��ƛ������yU�t���:�vb<���T��*��ChОx�JF@@l���k��pV�7�\G��ˉ��=�A��Fa"���p!�1u0��Un��{���t��#�{�Z2R%�-���t�s
�\� ���Ы�Y�6����T!4Dv�a�؅�p�١g�|\u�h`D�*��^���-[�����ȕb���:%x�����RpP�%�� �S��0�Y�ZB57�������p٥�䔫��pB����l�RNC��o-G����ȅ�͍�W(�����r:����}7�<��+g���H$�RVS0� �#V�yn�r,1�,�_�_�kP�p8�6Y�S���x(��� �z�.�5Κ ɣb�~
�Z�? �5��;��n��y{���m��e��g�^o��4�yqf�d�8�3�����2e.(�B���x�B���8�:� ��Tcޱx��` ���d��j�Ѐ�3c�Qʔ�lSi@h@�<�W`�s����uh.n�_�/�#㌐��Z�)��N��V�A�&X�Bh �����wD�'n�#�BD	�g@/׫1�]�E.ٙ������0h��#���,2^���P;/��8�Ր��O�xNq�k?�� -H�DY��	��Z�#	��u�pD-BB�X*��1��G��.9�w�c*5����X�s���h��ȃ���\�R��@J,Q5ZP���$/
Y��GK�Â���b�V�K��H�	�")C��h�W��3�s�̕� �g �#�V\��}�Ӈ��n�}wZ����7���������.k���iU���@���Z�8�o�aۙ@��l^���3�;���J
E��Ty.���S�,�g���[�jc/r��ёwO�r ��n�Vޏ�:�VG� ���&K���K�1��{������P��:7*k�v��s ��b�@����3��a�v��?�h��{��=q��?�j�"��7j��7��2�C��y�[j�Aq�+4m���;AFw�8�6�A��	D�b�@zT@c�V��I���ȿ�7��@p��J3%Й�`�rPU�?�#H$.@'�p�8�3��͹Yƞ�Q����4Q�@�����Kcl���q����1q�<�|&;8�Y�G@������I1��?윩��Xd�۹�͐5v ��?o7��﮾\?�>|q���������������կo^�� ��r݋����רn���+��"�!}y�~�6�1�X�ql��pߚ��S܁!:E�i0D���7:�B&�?�^&W��œi\Mnr`ǫy�6iX�B�8-��$Zb�-����Hv���H�8�O4�S��mXU�-�tq+��\.��B�rZ�nH�B/�8������"����;���4$7Dh�s������� ����:>��HB�-�jxOf�vb͍q��U8Й��hn� R'�HY�ުԇ\jGj4��2�[��/�չ���[%Gk��5�g����H�d8��҅����U�E/Qf�>E�Q����pvE�Y-Z�Z�L�cAGj�L������Z��P�IA.�&�E�,F5�DC��+t
�BCd_�1 t$�Z��N��/��������g����-���߬���)�D�];�����YP�!�&�U}5��*���
�g�f��h���@n�/��ׄs��n&�o�� X!k�Ǧ!�x�\<����1�1��[^�~�ճ�:K�}ӿ����<{� ��g#�"�yz��3#��פ@�O��g�و$��C��OX��i�C�j\)��<�����E䂗�q�W����D����E�����G��ԭ��'�㎸G;����9v䫮7y�&T�[F#g�)��l�����ҝ�'|���3�@����7�HPH�o�ӉsEv��<W*3"��8Q�*��GrǈxCn�̾��;g9�s��ѼEӳ�`%7x*�V�8M.�
;�e�(v���/3����q�g���
g�8U=�9Z����IZ_�p��ի���Ϲ             x���[rI�D��Ŕ����YA�� Y����1K����pP��������Z��qkY��h��3^w�=���J�����ȯ^J�i��꣕�N<�z�����]���>�~���������g�~y��U�j���q�k��W��K���~νg�����n<���]�p�r����Ψ���p����箏�I���kk���|�`{�����;�V�����/�H�6O�8�>��&N�c�˩��p�����i���	��^`-��k�{폃uo�W�5?�e�w��,u�KL{�|�k|^X\���ǃ��n�k�ұ������q�\=~V8�WȚ��2k����ְ4����V�?�u��y<���O�jg�r��ʮ�i����~\�(�h���%����֩=^UvG�9.~Nɟ�zO�#���v����������\~��2no�)nu֚��5v�����b`�vW�O�ϥ�rt���}�jgW�ڹ�nD�I@�Ƈʫz�s��k��zy�Y�����,}�~��w�Rg��C���A���SD17|׳|��=���縌=��x#fZ�ƙ��=���'�Fz�Kw��;��t��p0�=}-��?o��V�Dų�/�����?�7.��ۏUʪ�R�.AV��u��{Y��<�Q��Ys!�a]��m����؞멳�|Ł�.��B�P��3��}<����kt����Ȏ�0x���Z@N�^�o�;y�+\����������	�7��b��[�[�-�9����u���ϻp�O�|�������?��oIT����, ��k3�[��8Ǿ³�����h"��{�vX�̉�6Z��;��pE'�"^��-��#p�u��J����t�F�?w�1� }Y�6F�{ы�N�N�E�k�j���~޹������O�d�W]S�X�5���[I&�T~�	;��{�Ym�Oל 
/����@ߞ
����$>B�N}�gW9�	�U#��G�/\����B3rY�q�� Ʋ��k�70V���ȸ��i� �?��Z�O��������r�.����� �X�Wxw���5q���L�$O#�����o���^��1 F?g�\k�����[���U���g <q93Ҹ�z��B�nYK��!y	.�Fl7)�����24#�+Nؽ�p��jXѲGpT�`�䡗1d9����4�(d��1&���70})I����K���[p���7 ��r[\.����A(�2���o��q�H� yl.��}��
(_���mقo�4�?����[ �c�>6�r5iZ�%�7x�B76ѿ��: H�6�7S'&����B�x���E ��}/XJ۟.�d�; d����"����T�K �`ᬷwp���9a+䨈1۹|0��s7���]�̱6�s�{�l1uv�a���=L}�;J6%V+�1�	���`wLpG��u��@G�����4R_0I�?�o��I��x5h�m5C�d]���5�O�4�@��z���'d��5�I��u���l��Ĺ2|鉗D$���'FH�=���9�����x�dn�'5SH%4!�&���{a�Ճf��4-MB�;5�����G�o�"�@L����1�d��M"4�Hw���V{Dj{�u��J�c����A.I�֝����H�G��o[\@��Jv�U��k�ߙY��a��������/]���#��pc�G�JB�O^/�Ҏ�OR�Ԗ���.����8�����8Un��b{��PQ���,[AӸ<�W���{�	� �n��X�LN��j���w��16�3Xi��=Ň�73�TG�d|^�h�H>�\8��c.�@K�V7O�����KT���I��m'�/���U�n�HM�#��â*#���9~'�j�V�I|AD�U���DBNU��0dO��?	$�pHg���sQ.�ɂx&�X��4#��-�~��g�XA�O�ftLZrQ)��c��%��Q��P��WR̋ ��:r���|�.6~���u��]�[��*4���x��Bu�������X�#� �!�����$�U:u<5��X�K1��㑐�o�{��{}�������WŔ$���U�P<m|��tD������j3��DΓ�d�j��HD-�� 31|�>lk��!�Pa�X�hM*=B{o5Z	��G=�ݣ�c��i����T��$���#h����1��ld�S :��&�L�0E�m���1b�4��ʎl�+{��#͜aя���qO�yV��� T�CW�I}a6%Lۈ"�r �0ӱ�Por��8L�������a�2*��Q�"�b���@�ȣ���"��k��a�����w�p<��3�Y5C/K�{d��IՋ勀B�A�f<˙�����[��6@KL�J(I�ŠCϹ��f�Jr�5C���ueXܗrt���8��X�&��W�n)�~�B�8C�5�.�IԽ�Z��f��2TW�G���2�ד#��5;e��n0�#|\ţ{"����؎8k�5�ؤ�GhWO��W@l=y��J�����
`�2ǢL�%�>�x��}e]����GCHy|VІ8"'-u�ɛ��)_�������1��:%ho�V��h,a�t'-�
֖:o�C�����Y�D��'�#&�x�;�1Y-��3e
Y�\����Ȇ�|A=s&8i�1n��oT�2y�|a���ʜ	���בEjP��
\\3��8ޙ�ã��P�x\qP[���ݰ?	vQ��CN�����t>n`��D >a�,�����yS5�*&�~�ʳM��MȖ�t́�.���k��_�
L�����h��yg$ƙd�1�Q32Q�� di�=O��
f��z
�U���3�Vbw<TY�e��=�\LƵ�2�Z��=AkSb�'�̡xlA���Ľ]�%5�@-w��E�A]`�dܠG�~�K՚*��32���!�W��K�VDN�ܠ��\�Z	��S�S��A36�-�تCv�F<nr����."Fk@������{J�Q��,W��n��"61�v��[3$/� �c��ni!kF\�1��6���T�&��Z�>�1��r�ۦ}8V��h#*��Ȃ���(NX7i-�;	`���e(8����Ӻ݂%M�W#����6²�`�
����O֭��ky�	Y_���Þ!���Cy�a�4vo�����3��n�L+�`-�dY �d��v��N��}�z�=�aM������-`G�%��6Fè�4�b�k�>��.�n��5Q��D&�p����**���8;������ �ք@��g�f�j�>S�����%G{3����'6��(�V{������K#��T���M�����%�V�dMpt�20;j*E������r�6-��lƜ���JT~�Ia�(�.�����xe�y��.L�V�d�
+C%��]���%��3�d��hڦp`��6�����Y�����i�z\&|�[�2���C�m�5��zZ-����F7�'.�b�bGQ��U��3u�������"Z�x�805�U��-׶}h�ֶ��Th���M��}��a�F��(��|��L��ȟ%��������sX��y���*�����%[�w�+X0A�x��8c �X�*YO�r�Ĳ�31�� )վ�=�c_H�������D̝��F�����r��x6�	�B1�x��]abN4G�aq�~TO�L���1� ��>8{;86����5 $�&a8T���-/gP�JhE�eUL��K��Gn�g��}�f�n'#��-��Ɇ-����r�B��,7��QX����Y��������f�x?�易s2�5�� e�]�-'���m���?q����'����v�Mt!@Z��U�{M2Qy�$E����#+�BdX�����H�U��*��	��Fi����)�8@����[�~�IuaܨDV���HN�NR���k�,�4٭;W�Y�ٷ��"�����8A¦M�hplE�~�ַ��K��v�!3�.��Tͦ|��$v 
  @L6G�4Iҹ	�*Iy�MSu�im?>��-%]��h<p@�:r��� ��,�u�����8�.��K­��Ee�d[%K��==9��0
r��A�@�̹!ԛ��,0��4���ݫP��cG\��xo(�z�2&_�S��ͮ�BN����e�(�0��LyDZ���8��tj��W���/8��Xm	֣�3����%���A�KH��}��ք�ٴ���qQ*r�'c����y;`0C����Ѝ�5@.�\���!�Y2QJjL�(�qmå��j��zb�y"I[V`�l�(z�,��IbpO�`�����P����Q��-}�td f�����	C��h���H�#��P��u�eY��ߞ���hG�����B�JZf�,c$Y�"pA�`��a������q(�řd�'�d���c��m�\����Ԍ��U){cK��岌m��\=\Ȥ�U���������yx}�N\��֊��"ԸS����!oJ6	�rք�<�Ζ �6��pSV8��n��cŦ���b��0?ʊ�I��{�[�\M6W�!)���#D��JP�j��\�=YC'�s�'��٬��ܮU� ������{�����w�99��dI����j.T����Fo*ƾk��������(e���6Y�{^�N�=2ik϶/�e�>�`�5��f��|1��q&z���1׺�D�`uhZ��Sw6(:%��%8�sR)f�P`[jNՓ��Fr�N�"V �v�W�b�*�6tC����D�Еn\/G���� �S[�`��kIT��r�<��\���k8��V{����rC��Aq�+*�6�!\m�t��+�:$�,�Fɞ���%G��B�p?�M�[���ud�R�T���!'�{���+�ox���w�M,YD�v1���-Y���gC�A�#�;�6���᲎�L��i�̑�9a%F�sq�vl��{JZx�Q|���1�-ę 0��er*��~�%�a�Y98�z��*vm�d7�J�⌉�8���D�1�P���D)�N�1�3��L;)���`�T�[�Ţ\5š:�j�٣��H�w��Ţ�m�%u4n�o]9{�$Tk��K8���N�p�����~���>��^v٣3�YG�&"�{��������'*���-��+��m�Z�8�~.ϟK��BN�DJ�w��2�Y�h[w�	հ|�����V㌫f7l�{,ǡ��wyϺ�8��	�n.��s���rVѢ����H��D��;ث������\����3���D����sw>#�ʹQLѿ,T�I�S���K�;&4v�v��v�$း[�;WT^'�-~��v�`cn}�Te�J��m�Y�V�8����jK 2�6���X�[��J�
H���$qBn$cG�W�;�Z�i0�i��%@1�� ����fu���	ʘ>YֳbY�Ÿ!N��rTf�%݀u��ܺǲȣ��aec����)�`�p;"|m7�]�BD֬�`Qh.2L�sU�1�b�i9'����j�ŜF�_U�p���7�=)���I�WU���{X{d���qo٬rY��6	ν��c���h�]^����&�_�\��7(X��1��o�jkM��3F;����]���f�wc��꼎:Y&��H�?�}I�1D�3ĵ��>��A�oN��R�f�:��s`��[%�:V�q�T\���v���B4�<ZP�X��)Q��՚�}��&�ΣZ�<��b��?{��Y��z���1ú�S��� M���Eٙ�p(sk�L��ψ�F<��u�9˞�]�3�0�wK*��J�N�E������+cu��g�g#�k5M�t���FG��O�5;D��#J����h��i�������@��'����8h X��?l?L�|��&g��Ç�=
`$��j<���:m�V��3�d�9-E.^� ������Y4��$V�G'ƞj��9�oO.��G������z�p3 zo��A�s��j�g��I�������>93̂�f�A@����~��lG�K�� Q-�q�_3$���B�����K��6���3;Y�[ۯքE�~M��YG��,�Yd~�G����gz��ֳ3�U��sZs�i���P���Gk1��	��{y���Y�0���	0��5�����>-��s�������&P
E�+HY�e����B�U(��?��bƻؖ����_��a#Ԧ T�5~
Iu���ꬥ������w�h�>���l����^��G9�G���%�l|��zݑ��&��/�A��c��Y�SX;��.�v8����氧c�=��-V>ݡ�֧sT�J�����Y� ��s���e�3*�$�g1��6�t$���y�_��H���1|����V���Yy��������X"B����;���7�L~��Mt���N�2p=�\��շtu'������	9+�%�S��m�(���t���Z���~o�r�{�b��E�����#Վݘwc�Y�
���\����wgI`L����y�ge�2�MJ�Z�`�gz6��[S��;��y��ȸ+�����M���������9���~_�k|��V@s��D�����wJ������V������ˍ_W����8�Z���D�Q8"I�~!��Ƚ�����~��;�d��������e���8��<Ur�����|��ׯ_��w�po      !   e  x��ZKo�H>w~<�Y��y��q���	cr�K[b$���(g��~�_|ɉMfC�j٬~T}�U5e�bt��c�KtY���{X7uYo�}.�������kD�T��|��n�an��o��n@C���c��i:�bAX�1�=M_�4%��7�b�������U�7Ѻ8�����js���8E���3m�q?3��ON�
���L������D�����D:��)�n�ն�~��갯�6ҫ��j'����
�*'
G��?1�ɼ����
,�Jo�
Ǝ�ꟶ�wy��}ޘ�<BWy���^��u}����D����xhQ����e�P06���b�㪭{��S��8S�c��$cLu�.���ٶ�,v���a�d��t��v��ݏ���C$���Yg�kQ��M>�xY7����W�N6��}����.�l����o��?��>����o���;��s6������>l'�1���JϐJͨ_��` �\$)���a2�T��L��96@�yg؊0g)N���r�!t�>�cc�WG?��f�k�	���hLZ7�H2¼=�#qg$@d��1�9I��L}i�f7���W-lnt�߇`���k$�(�F�@��,ɔ�k�b�M�X���.�'L��7,���� �TC��C�\�`�|�$�*�����j��p�?���,�ޜ��E��/z�S;����S�¸����?�l������@���Ï�p��d}9�@y�o;�>{���O�8�� <���p8$$��K�����3?�š��jc��? 5-p??'�d�!��g_և��Ч��׀L���^e�>80������,�
��h3��{I�l2U�?1ץ��u	����g�P��C��,;L(%	ς�����tG�쑥q@��ޔ�ͣtQ����d�^�����g"g�K3���ձi�C����!pOP�3h�R޾b�PL��~
j��ğ�z��̙�@�)��&�7�=<�J��EB����p�B��,Q»M���xl�}����U� �'���M�%Yڄ�]aLk�Oa�P>�!2�5��!y(��g!�dL���F7��?G}���y��>������u�3m$PsP�?�e/�(wA�>@�1B烁���W]�tU� ���>m�6TR�%�������y�;�v�{J�N9^j��D]D���g����$
���0f�$�3�<��Èy4���C����`��XWis��8�	W���'x�d%#D��U	�	���X�����g~����Qv�t����^���d>�s�[}���>/�Q�a�� ��������= ��}j]p�;
/Ǆ������@�?��׎���!Q5�jZ�-�(^��K'D�d.%,�J� )K%�Hd�8���lxL�և�f��;���j�Pa��2��P0���3��nt}�G��x;���#�'�6ҽm��&����(�\�~�sH]�cƉ�cS,9C�;=_u��̛�!���mt�������q�Hԩn
�B,��%3k�+�W���̓Ou�?�!� ���Z@K0�ޱ��hz[���A�#Nl,;�v���D�@Â����^�9��l���ɑ>ߛ��4�|6��9���(����y��S�BV�f�(���~1�l��?S����O�'��u� ~���p���NtHW��齗/��l�R"B��Jcnv�y`�LUpDlJ�4��/t�Ӯ�'&x�͘>}:KO�c?a ��C��N��dD�"�Юu�$(\Q	��y���<akoX�Ǣ��GF�s��$��rFuH�u�(�uǸufk�`�w`��~@���/_��W=+�[br����;$4T��@Æ=���##�p���M��;�U{�n�X�Lx�Q(��n
"]V�ȱ띎P�}�C'��G.�N�y�KN1��w}:R��#�bD���b�E��p f��!�x��ːr�&��A��i�ӄb߬Ot�N<���D��E�]׫�Wm^�͌�4��}/��\��7� Y��<]�+�zQ�-�U����ե#���?0��L�u�)O{>�.6��0��L����Gw%CUX��rqؔ)6>pBE�EO��H�U���g'⧷t'w?ê�n)�-d�ooE�J1P��drp��m�##�,����X�i�jlW�Yu]�]T����p7З�i��2���\>��:	��k�(�L"�#4X�6(���"�L۟!jN,{pL{��h/�Ĵ�X�J�͓��-`��w�p ���,�Ftc�0�:�rQ����Ő�d��߶b�P��L$�x�l.7#��ooCf��d�H����h&@��5���.��.��*69zK�K�ҹ�|�g6�����%�ɇ.�6�C��nI�y��]�*B=ٖ������z���2����QK��w1Ba槠fu���n�	ؒ�u����(�R���<���%��HG�-�J �&�V����]C�Fr����x;#�0�%�y��B䠷�A����ƚ�E9V������cj�Q���X��+Omɤ�G�� 2���OY�y���ɻ��kҼz�m�)�/� �I ����\+��M�q���>�^6��b�� ��~�3�6/]ϲK�4u��+ ��l�L��Ǆ�7�',��jn�{��B��\>���}ֻ����D�I9�a�;� �8��;Q��+1�qZ�x�
�`.����2S���2(n|̫��a��F6VMs��cRG����Q��l0&	�a�����<8_��a�O�ɐS��W8Uv��c�bVsq/x�;�9B9�NQ�S
B�ɈBL �'9��F��O�%O$��e�\���zl��I󁦓�0]}@>8 E9q/A�2��m�����/�Y�^      &   y  x���A���E�Y{�$˖��^A�����(=yʊzp"��v��S��(bȿ��H��s�ʟv��W�*^ū���;��o�[���_���6܆���v{k�[�V�o�[�[oo[߸�mxކ���=^��x��u�^��.x;ގ���x{x��xށw�xGx���6�rN(b��^uy�d8� N 'n�v�f~��N@'��I�����t:��NJxop�:�n7��7�Ǻ~�n7��7���7���M�&�M�ۿ�pq�U � M�&���Iw�
�d2	dW��
���	�dȮzy�n]��LA����+�[Wa�0S�Mq.�����yf
3����.��ͫ0S�)�4�]uy�ݼ
4�Mڬr]�~���M�p���?��a�e���NA���@�������X� T j �qt��CQ��PT(jP�u�9X����^VH*$�$g������000�8ԅ��-{pW�#twuiii�۰���(�_wg�����:��u.s?�����1�2_u����]�Z�Z�Z�j�����HHHK ���wxxx���9��,�,�,3��]���%HF��q�������.o��m 4-��Y��1F��no�� hpV�혗k���o�� hpV�y?�����C���Ђ��~�8���p�����h�qV���ew���`i��`9�4?��v��nq�����i�sV�r��׾��@j 5�Z �U|�����6�X�Xg�V��o�����j���u�����µµµ�z�����
�
�
�L��*+��+<+<+<k��*+wWXVXVX�`Y�UVw{W0V0V0��x��:v{�F1���g���|||5��I9���}����ુ���q��g���B�B�B�=>�SE�\��W�W�W�W���y�~/����-�*��gC۝ݠؠؠ�xZ���H���Vo7X6X6X�`9��>��=�4x6x6x���My���/仹PPP[@m��^�Z�TY�C.�3���ݠڠڠڂj{�T������H�3�^�� �l�l�l��=s���Iff�_��=�s)�K��K&���[�퀤C.������ t:=��\�4f���t:=���I��p�}7�C�!�� �'r��k�v:��Ds���@d�A����g������pt8zp��)��e���J�����v���=�88�N�{әf��=qwxvxvx��9�p��ϡ�ÓA1��>�k������<���Zݝ݁�]�ry�����1��>���6\E����w] v v ��x�/}�!�!�!؃`^>j�}�������߬m>F�Ry���D1䲏����k,�����FЛ����ǘ���� g�sD��{�000�pV�7�_��C����������XV���K~b��˪��b�������sV�A�ǂ�3ɀ������t^�?��T�b�e���k6^���#���x}7�������y�\��4�|s�)�"�����L"8�"&�D��=��
��I8Q/�Es����H��&ߋ�� ��D|�>1���5a`��+����}�;�=��PDqEL"ġ�v4��a�cw����%%�{EO4�� ��D�C��j/�wZ�>�����]~�_�{�$�A1�@�����Vݫ��� ��D�C�W��}��D�uEL"סr~֛���`Q�$��]�㣱�\Q�$r�]�.����I�:�>/[�r��\1�\g���$���vEL"��uy��&�A1�pg��m��y#��D�����؄;�"&�P��ݽ�~vc�� ��hЛU�8���nHg3� ��D�C��,L��Wg� ��D�C�n�׫�� ��D�C��X�utB҃(b�3���yO��ۛTQ�$������Zw{�� ��D�C�����
V�D�H{��H%�/�Bԃ(bQO�5��K��QĐ�-��Z��-$<�"&��D�f��ބ;�"&�D�{��D��t�^��N�lQ�$2��װ��!�A1�L'��1��� ��D����D�vEL"Ӊ�L嫯�vEL"Ӊzy�;��� ��D�C���{fO�}75���I�;Q��|��B��(b�����;�D��v�]�3&����:�"&��P{?��m�2���I�:�9��\�l5ݵp���oQ�7w�������&�Vҝ����pM�:�~�vxO�/�~�`��n58���0��z@�rk�7��z<��(����ο���)�ә��Y�;_9��[O�y�9�p�K�;[+i<���=?`X�;��K��i&�l��Sqiz�l�������ع�yz��4=�k#%ˏ�|;���#ڗ#��f��<E�#M���TIr�i.�\�<�&�~m���a�4���)~'�ڿ�5q[OW�}ޑk�on�ܖ���J�z��:ݙ���&{���K����A��������wԩ�Ɨ���`�����W�i%}��+j\+�;j���
kI�F_�ō5�}5|8���|�>����9��!�'}��ѝ�-�����9#�謴4:sn�wx��]2w�9���m�s���檧q�s���z��7�Li�V��z~��4Es�*�Ѻ�9��͒<I�ix��&�W6҈ǯ���!�wwI�m�����#�m��9��W�N����6�b��6�fYP�7ITR�ۏ�ɏՖf{�Ux�{2�@�3��;	m���wlS�4^q��w�b��&�:��MjM�g�$C\�p�y~��[o8�'y��{?x,�I �Ƿ#Ɨ#�H3��b��=��y��iM�gk�.��o������y��*��M����]�JI8+�;���K��{��i���~���ߡ����4�r�q������ϟ� P      "      x���Y��F�D���� ��&z��:޽`fVI��:�RU)�0�h>�u����5�~�ר�k��ޯ��u�{��_m�KY�=��Z�Y�5���/���~��~��y�����?ϫ\�5^���6j[}��z����]_u�7_���"�Ϲ�k��U�U����l����=��^��.k�SHu�v�R��^��>/��Wy�/L�l1�Y�����e[b�kO!�BjBZsr�����C�����V^m�[E^W�^x���6 ]���~ ��k*+!]�y���Z��{� +7r�K�-��+���_DB�C5�y߯��L����9��%�x�2�*Fmւ8@֐q�wdr_�Q^���º+�/��֚�����.�9�������nJ���|�ڻLW�Wö������ľ�m������u�Q�\�����?��
���G�MH�g�w�XTUF�E4���AP轼W��Ԕњ�ꫵWð{�{a:�}!QT�ڻ�ŗ��� ��RN�P��n�\Dۯ8C)o��)��BSX�4����g[~�/G�A-�6w���r-d�]ݣ�6"���� �>.���GT�z|^ӟH��Ƕ������*���l��k�&�d�YѬ7�݉��:.�9#���c��k�C7]��
�^+����n���h?T��o-��",��U�h����������nk����YEt�i�ZG5 �����P�uϲ�Ӧ������^[@��1�� �Z����_���)���������]�TPm��ԋ����E�\)� ���Vٽh��Y����kMl���$2�� }_�_D�%�VT[���Wŀr�U/�������"1B�mw,���r<g"yDu�����E�3�²������#�(�.Q��ֵ��Hh�]����]c�T�=W�W'��ڐ�.���n޻o#�޾	�E}��0��w��%^�I�-�fn�Nn�x�(@��_M){I����`�T܌����!�m����ĝ�+qup�kw�N$�~�d�����|�@7`�D���ZĶ�@S���os�"3��Ո��4A ;��b�8#F�%A0��X;�?+)t�	'H��E����
o~eg�"^ɽ5��TP��+���������I��}r	���`�=4�*�<�W�F�b��6���Z�������Q�]�%U<?� ��x�������6��_d�\\���Wn܈�NX~u�"*2&��D�m�j7�E%{q�h�$��I3?5��M�RD%��\�--q�T�_�c޲��2�`�b��0l��n;�S%�-m����p_.��Խ�=B��|��y��r��k��xc���Q���X]@�an��⋑xI\ĥ�)	�W,u �<A��nj�`h��BB�_�W\��zp5�f�j�$��T&��#�HVIZ�������|��pc��)wRqyUn՜a�Qq�Qdx��߸�7@p�zS`Io�u�D�Z�FPp	�z��c|[����Hޯ.�#���SK�+z��=��;h�����V;��0���3�2��ƻ�פ`�����^5"�k�6�P�3�oq�4�u�)�t��q�����J&�?�V\m}p5���!���x��!�f���e���TZ�A���!�~�j'@Z�_r�C�o9x����q��? �<�0�W_�
��+�=�&l�A\]�![;�gǊni�eR/Z��v�.H��"�Z�py��/5~xڑ[5����-zb��C�#*�*�4-�� �~)2���&Y��Ӱ,Ӓ�ԟ�[���N�2��ڇg��p"�~�X�G!�헶���ܙ,����ݒ�*ح�L�i)�6���"���"�����_�?/���d�4g� �GR�V�TE{��K[d�³�l���djuE\p�ˠK4%Mb4C���H�wQJ�"/�[��T8P��1W=������"�(q.�pZ��۪*�kz�b�bR�l-��a߼�\���TPq�_ԑW�_H�&J'j�.��*뾠u����π�b:~`u *�
�⾆�n2�����5O�2�W���e�HISL���q��9��԰��x��f�-*,��2#�<� ��*ʑ�!d���zu�rI�;�D�~�Ht^_��]�w��m:@���-	2��p
(�g3�j$Z�V�&!ҏ���)���4����~�N���R`k��/��7&|��#Q���r�qnK½p��fA)��=c�ȟtZ��և5�/Ld2+2�� +&��5��D`���7��7���	��X���oj�!��I�<�0���B�C����Ö�eEb{��(O9����@F��R"v��d 
��:�5���	--���yKt.#6���KI&Ǜ��ÁO�"�_͌��I=�������/y��w���$��p9`N��=�
c�j�Z5��>�f	��vFt�M�!�x�	�밳݃���H �mg$�Ĝ��}��p��a���
 $������M�Y$�B��A��G�v��S�'�Z�&f*��Od*�	հj�I'���6P�f`����b�y��H�[�V�"):h9�T$R�O��%�S�Cu���0-o�&�;H�Id��&'���o�s����4B;N�{��L��<L�C#��f�����@����!7ef��s�b�NW�^D
2�Xy�3
���#��K\�rY����J�I���?+���P�*��������
�_�1-$L��-L\��ţM|5�BuY��Ⱥ�ճ�'�U��
Ů!����Y���e�+h�h�AS#�^�7Wb')�A�BY$C���9bH��>H:vX��d$����J����� m��܀f�4��>8"������ k��Q��C�,cz��3 �e�K���	���C�]����H��ī���pۑJb-
�v0:
�DHAS4p JX�%_ ��X`^�����yRo�(�]"R���ě���;ɴ���`�doI��%O%1�;�TM�3��q�����>��d2��Z�c8�����L	�K
������nc���6�mVu�Q`M�<�K��T�hI>V1���N��K�`
Y�4L�f������c���w��~I���P~E"q�"*�1I�q*]pdb@�H�����(,��z�>H���O�mXtJ� )Ҳ�~Ȥ���ڋ�28���iK$j������������EF�f�z�_�xGh�=�t
=���tzE�o��!KvS�.�^<�����$b�hv`�ܤ�S������W�t��0B6���UqDj�a�-$yN7b�jQ�YGZ�@��!��e��i$�?���D�$�˶���24�t= �����a�S�H@ē��*	�Ȭ���+�C�(rWZ��S�>w�!d��>����ژ�5��t�E���\�d3�i��1,�4f�VB�D|z�;�nJ��9��8W�G	�8]�gFp^��e)Ј������K�7nh#����fF���h*��-�Q��_������"(d�-J���� �)��@�~��QU�]���E�ࠅ�}�#˔�F���{��:#0�h-�$�ݲ,�f9F��;�B>6�-�e�Ԋw;���W���ah��,M��4���B�;>K/a�Y��ٛ�®��ݧw����%�ZbRZ,�0����X�_�A������2z$	y�M ��X�"x��:<�j�t�����b��r�)urVq]�Z�\�V�nw�T���6�7$�Dm�N��L��HIUy��C��8B��0�Æ��n�,�"sf7����v��|6�2�%C� �Yi������8������W�ΥԻ7z
��P��4�V�e9�hlE��Ijg$��N]���9oB<��'/h��]T��2Pa��~���W�N�B>֝k"�FQ�
��,�����ޣP��\��T�)�4E���~����\��ܚ����;fv�f�S�=�u��c4��-
�]�u���1�=��򞏱�q�Xi�qK�f���\PȾl�)���x[��d�~q��H��+��`pxR��p��.�*s��%Ϻ��B��	s    ����dי�5txb��;�x�X/�Y��vfE�c�#O�q�ψ��`�6J��+t�'��a���[�x��x �]�����N���Aq�rR5�p�W���E����x�NNF�ͩ�����/�����x��֊;u/��Y�ʧ��v�؄��!d�k/Ҏ����J������})|�9Q��<��ɧ�E5�ѓ��a(JCiaa\w��M�% 4U}q���u�ZlR����p�ߕ��1z!�϶�~��G�!g�Z�s��1̢�����0֘���py�����j@a���u�ƫGF��%�q�ճ�3�d�F����zSH1�mg��F��fm��t'N	.O|�0��ô����9��% �!]��GvM�f��ty�T�{/��8�~Syw�ٗ@↳� XV�%12�M��;�P�r�!Y��������)_�i/G�6�>�ܜ�?��Hp=�;�{^]�%iܖ���2B����C|�����r[���N��%s�g�k'#�K%��8��N������P!�2�YנnVC��v�Ӝ�uM�ͫ��VɈ��.G�T&6�y��2k�F9������I'�3�%׾���sg	��Arv ���`��o��[6n��\�)��
����)Y����Ẽ�FT7| �M��ҞU������Ӝ6g>�rJ[����(Zt#l�jd+]`Z�ji3��l��xa����X�!.2lJ���]������>!�Y�W���k4�N��X0w���`�Ni��_9�i����n��R%G�}CԹ[v��`�i�-����6�۵>���v)��JQ�Q��Ai�N���Gzyg�@']*�L;V��F��;hz;Ts9������zCR4�l�]��L�.�����L������&�%�"& �]���1�;�}�m�q0�[��3*Hn�E4�.y�J�{[y���L�g5u�6g,I��w�(��~�}RN�ٍ/v�-awZ�D���-��Iұ�L҈t��Z�:�0oSϴ=tPKhL��[*���� H=7��i��(�6�F�|�̧���rM&�ޙ�)�,��ȅ�$�Or^M=m�	Q�kWءu[3�;ł��e�%�dQ䳚P]��$�+�-����du��kߑY8U�}�/Pw@��+�5s�c�Nߦ�Z�+\��?��B%x���#�ZZ"vv	�
����3�a5+u�S6�Z7��׌�n�zį�(�����6ܔ�
�=���6-Gh �H�}�hwFb�>�f����;�!�|�V�h۱�v����m����8�d<�;�o���l����<]��~0�Ԅr��a����˸��N�_ ���C���ZI��hKP�� roEt�yvKN��Z�����e�K��\��![x���*
[6��	Rf�~��!9�:�.8U�!�7!���Fd�Xi:��Ь�^n��6¡)rX�O��[�[T��͢����=�l�M�����RL�Ї����\0Mt��`#"q		��b��b��2'1z�c��f�ᴍ:5а#t��o�a�\�ȱ�������N�|j}7���`� ���>ax�;q.w6�\�B��ق�W��dZ�f`��8��c����WwƜ�B�3����b��Lq����U��������1C 2�ԗr���h�S�=+���w��_. ��`vj\�*�q(�p���ە܉�N��y�⒀z��Y�?g�v�Dn\�k��j�cG�J7�k�魅,�
ÿ�ٍ�"2<:�)�FvR�Xk�����"��.m;"�Cz�-ǎ�[eb����v2�CR��ڦ�E�&覝�S��%sv���}Hu�{m�c��14�&#aJ�v#��S/_r���z6_[g�5����n�� 0ga}7��:��4���$����%�$�x�3v�]�2�SD</��`p��kZ
D�e�"���@�]/��6�~<�"v�X���(��:g*�s�5�ԟg��j��ق�j@O�T �����<�ܳ�}����3����R Lс)`���L[�H��ր�������jm�%����n����C;]�њ심�lt���5�(�^����ᘦ� �ṱ@�hf/�y�8w�x��;�~���RrvF�;���Ja|����c2׳�2�#����{�is�P�1��}���� ���FÕ��Pv�fsw�4!]���f�=#,X*�;����
S@���
��̟�=�a��2$c�(t�g=o��X�/�A��W��'��e�}iues֡8��˸�{w2A��ɳ�:�뙶=_�@�>��|�~��>|���x�|��9 �Y���#��	�����.�W�}��_d��J�p�2v�m�Θ�OJ�ҟg��w���կl��8�p?��ӿm����ܖ?��q��|S<������1[A��Y���;�i�'ϥ�7\5��f���/��$ ��yJL�P9����$�+�	���,n�^n,�N�~�t-��R��� �0F�[�<~g���N����4[�h��h��0�.6����#�����v�T]4/9o�6FꙂ�](���t�� ��ٞ���s�`��jc��raQ�:G +�49KbM��P�U�G1��6i3gЍ���E3�+��0�g)�as���Y��f��g�#��n�P�ū׳���+2W�OxwM�C��4�%���ڲ�zF2Zwv6KS%+��(�?�ŚH��?�p�r�k�vZ=� �,+oG���Dj�;��g�6gF%�7J�;3Sl .�����S�o{���g86��0�)ă&Tك���?Þ����`Qrи���1YM���n[��p��?�Y��%QI-g����ݷ���,��_�i[�A}�����#[SͣIŊ�*a�J[�}�����~V���2��#E�ٸ�u
	�O�?̗���p6`�����k���=�a�6��g��/x�S�}��i?����L�cm[2$��
���;�1DC���r�f7~��i �]�v�	w�ك��r�qYq��sR���ɍN�#�4��O��ꁕ���E���L�v=;�G�!'�`���Y�u� KX6t�ų�`iv4m��Cz.'�����6�V�q�;��ΘWWhR�3֜w��8��p2�����"�+�?����2�ֹ.O���T�u��2O��J��y�wy&�}؂8��O�ŕq�eu��*�g���,����n�9]�g�%t�sĔ����7��f�@��˾�.�*97=�4	FA��<�gS��6q��]W˕��.��_��,��q����u�7�Þ�v���qZ��O�k�L��s�
^d�+R�m1�X�yL�.�0 e-�§c��wS����D���<�U��l�����8D1��cO��t�"�J-۠c�),��!���i�п0ԙ�����1���㳅WĐ����І���)�-Ͱ.bx���ᡵp�L��Q�F�L�킔���ZY[8��P����9%�	�0�A� l�������R�#L��E��o����:���,�/}xr1��l�3ɽ��e��G�%���w��~7�`Öx�$8<�JX�E0PO@�<�v}�x�1��3��c����̕�����t�A�J䕖�k����l��YY��oj?TR>N�sɏ4�]J�����=��E��y[N�`�/�A�3u�<`H�(��|Ԅ��hT��{����Ϻ�����.�+ݓخ�ɾ>0FN�Mr�f�F7��a?��u�~�f�Dm!��ϪE}��?i���΀��c�?(�������&ǻ��$Oj2��Ԧ��)��a�zyH������%�fWIZ��K���ٚw�	\9�6;�o�+n����<��������������_@|0TO�7w�#��%��0�E�g���˜�a�͑92(�N��ryg�K�!�����(��/k�lD�u�6��~d���ok��9�;��ĸ�oV��v0x��C�O�/v���O�Cg3A+��e9�I.�Q�9���ty��%H,+㩌ҷG��Abm��5~5��ΟgU(��}+����ZO�Ս����ʊD|t��V��ߪ��#exH~����k?��Hy�����3T�s  ^  ���+�_Fq ��Uݪ���r6L�zkKm8��Ȳ1�0��t��d����7��6���n60^���������Sr�~�󔈫����XSa�) �˒#��Ut#ͯ�9����>��i�К'��F���?ؠ�e���;�U�?��p�� ��.Ѭ7��"wT�®2���a(\�"8o��Ʊ%힋K�yn���v*���eo"s������(�?��5v�Qڳ�Cb�k��a�|��m�N<<חL��$�4��Q��4>e��z3'��<g�3�F=�*h��G�9��΃R�yT]�]�3l<k��N���p9�%���p�4�]p���Һ��w�4��nf�B� -ƦÝ������+g��9�i���������A�`ѕ�˥V:�.�vNG���$U�#��9�0�� O�6K[�uJ�cӜ���`7��5����W["����	~s�6qet����=KI�J`�8�����R�6��P���8�R��L��'��Ȗ;�.F}���,�G��C�ca�������+�/�� �9�8k;n(8 '��tr<�"2��{V>�PյQW���3�ߏ�e��<٣O���������n�%U�:�o��}�n��r�: _w��NJ,��X5�p�(9����=���`�}>Ǒ�8�K�O�aWu~���\���n�v��q� < '���T��w�ܘvPj���ᒤ��6/ﺦ3�Z��_5�����h�YHJ���,u�v�÷)��<"�)�9"�X���A��gR��.�Wf�%' Z������i�����]�+'�CP���ck׳S\��9p��(ן����d���P@(�y��Z#yL��/ǵ����s.��rg~�����%d}�O��iM��s�X�y"���~v{�"���֟Sn�d���a3�'N�/H��-y����~�y\�p`�����y������g�����V>M̬?}�~v|--I����Ɇ��0���� �]�V@۝�������������F�ƾ�;g�z?��1�=���s����A�C:���<��"��|�Q6��x�{4�MO�y��p�M����J��5����-�s9�i/��\�Q���?������z      #   �  x�u�Mo�0�3�cQ�:v(����.i`l�����K�W�H;���פ�����0�y�f��KĻ�7����"W�d�	g���_�f�j�7��Ɨ�4Ga����I�Yؤ�"lRr6)�	���Q�r������/�<�~��)����~�������+�򞾾}�:�=�_O��L�4�Gz<���DPRe��^��}��"H�}�5u�`XE�����a���+#�X/,ӷ���k(�Zթ���.�_�ۡ���dsu�w<�
��MM�%tκ\��b����������U4�iYg=���Sz�-��U�b�_C͇_r���Ԗ�"yl��!���T-�hk��;n���z��	�=�}��g�ō�a�jz}4���Y��A����6���[T�`m�@���^��5s'뽮����6x܄�C�:���wx�˰;���O���6�F`4Ղ�=�?T�V�����I-
AvN�|��v��?E��      $      x�E�ّ$Ɏ��y��&���?�jٳ�Lu�p8`0���k���g�3�>��z�|�oݟ����2v��ﬕ��>}~O���>�����̾ʚ�3�>�z�}������������������s��c\��v03V���:�3�l��;}7�܃��W���-~��~���N�Ǻ�}��\�|�����zo���N٫ig|��v�=<O6�gU��7�꣜S���ڻml�vy�q�g~�Zoh���Vǥ㔵1��최�5�	1�n�uߍ�v=}p��s���ᱞC�ϸ{pK���^1t��[4t����p���s�~K*uih��%�3����y��sן���e�Z�ng<晗#�/����[[�_���N����ccg�yjY��]xk~V�\�p���p���m����(��;�v��D��`e_�ȸĜ�-'j��\n_pMKK���Y�A�C�c֙�ā{s�����K:������O�L���K*��/~�m���Y������;��DAC��Q�J�t�5^�Z[�b�#��8�����5s��F�6\��,>�:��_��7ι��	����	t,m�]�K�b�̍�qa2���z��.�}�|�����.׸�br�������L��Y�i�_c� �!Ё�q]�����
|��&Թd���^W6'��	��C ~��~Z,�nvr9}MS�|����ՒIS��(�������šu^�6~g"�J�{]�+$�9~Y����+x�!�,��|o��\�-����c�K;�$�+��Ƌ��s��Z��J�`k�|&�W���}_:���t����9\���e�bl�=���wya���"�H,���{@�YG"�H��A	�Ѽ(�];��q*��'-��)<>���3�4���X�|���<!�KՇZ�#�|/?��}y�I	ٍ`�svɴ4ɍ����F�.�;f`r���iԠa�5>��������Z��z���/�#�e	}�J�]���&�W��rԻ�I�9 �q���P5pU��M��cC�
j�X0	Z�����ה��)���>"����}/�a<�d��"5I �^����Ӡ�%������r Wi����Vp'7B-�d�cW��t��iq��B҅���3ʵ�M-�ib��#�2X�$'�z�Z���zsG�IXO>��L�MMv��L?��Uv�cS�FLrQ�;LR��L.x���n�G���qIw��u��$7�ȥ��d e	��vJ�&�����\��:0�GR�ڎIj�&�ۅ������W����H��dǟ8��r�{&YO��Q���(r�t��<��+�Y&'izs�υ��c���(g�܊���ܝL2����ii�$6oR��"�_��)��gl��<7ɗs�R|@�ٹȇMQ#�u��f!!@@����p+$�旼�,����7f���\㻯AD�(�$���	�b���s/�
<�M�p)m�Ji��#�L��x����ʹ=d�h�ϰNpz�����O���� �p 9��S��M"�E�j�`4�V���4>_�|�� �fH$��K�Z���? �ԛ��ݨ5��A�
;8���:����#s�!�x�)�qJC��-9�ԣ��Z�x���i�2��;�եP��OБJ���)���F{.���U���ܙOӥ��!��@уG@����d�}�Ty��c��d0�%�
�'l�|G��:�zd"Vi��f�5l���Sv8��z�bALq'�O�簉Y��Ժ��{>�R��6O�
��N��S�)�f��xDX�2��sOg��6�"	:E}	N�er[�.zl¨p�~� �lٞ�^o�.�L6Sꦀ1��� �"��~���f,͉n�f?���rf�N� *PfА�F�o��[�CN�D�)	bb\VsE��C��Qp��ր\ا�Z�8W��58'Qt���0>�����C�����Z���z)OJQ�5�I�r"��NGz�������c�>�V�q�`lc`<R��d�HDŶ�w�Bդ^cZj���+4��B���RM����l��m�|/�>by�i� 䈼�Rd#��9�^���s���d�7�/���'\K�*r��m/H�SG,�ls�J\&5��+�Ϛ�tvj5 A֯t����I!�����E�JԬ��敻�k#��`�(i#�k�/87	�ănk$7�Bsy0��\��y���<{��#3?x�c`R���m�V�T��#�MG�۴Vs6�8�؋�&[e��4�ܛ����|��*)Z�x]�L$�K�9�݂��Eۼ�ݓZ�L���������2w5��
LzN8��DxD%tJ�y�/�-�<���#�Ak-��(�o�dNXO�7a�����|���_tB��dL����2%�~�Z�m�u�����I�I�Ӫ|_k#p��x�B�.v.�GZ&;�ךW�Ӊ������k���,�HI�"`+�ڨ�6�å���~�B ^K����IG��u����ć/�cQi�7�
<�"�T��^�PQ��.{C]���ՠ�X��4�F,|���Ǒ���-y�� ?'�|m��%���<	����-@��������i}��{<������	 HdVz�}��ZBhh�S¯y@E�N��0v,p{�4��r&��C���5�KԶd�\^�;��H�O�D�{�M��p��(T�2�&�y��Q�Po@*�N�R��ڔ�c���n`��T�������y�6����g���/�8Ta��^�U|͍��I�����f�" n'��g峸;Q�����4E#�7巘�X��)`�D��0�_a�~���Z{`�0�S̃�9�.�ZA�m�������#��oP����'�@�s�RT��'����8����|�6l%�&N�-�4��:��(�� ����Y|b��D?�<�,�;Uʳbo<�B&ьN��ot�;}�c�S��:�`h���[�̥7P�%f����sa_�!uŞ(-o�$M��S�Ǟ�U��U)
T{�������wv�bFU�Q���V�2B�L���rI� T���%�< ���j�p)!Qx�#T�툍]���mS��J��}����B����	:q1a��(� "1#=$Ĥ���"��5o�c��uQ7sH{��?M����t�z��p���[ر�E���*w� cN)xߞ{�Ʃv��w����n���E��JuS�V�-�������`�궷<TMd�|�R����R��f����]{A͵����eB^R�9��M��?���ҋ�ŷ�Ї�p��|��������b�EX�V�GZ�'t2�����胤�O�
6�i���@�Ô�M�pwU��Qc�4��g����9�20��J�Ī,P�5ٳ���|��ʊ��F��������7$��(�%>Mq���t����}�e�!G0���4l3о�L�T:��s�t�P]x)�Q�:��R������o��T�[�4��e������p�b��ױ���Q.�6�/7F��I6<�����/�ǥ��9>L�;����@��n<�f����|�@w�*9��G�IG(�gE�X�D,���������J/k[Q��J�J�oND:'�(\%��W�>��;����5
��8���t�A;c�)���Z�H���ѻu�c���_�r>'�ul�Gt���F9���y�Fen��;�/�&g&��[4
W�<�R�ο�g��`�K�Xӓ�6!ܱ��ө�$N��ߴ��,�w>P��`(�c�e����s8r���ޠ���ɏmK:�H1�ƅ�:3��#.W�\�h�`7�'7e>�J������gRr��ƨ�ܤ���}��)�T1
5Өr��/ ���6ˉͮ�>�<�A�_	6���)�Jt�#G3lq���q�P�-�jL�8���r2��K��pt��O?�=��d�x)�e(�5�q��&�^�����+(9�ݚ:�P~��7��.��Q#}��VYǮ���T�	Dj,�F˙@"
4���Hx��H �  ˎ<��@�2YD�"t��W"�F�8MT�{��,�[��9�s\���<���]�z��Y����t9JLc?(��`��[�	`�G�hvػ4�o�'�o%�,�-:YsbiI�hW�w��)M�O��>�����!�`��Pr��n�rWԼ��b�A����ݰ#S�n��hi�?s!���9�0�Ɏh5Z�~Q�����>�A�� 6��_#�3$ 2wdXǆ�F	���sp�1Z�����|�����^�3�ڢ�vm��?��F�e�	��M�
��D�I�)$ޒ_f�H��$�1�邸©4J�ͧ�U{�D��n>���&�`9�@���w�������c
P��*.Έ�����M� ���[��`�j3�0X$|��a��S��,=mF�b��=
�
?P���.���u>|��ی��6[�����C�f����_��I˞��"�3� ���ڸ��(�"������4ޞ����_�f%���� .���;$�t�y��$�̄_Y��,GL�G����c[�?�1{z>n����WD:5�1(k�z�מ�4�6vf�*��|����b/�Y��4�9v"]���)���$pK�SXN�I����DT�?�Pr8ݝ�uU�n%â��l�ͭ��Vl�`ǡv���t}	 �՝b�Yn�tW��)���5�U&B�gd��~q9�L�s<.��ިp޼r��۪�n�dMȡ.W�1�:~����s�SB��
��9���Iܛ�
��~���c��5^�=7&<����Q����S9p=�!�E��9ҚR?�(s�e;�=����{'JR�8�;J8�kh�s�RQ�WE,��=�H��p���%�0���v�g�f[H�����[1a]���\�(�nuQ�a� \�<h4�t	����48v��9��;�*T�e*���_���Y�q�,bpHg�;�R-���!��V��s9d���j^������ {)�<����u%����-�v˄HkI��,ft[���S�)���U#��<$�H�v��YHr�e)�J���03���h��u�t���m����z��k���޷��|�*zSx�y6��+9Ry�.|�����d�#��1h0>A'�b��Z�����ڛϊ��p��Aw���Bˁ2j%k�d1��9S�(�I��,$�J\oOP�t���
��3�G+�(���T�����؞l&�'��������aM�����E�4�$�c�i^0\�d#ܟN�g�/��n�N�IG\"H��Sg��2�'].�u~s0������+�mEC��1dȷ�t��ۛ���5,�v��|�8E5���M�YД�`��_f8��,j���cY��~;�����]{g
�G�����Y#FT�,���IZq�H��#��/��J��
�#u.�Þ�ȩ�~�E����ӭ��u����I��B��j3�%�u�+UnR�N�csy�Y;͹� �4��6�[�.�Z�g�]3~]Q?t �P�T��)#�7� ����5s����3�~��
w��������Q��u��:��{�B�t�:��Cw���v�=����e�j�Er7C�$�VQ�^QU'q�r:�.��HF�c袟o�3���9ë%��Gr4��@q��C�-�M����Q�?Q����x�~Z����g�*�^i9�׿u�j��{��
s2e/=���ɥŞӊ���P��R��p�R�?�LHe������>e�0z׸� ��Q@�*��v3c��=|n�fA��٫��x�Z����C�+�>�[ǧFY�s��b�u�d��k/�e�i�z�]xȉKe�Y�t����]�爏��/�Ҳ�8�])H}o��i��<�*��i���]T�)#��cr�����|�g�b<)�g���`�"9���B��I]r��K������Ew�\.r3 U4ᙈo�Q�ݯ��O��[ڡ����>������"��ZL)U�>�<A\�H�8�`+��9��E���0�Y�=�5q*c��!�S�o�۳�W^���y�bC�8P�PR1$.a�r�a͙",��wA5��Rx���xt���^G�y]"d8�OԞk��*�;���?p��|~Z`yf��p�	7'6X�#��*o+�ð�X;�s���4]t_W��{@h%�+t��Z�E��g����N�]Tq=�w�}ͥ�{�$Ӝ��MʬY�-�Ԯ�����( �`FX�k�U*}����j~�r�q<e����JT�׻'�Qr*)VDW�s���cɦkwY�o�g�55��IS>u��1%'&�f�d�ݧU"�w��*��\��{.��z,5E�s*P?�~ݬp-�~l�[�t���f�'���4Pm唤���l�d#�K�}9�'g聻2N��=���M�*5�6�e)7�͌��S�8�)�a^��V
�����N+�厨���%K�.�S�LJٙD��}��N40�¢�<Ǫ/a[�0�dB�7�s��g��['�B88#1�m2�y�yp���r�k�{���\�\��C]
~W0|8�~�z�����"�%8���l��O��0���M_��(��2�����n�z�����TZ��QD��
W��T��,�ne8��
�ʊ������ȵŧ�qN������I�v��̥f�G�_�ҽ3�<�� ̺Hw��v�O�+v5me�͌TH2�6�Z<�입R���ղF�=�g�iU)?��v�����r[��6|��pݪ=������֨��U����+3ZG@�}�,�����v8N �_��~�'ᝪ؁�ն���Ϋ�&�Vw��� �L?������4!��5y�]sa�8��%�O�*(�8M�ڊH��(���f;O�N��C�KF�=O"�����Ib�w<2��Z�a�肀���Xx���<� v���-.=:�e�P�=�/7�O� �L���O��Q��m�Yge��6Av@��2MQ+���7}��]w��fK����]w�T���%/�W�rBw���aw�J��j�s�����_�a��s߳�V\��N�d��-��r!��Y�*���|�۾�����ٲ����"
�*�N�o��l��7����R]ƉE����Q��I��8{%�h�[��X������L[�^
����V)���ƽ��征%b���*ff. :�M�B(��Y��s�Q�j���j��9��#ϋn�y^s%A��Fn��RNvU��e[���Qj���k>n�I�ޞ��l4kN���/���;��>�Kc
�P��?{[���κ椧�ywm�n���NL�jF����7/=7,|-�\���7oT�|���W³�W{�f�*:�s�@6���Ak�9]IO�Zc���<��'��K/G�b_��M��D=}��]}�(���P�qt���k�����}�Z�gd�m����;~��9�˭�������jegG�}$���ko3}����l��.���|�k^f��a�#�@�L�]����,���f�t_mq�tl����o+I
b�ٲs<�9���^�Q�i,}1#̃�vZ� iS�\M��`�f"�[x�2�^ x�G�7������H���
'�0�Ҥ�>�����:�j�,[c۸��%t�-n������Yx�^I��})�hq�Ռ�����|��w����MI��.��7��W�~�Aw������4�̒7;��J���$���X�^賮#��e��> 2k?����/Rl�%שc��&x;^���9[US��E�v���ơ-t���\�VHw��Jkmv_y��jd��iN��(�*���Y�����ȹާ��_瑾Ǜ�u0l���r�w q�}��q!��mS����� �P��ٴA��h��i�'�U{x����Mn�W�N�	�K��2T���D�D���j߀t��p�%�]�|�u���T
<����ژӅ�8<?��f���]"����ڔ��'�9�c_��׍+.���7�F�̞Wǅ��>�[%Q���B�Dk��?��}.y�_�U�ѵw5:��}�r@��S@����Ț��̾�WQ���ue�R�k�������:��      %      x���Y�#Ɏm����o&�Fp�?�Z�撻�G�* +	("t�4���x���s�)���s*���x��.s�<�|��y���|�������z��N�o'����w�j���X��W���'��;Ͻ�:_���T��VȮ�%M������lu���z!%���)7�E��%���CxAbo#����={����7OKk�|˯�=een�יե���GwKcU�]zF�W)�Z�Wo�:f]������ֳ�_�~{���e�V�-�y����!~u?c������{���cr�W��Funm�Z}�����}����'����V_��B��a��ϪO|�F�^��u����x�6��9{��Yw��G��Sq��]kۭ�ؿ��}�1^m��M$(���^��H�x ���}z��U�CJ��k�°F߃��W_X`��~Z`����د6߳���{�������u���)������c�\��[�y��^e�G\�jDH�cVk��|NJ�4�S>�TJy�7���$�X(��<���'�~�<��GY��w�{��mU_;�����n}6MW�\8�*�=k&.VXj�wV�����S���X�௳q[q���.��������cb�텗��:]�[�-�PZ�c75(e�Z'A�=~N�ΰ�������_�Į	Wz���X:�#�I��%k������̕/��WТ�N8�|G`�;�9c]�+�?�k �w����Pn�"��"��@�22���-a�Q+�೸������E���7Ok<XM��o�pm	/Vz�k�Wŉ�@t�A+!�E�C>Ꮧ��U���s��h�p�p���C��8_���=>����k���;���|n�VQA�D�������lӀ�m-9	U%���q~΃SX\��d�9�
⹈��P� �r\|��A�8.�=�?En�gD��4�#�0l��w�q=�����@_.y"��政�䳹%s�)��8�#��t���ƫ6r�/Bb��n������8&H��Bs+r�b���G�*t*�� �&~Hf��y��\Zie<��@�mx�Q
(����y~կܓI�U�o9=?�����2��!��k5�x1��A����^D�@�D6ڽ�n��`��5d����N��[�r#-�B���@�V;΀w'bzi$a�e:����zבt2:���'����/��U�{a�ւ Z��ǥ���#z�j�b���%@~�f - D��G�_���nR�a�܇w�`�Iw�٬^x$pHn4��5��D<����ܼ.l�EGܐ\^�Ʊ���`1Ǌ�>b���`P��p��bb��N�e��!e���a�%���m�� ��$v�r�A�����_g��ݖ8��,�jf�;��a��7i�H�<	��Q%�/Mq4Z#��9�~ĶR��O�.�I��)*����!�t��7p�#+�<=b:��	�ut��� w���:.��Bv�&fd�����d&�8��o+UJ;X%�×�M�"�H�|n��&0t+�'�(��ĸ\s��~�S��� h#���p#\"��q/��m�E �>O݈Llc�c����_�C �`�Bā��j�Ј\�台mOx�Ń 
�6���}0�$�k�]&��o&��45�m�:-D����	��pr#7��/;ؾ���պd��!�Ŋ��󽲎 F��^)d摖I��
��a7�QdBw��G#��"�0��@�Ԫ6oǆ�e�C.�$�K�XrFٮ��(��*TO����DBu��N!��Db���[�
URl�b ���F�d����`-���
d�qA��.G��4�dt�W��i�obBf�Q9���P����Ӓ�@Gp�!��8�Q0�,�5�S��W �<�~��nO��IA�f@�T6�֝ψ9!h�O�x�S�JZ>���S��Bh��w���!%|�b��$�u2<7]! ,������"�p'�ydX|^��@�ۏj�B����j�!�l�/)�S#�G���'�(���F�� ;�z-F�:�O �{���\�p[p�D�T��Y��:�6����T(4ʑ�7����8CD?B����>�@��t�'��䯓;�-�A]<�1 ��t�k�IoN�ūڑR��p�fՉ!a���C�a����~��;���6�D���V��'B�׫���ַhG�S{?u�eA��A�L6ƅ�+Sӈ[�!=D�&�A�H#�Q���2Q� U5�#E��b"�!k���U�v �%?�j9�^�1��Jj}i�O�1J8T���ڌ T���	� ������+HD�G�el>
�	k
x
� T��*������T	(p	������ �R�
]�lf�6�u��r%�DD�����D�ɭ�a`0`~�zN�o�a��+�گ�� ��f� 
����l�I�'E�%9���@�eR_�l�_�Rd
jA:
8�L��f;E�N�y
c��H��m���WԼK�j�m�9�~	B���s��v*o�~�]��e�I���c��F�B)zZ�'��W���ڏPN<�L�]ayD�*ʣ![���L��b+'(M���i��5nP{(K�$R4N�9g�l�Zt���s92	�f�U& <�*`�Q�sQ��e�-Z�u������Y�(���jDN�#6�2���:2��v����u�d(���)"6?�lEmU�{������L��|�s�od�>
Cep�낓���Il��B��dY���~��9h��'���� Z!������e���E)8�:=�M�ی����z@��ST��=�'�f�=�)��*�%��+<�r�z�( �|;�!h3�G�{�W��I��+�q��Z�/�u,�bs��w]�{�I!��r�[��=�,�&��sR�5ի�e<���6���e3BY
xi>!c��ӡ���-�����iY�W�e�"��j"��(r�{����vuq`6��!őo�iQ���!yP
���d�i���k�V�6t�K�n&�>��Qm��f���9�Dv"�$%��**���UGn�4�g$���{����s*�������UV�V8I��@��.A%|��e� m�轢�F70�k"n��i��iIp-S$� y��d�+��Jjl�C��<?<�ڻ%I�,���|B�n"ρS��l�c��]hYs�3&+<6{�W��� �����������&�Gc����]H� ��ً%tۺ4D(mP� W�����G��t��q��۟�в�Fԑs����?�� ͟�v��B�ą6�BY^t*?�O�i�?�@�d�۲X�p�����e�]����侥:���hD��ˁ1��ٷ��Ř96ť+�d�FM҃�/�����Y%��WL۰q;�r��Q�:.�����jH�>�^4@:�	��+ST�K���;��;�Y)Awr�h+$0�����f;p.
����� ��iTg� �H���Cz�U�дe�Ԧ^r&Aq] �s�jA��-�p���Ǳ)�=u�(pxo-�/���3��Χ.BBi!�8�h�)jO�j���=��v���׷�
 Ӳ־�����qix{+V,:?��F����ziŴ'0�4ό����.mТ�;U犆;�I7[?SA�`�r���� #�R�ͥв5��vIqb�d5K|I��<��N�pb�=���N(r�>�ˉ�3Z�Z\*���6� ,�}آ�z��y0.
���";$3;%�=� `���f4�w�����e#ƅD-ХRzI��sT��&f�1� kD�*��г~���s���mb�h��*�\�^[Î��f*���l�J4kŨK)��`��چu0����F�c0�<��ͪ�c$`��s2�'����I�kx�QL-ž3@���]fg�����&�f[���mz�i��kN��s5*���4Y��9�Cm�g��ZTk����:G�_'���f�H�^To?
Y<q�(����F\��{�W���٣ً�B�c<�,\�oQ�������UP�[\�����-�I�$'�����Q^Bz�P�.Iu��%����j܍p�m�6:,�4Qֺ�hōFG�V]� �  ��]~�<���b��h��bf�����]��%�v	t�.,\O �Iވz{��\OH{E}���L��\������)�Yu�o��#�D�I��١����x�L'$���qKN%��!�[U��V�\ꤝs=���a�\~W[�B2��G�E���cR9?�[�p�l�w40B�M ���'_ɺ�n�1I��~t͉�>@���x�ܲ��-n��|�d#�m68�ݻa���:l��1�,�<ω~%5	_���&?b�\N�3 ��Y��ɵ��A`��W��{�(Μ� �c���3�I�׹\h�x�};��~�uhY�txNf�-�m��Ĵej_��hh�^�/H$C�V� ���tЗ^����j�� 1 �o�h0�+G�S��`%�P) $�m0�Z��&��W�sS�E�V�7���
q��,8�is�������Kjv�V��kb:�?��D����v�74ǐ��Z��
�`ǟ8l�¯�\}���V4N�F��>�
,���$�M��U�|p8��*(^[�ZE�ڶG,Y�X�
zb�W�s\�6�H�\�plHؚ�!4�B�̖�_�&2��!�m��*��w����R0�TQ	7��O@t��)���h�!����DXT~���m�t��	j�+��Ċ�ʟ{IaTAV8٧�(:Hr-l<�1��#���h�x>i�h�O�ӣ(]K����ˊ�V��*����6�������K`�կ`�]�:�M<h�c,���!pb�������:��~U�t)�(ɋt�k{�O�pK���:+K��wi��Əِ0\]Z	�g���I�=�G�)n���ˉ�ӡbm�=�A|��J�>�N�Ms������yGktGy���v�2�@Ė�;��s�1���_D��g�S�`�Sw�rv�e���;��n�X(������f�NU��6߆�ʓF�{�Y�OK�I��y�bZ'}7��%���6����	�˂�	��X�0�MB^�|�Ұ���D�s����6wkv����ܒh<
���ۍ��rË��gN~��r8��vSO�Q�]r�����O.�馃��)����Hul��c��G.�0����H)�ax�c	2̮�ء��i���n��,8[uPgũC�k>�-Z#���ϔv�N+��r4ɍ^R��~J.���&��w�d=v��]n���cU1d�zJ�v�ٲ���a�>�O�X�q0M�aDP�l0�*vX��r<���^\����������<w4��un�,� Ŵ���&(b1E�3��s���4�^�+P���s}4��z?e� ;�4a��Pq^�8z�t
���`�#�f��Z!�����!���~,��sy7'̲��Vj��Q ��s��q`��%��(�W�ӂ��\npIx]�W%��賅qˏ���V6F�A�bK�^�s���KV����km^C7i��I�tm�z��0�>~�Q�h�5�+t���Dζ��ڝE�W�0�`���qcZۂ޺�n���u12�?�ˢ錝�r�og71�)�^��[2��ސg� n&L� 1�6��W��j���D�]�&F�CK�}��7h>�q����m�1�SO=��TJT���D�mj�<ڡ�x�|f
ۜ� ���̻|��vI�iK�,������f�\�1��4z�^l����{��yVy$2g$X�0���XJ D�>�����tI����*7ͳ��w���R�K��Q�+�ì�F���QX�@O�z��Or������~H�ѿ/�/L�������A����`�E�[��6)��v�l�
VQ���Sñ\,"C�{5xs5}6b���x���-6��t�)��
�oh����$$Y�#�e��2.�_ۇ{���g�+��=��$�r�9+:�&"4�#b��S��Cc���|�U8kD�-^7��+�"mt�a�O#�8#�#���cK�?����3�b�Ώ�w�㮪��X1;�9�xj��O~�ǪX>�,�^R�vA)�kl�ұ9�'��k�(�[ ������X�/�d��%���J̶��9�:�le����wP(Rg=�������1 �+vS�Kp{��{tֲ��6ǜ�&W�P����9ݔ�������O�\�Y(�h.��1{
�$�z��	J�X�"C�K���/�WH��������'D�.Aԑ��T?�A�KP���Q�RKP�����ݯ�A�B�x2P�����׫��)�6[�3���^��.�|m8��a �r`� ���
��B�ym�&�lMx4���/b�-�9v���s�`P\,x��5�HE�i�	��{�[�/AM;+E"��y��'i���W(%���g=�W��
:km��k��:M͟H�܏	�P���<-���]�:�2�����,��␍�Y���#�~�ǩ�}�[j-���di"O�7��^G�Ϲ�4ş�s��t�x�`vh���m�R�k�H������=kNo��ǆ��hW��duκ����&��ϻ�p�wjE6e���f��c�ϭ�i���Iץ^hc�Ʒ���\�'�A��˲aI����,Y7�����c�O�;V`z|^�w|���۱gM';M��g)��$Y1�E����b�����j��䎄�OR��E���ڵ�����IGp�X��Ol�;�Q�����e��G��v|�o�\�i5eG�?�E��D�3��i�B���_�9����W�0�ώ�_�wd���kB?2g��^{�Tw?�ߐ�|C#�ns�(��ɯ�4�d����{�5���t?����Ҭg�Q�x�j/�Rғ]��b�/N���^�,;�r�)�	S������gߑ�v��lٓ�8�͓��λ�Ѓ~>E�P�=_����2�8J��RN�Oi4��K�{9?B-%��
��V�W��*7���៶�?B=S'quY̶+�u{�G(e���7N�+O�3�78NI����$g9���>t���v� �+��7G�Ȼ�~�����S��ți�
��o�'�E�e^}��8�Yr�������Awq�����w�\����]��O*
�
�ȣw�B��N�Oւݻ����C�qt4�m�;�~��U��nlOd��kk�*4�K�M�u���Sl��	'�8��}6:�+Di�$�2!�.��Ȍ��~��{��u��w.{B�¾��c���(���O��f��+�yA?� ~�b{�>{�qfW�S�9���K��r-Hr7s��\�]��iҁyX�|�M]_?n��\�y�Y��讞����Bb[���r-6������m�b?��9d�1z��<��a_%]�0�\ξ����tćSk���~��w����n[�,��ČT�����k�[�g⨛��K'1,��A/�sR��$��|��'>VOV���G�$�����@_*+�'³Ϋ)܃�H��v��*ɌNw/zbz7�=�v׭�-{,��;�_�R}{k4W�H2�/�+����v�;�_����Xz��=�Յ<��c��׎jn����x���`���Į��a��v�.�����6TxQ:{H�☘��F����ʆۤx]�1=_+։c"�#66Љ(�ϳ��G�N�>�;��k�/���)>U	��#��4n�6�О��v�h���5���R,1[�<o�++y�L9$�����ֺ�]g�b�u��3�[�|���_g�����kg3���v��9p4���|��m�5a��r�Y���-p���Y�"©]�H=�l=v4S�~\n4����voӞ�ލ0�g�W�]��qp�uF���=�}]~٪hڣ{�+J�u�sg���Ͻ����#w���H��[QMH���hZ�X�;K��៩�o��3�[��5�%�}��l8�S���8gO�|F}]}���>[��頴��]�>s����_dn��Y��1��܌�T�=���M�v��:�����N�!�W�H
�s�$�>mts�n���3@ۮ���_�E�q^�s���S�@��Q�f������t���>ﾻ�0}s�^/4l;�1�$��\;��]]��Im?����͎Sl4��yEŗ�.��F%��kl7��;�0\�f�L������c|��     