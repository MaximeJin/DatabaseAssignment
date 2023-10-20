-- Create Country and Language Table
CREATE TABLE Country_Table (
    country_id INTEGER NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Country_Table PRIMARY KEY (country_id)
);

-- Create Games Official Table
CREATE TABLE Games_Official_Table (
    official_id INTEGER NOT NULL,
    incheon_city_id VARCHAR(8) NOT NULL,
    official_name VARCHAR(50) NOT NULL,
    role_at_incheon_game BYTE NOT NULL,
    country_id INTEGER NOT NULL,
    preferred_language VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Games_Official_Table PRIMARY KEY (official_id)
);

-- Create STLVT Table
CREATE TABLE STLVT_Table (
    STLVT_level BYTE,
    STLVT_qualification_date DATETIME,
    certifying_authority BYTE,
    license_number INTEGER NOT NULL,
    CONSTRAINT pk_STLVT_Table PRIMARY KEY (license_number)
);

-- Create FATL Table
CREATE TABLE FATL_Table (
    FATL_level BYTE,
    FATL_qualification_date DATETIME,
    license_number INTEGER NOT NULL,
    CONSTRAINT pk_FATL_Table PRIMARY KEY (license_number)
);

-- Create Driver Info Table
CREATE TABLE Driver_Info_Table (
    license_number INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    clearance_level BYTE NOT NULL,
    [first_aid_training_level(FATL)] BYTE,
    [security_training_license_vip_transport_level_(STLVT)] BYTE,
    vehicle_id INTEGER NOT NULL,
    preferred_language VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Driver_Info_Table PRIMARY KEY (license_number, vehicle_id),
    CONSTRAINT fk_Driver_Info_Table_STLVT_Table FOREIGN KEY (license_number) REFERENCES STLVT_Table (license_number),
    CONSTRAINT fk_Driver_Info_Table_FATL_Table FOREIGN KEY (license_number) REFERENCES FATL_Table (license_number)
);

-- Create Maintenance/Repair Table
CREATE TABLE [Maintenance/Repair_Table] (
    vehicle_id INTEGER NOT NULL,
    odometer INTEGER NOT NULL DEFAULT 0,
    action_type BYTE NOT NULL,
    final_cost NUMERIC NOT NULL,
    description TEXT NOT NULL,
    [date] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_Maintenance/Repair_Table PRIMARY KEY (vehicle_id),
    CONSTRAINT fk_Maintenance/Repair_Table_Vehicle_Table FOREIGN KEY (vehicle_id) REFERENCES Vehicle_Table (vehicule_id)
);

-- Create Booking Service Table
CREATE TABLE Booking_Service_Table (
    booking_reference_number INTEGER NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    pick_up VARCHAR(50) NOT NULL,
    drop_off VARCHAR(50) NOT NULL,
    start_odometer INTEGER NOT NULL DEFAULT 0,
    end_odometer INTEGER NOT NULL,
    driver_license_number VARCHAR(18) NOT NULL,
    official_id INTEGER NOT NULL,
    CONSTRAINT pk_Booking_Service_Table PRIMARY KEY (booking_reference_number, driver_license_number, official_id),
    CONSTRAINT fk_Booking_Service_Table_Driver_Info_Table FOREIGN KEY (driver_license_number) REFERENCES Driver_Info_Table (license_number),
    CONSTRAINT fk_Booking_Service_Table_Games_Official_Table FOREIGN KEY (official_id) REFERENCES Games_Official_Table (official_id)
);

-- Create Vehicle Table
CREATE TABLE Vehicle_Table (
    vehicle_id INTEGER NOT NULL,
    registration_id VARCHAR(7) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    color VARCHAR(20) NOT NULL,
    current_odometer INTEGER NOT NULL DEFAULT 0,
    passenger_capacity INTEGER NOT NULL,
    CONSTRAINT pk_Vehicle_Table PRIMARY KEY (vehicle_id),
    CONSTRAINT fk_Vehicle_Table_Maintenance/Repair_Table FOREIGN KEY (vehicle_id) REFERENCES [Maintenance/Repair_Table] (vehicule_id),
    CONSTRAINT fk_Vehicle_Table_Booking_Service_Table FOREIGN KEY (current_odometer) REFERENCES Booking_Service_Table (start_odometer)
);
