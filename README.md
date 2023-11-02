# Database Assignment

Designing and Implementing script of a database for ITS company

**Task description**:

Incheon Transport Services (ITS), a private company, provides transportation services to
various events. Recently, it has been sub-contracted by the Incheon City Government
to transport officials during the Asian Games in 2023. The company requires a
modern database system for efficient management of its services. ITS has hired
you as a database professional to design and develop a database that can meet
ITS's needs as specified requirements. ITS owns a fleet of vehicles.

![image](https://github.com/MaximeJin/DatabaseAssignment/assets/99347092/8b6ebac0-3822-486b-9207-eb016c8dee42)

**Dbschema Database Design File** :

![image](https://github.com/MaximeJin/DatabaseAssignment/assets/99347092/41675be0-19bd-4d18-937c-6a3e62bd8f01)

On this Database Design, I implemented several tables that contains attributes that meets the ITS Database requirements.


### Booking Service Table:

**booking_reference_number:**
- Data Type: INTEGER
- Primary Key: Yes, part of the composite primary key
- Mandatory (Not Null): Yes
- Default Value: N/A

**start_date:**
- Data Type: DATETIME
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**end_date:**
- Data Type: DATETIME
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**pick_up:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**drop_off:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**start_odometer:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: 0 (assumes it starts at 0)

**end_odometer:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**driver_license_number:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**official_id:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- The composite primary key consists of `booking_reference_number`, `driver_license_number`, and `official_id`.
- `driver_license_number` is a foreign key referencing the `license_number` in the Driver Info Table.
- `official_id` is a foreign key referencing the `official_id` in the Games Official Table.

### Vehicle Table:

**vehicle_id:**
- Data Type: INTEGER
- Primary Key: Yes
- Mandatory (Not Null): Yes
- Default Value: N/A

**registration_id:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**manufacturer:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**model:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**color:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**current_odometer:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: 0 (assumes it starts at 0)

**passenger_capacity:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- The `vehicle_id` is the primary key.
- It is also a foreign key referencing the `vehicule_id` in the Maintenance/Repair Table.
- The `current_odometer` is a foreign key referencing the `start_odometer` in the Booking Service Table.

### Maintenance/Repair Table:

**vehicle_id:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**odometer:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: 0 (assumes it starts at 0)

**action_type:**
- Data Type: BYTE with its value being ('M' or 'R')
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**final_cost:**
- Data Type: NUMERIC
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**description:**
- Data Type: TEXT 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**[date]:**
- Data Type: DATETIME
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: Current timestamp or datetime

**Foreign Keys and Relations:**
- The composite primary key consists of `vehicle_id` and `odometer`.
- `vehicle_id` is a foreign key referencing the `vehicule_id` in the Vehicle Table.
- `current_odometer` in the Vehicle Table is a foreign key referencing the `start_odometer` in the Booking Service Table.


### Country Table:

**country_id:**
- Data Type: INTEGER
- Primary Key: Yes
- Mandatory (Not Null): Yes
- Default Value: N/A

**country_name:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**language:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- The `country_id` is the primary key.
- `country_id` in the Country and Language Table is a foreign key referencing the `country_id` in the Games Official Table.
- `language` is a foreign key referencing the `preferred_language` in the Driver Info Table.
- `language` is a foreign key referencing the `preferred_language` in the Games Official Table.

### Games Official Table:

**official_id:**
- Data Type: INTEGER
- Primary Key: Yes
- Mandatory (Not Null): Yes
- Default Value: N/A

**incheon_city_id:**
- Data Type: VARCHAR
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**official_name:**
- Data Type: VARCHAR
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**role_at_incheon_game:**
- Data Type: ENUM with options (coach, judge, physician)
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**country_id:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**preferred_language:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- The `official_id` is the primary key.
- `country_id` is a foreign key referencing the `country_id` in the Country and Language Table.
- `country_id` is a foreign key referencing the `country_id` in the Country and Language Table.
- `preferred_language` is a foreign key referencing the `preferred_language` in the Country and Language Table.
- `preferred_language` is a foreign key referencing the `preferred_language` in the Driver Info Table.


### Driver Info Table:

**license_number:**
- Data Type: INTEGER
- Primary Key: Yes
- Mandatory (Not Null): Yes
- Default Value: N/A

**name:**
- Data Type: VARCHAR
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**clearance_level:**
- Data Type: BYTE with its value being (1,2,3,4)
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**[first_aid_training_level(FATL)]:**
- Data Type: BYTE 
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**[security_training_license_vip_transport_level_(STLVT)]:**
- Data Type:  CHAR
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**vehicle_id:**
- Data Type: INTEGER
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**preferred_language:**
- Data Type: VARCHAR 
- Primary Key: No
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- `license_number` is the primary key.
- `license_number` in the Driver Info Table is a foreign key referencing the `license_number` in the STLVT Table.
- `license_number` in the Driver Info Table is a foreign key referencing the `license_number` in the FATL Table.
- `vehicle_id` is a foreign key referencing the `vehicle_id` in the Vehicle Table.
- `preferred_language` is a foreign key referencing the `preferred_language` in the Country and Language Table.


### STLVT Table:

**STLVT_level:**
- Data Type: CHAR
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**STLVT_qualification_date:**
- Data Type: DATETIME
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**certifying_authority:**
- Data Type: BYTE or CHAR
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**license_number:**
- Data Type: INTEGER
- Primary Key: Yes
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- `license_number` is the primary key.
- `license_number` in the STLVT Table is a foreign key referencing the `license_number` in the Driver Info Table.

### FATL Table:

**FATL_level:**
- Data Type: BYTE ENUM with its value being (1,2,3,4,5,6,7,8,9,10)
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**FATL_qualification_date:**
- Data Type: DATETIME
- Primary Key: No
- Mandatory (Not Null): No
- Default Value: N/A

**license_number:**
- Data Type: INTEGER
- Primary Key: Yes
- Mandatory (Not Null): Yes
- Default Value: N/A

**Foreign Keys and Relations:**
- `license_number` is the primary key.
- `license_number` in the FATL Table is a foreign key referencing the `license_number` in the Driver Info Table.

### ERD Diagram:

To create the ERD diagram for the midterm assignment, I adhered to the specified requirements. I started by creating the main tables, which include Vehicles, Booking_service, Driver_info, and Game_officials. These tables form the core of our diagram, and I defined their attributes based on the assignment document.

Next, I had to determine how to incorporate additional data into the diagram. I made several key decisions:

1. **Maintenance/Repair Table:** I created a table named "Maintenance/Repair Table" to house data related to vehicle maintenance and repair information. This table is linked to the "vehicle table" through a foreign key called "vehicle_id." This approach helps organize and associate maintenance data with specific vehicles.

2. **Driver Information Table:** To avoid duplicate data and null values for attributes like "fatl" and "svlvt," which are not mandatory for ITS drivers, I introduced two additional tables linked to "driver_info." These tables are connected via a foreign key called "driver_id."


4. **Country Table:** I created a "country" table linked to a "languages_spoken" table through a foreign key called "country_code." Originally, this setup was intended to facilitate matching game officials and drivers based on their language requirements and home country. However, due to implementation constraints, I opted for a simplified approach by including a "preferred_language" attribute in the "game_official" and "driver_info" tables. This limits the number of possible languages for matching to one.


Additionally, for reservation purposes, I included two foreign keys in the "booking_service" table, "driver_id" and "official_id," to define constraints and ensure accurate bookings. These foreign keys establish relationships between reservations and the respective drivers and game officials.

### Tables Insertion :

I created insert scripts for the tables, building on the syntax I had used in the previous assignment. I tailored these scripts to match our current set of tables, their attributes, and the specific values required. It was essential to choose meaningful values for each table to ensure that all the assignment requirements were met. These values had to adhere to the initial constraints defined in the table creation scripts.

Once the data was inserted, I verified the success of the inserts by displaying the content of the tables. This step was not only essential for ensuring the correctness of the data but also a requirement outlined in the assignment.

### Table requirements :

Towards the end of the project, I attempted to fulfill two specific requirements:

1. Matching Language Requirements: One requirement involved ensuring that the spoken language of a driver matched that of the game official. I created an SQL script that seemed correct and worked in my SQL developer environment. However, I encountered issues when trying to implement constraints using the sqlite3 package. The objective was to add a constraint to the "booking_service" table, validating whether the preferred language of the official matched the driver's language. I used a join operation to achieve this.

2. Meeting Official's Requests: The other requirement focused on fulfilling the requests made by game officials by aligning them with selected drivers and vehicles. This alignment ensured that the chosen vehicle and driver met the specific requests of the official. Unfortunately, I faced the same constraint-related issue with sqlite3. Nevertheless, the core principle of the request remained the same.

In summary, while I successfully created the SQL scripts to address these requirements, I encountered difficulties when attempting to implement constraints within the sqlite3 environment.


***Feel free to click on each table and look for the description I might have written on each attributes***

Note that in the script, 


1. **IF an ITS driver has already passed a First Aid Training Licence (FATL):**

   I would insert records into the `FATL_Table` only for drivers who have passed the First Aid Training Licence. If a driver has not passed FATL, there will be no record for them in this table. Here's an example of how I would insert data for a driver who has passed FATL:

   ```sql
   -- Insert records into FATL Table for drivers who passed FATL
   INSERT INTO FATL_Table (FATL_level, FATL_qualification_date, license_number)
   VALUES (5, '2022-12-10', 12345);
   ```

   In this case, the driver with `license_number` 12345 has passed FATL level 5, and the local police station has certified it.

2. **IF an ITS driver has already passed a security training licence for the VIP transport (STLVT):**

   Similarly, I would insert records into the `STLVT_Table` only for drivers who have passed the Security Training Licence for VIP Transport. If a driver has not passed STLVT, there will be no record for them in this table. Here's an example of how I would insert data for a driver who has passed STLVT:

   ```sql
   -- Insert records into STLVT Table for drivers who passed STLVT
   INSERT INTO STLVT_Table (STLVT_level, STLVT_qualification_date, STLVT_certifying_authority, license_number)
   VALUES (1, '2023-02-20', 'Foreign Police Station', 67890);
   ```

   In this case, the driver with `license_number` 67890 has passed STLVT level 1, and a foreign police station has certified it.



