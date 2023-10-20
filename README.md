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

**ITS databse requirements**:

• Vehicles are maintained or repaired regularly. While the vehicle's maintenance or
repair started, the ITS database stores the action type as Maintenance (M) or
Repair (R), odometer, the final cost, a brief description of the action and the date.
• ITS stores a list of countries participating in the Games and the most frequently
spoken languages. A country can have various spoken languages which are
identified by ISO3166-1 two-character codes. For instance, ISO3166-1 twocharacter codes for the Republic of Korea and English language are KR and EN,
respectively. You can find the current ISO 3166 country codes list by clicking here.
• Games officials from all participating countries use ITS's services. ITS records the
name of the country that an official is representing, the official's Incheon 8
characters based City ID, his/her name, role at the Incheon Games (e. g., coach,
judge and physician), and the official's preferred language.
• An Incheon Game official may use ITS's services various times during a single
day; the condition that "a suitable vehicle is available when they wish to travel" is
the only limiting factor.
• The ITS database system stores drivers' information, including their name,
license number (18 characters), and clearance level. An ITS driver's security
clearance level can be digits from 1 to 4.
• If an ITS driver has already passed a First Aid Training Licence (FATL), the ITS
database stores the FATL level (1 to 10) and the FATL qualification date.
• If an ITS driver has already passed a security training licence for the VIP transport
(STLVT), the ITS database stores the STLVT level (1 to 5), the STLVT qualification
date and the certifying authority (e.g., a local Police Station, or foreign police
station).
• It is not mandatory for an ITS driver to have a special training licence in one field
of STLVT, FATL or both.
• ITS driver booking service matches the language of an Incheon game official with
the language of the ITS driver.
• ITS driver booking service matches the assignment of a suitable driver with a
suitable vehicle based on the Incheon game official's request.
• ITS driver database system stores the pickup and drops off location name
incuding location's address such as street number and city, and location types
such as Hotel, Airport, and Aquatic Center.
• ITS driver database system stores the booking reference number, the actual trip
start date-and-time, end date-and-time, start odometer value and end odometer
value when a trip is completed.
• To assist vehicle assignment, ITS requires that the new system indicate whether
a vehicle is currently available. An ITS vehicle is flagged as unavailable if the
vehicle is out-on-a-trip or out-of-service.
