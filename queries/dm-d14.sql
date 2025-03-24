--DM D14 Batch
--						Impact of Social Media on Student Acedemic Performance

--	DIMENTION TABLES

--Study Method Dim
create table study_method_dim(
	study_method_id varchar(10) primary key,
	preparation_period varchar(20),
	preparation_type varchar(10),
	study_resource varchar(20)
);

--Social Media Dim
create table social_media_dim(
	platform_id varchar(10) primary key,
	platform_name varchar(30),
	category varchar(30)
);

--Normalized Class Dim
create table class_dim(
	class_id varchar(10) primary key,
	year_of_study varchar(3),
	branch varchar(5),
	section varchar(2)
);

--Student Dim
create table student_dim (
	student_id varchar(12) primary key,
	class_id varchar(10),
	gender varchar(7),
	residence_type varchar(15),
	foreign key(class_id) references class_dim(class_id)
);

--Normalized Location Dim
create table location_dim(
	location_id varchar(10) primary key,
	city varchar(30),
	district varchar(30),
	state_name varchar(10)
);

--College Dim
create table college_dim(
	college_id varchar(10) primary key,
	location_id varchar(10),
	college_name varchar(100),
	course varchar(30),
	foreign key(location_id) references location_dim(location_id)
);


--	FACT TABLES

--Acedemics Fact
create table academics_fact (
	student_academic_id varchar(10) primary key,
	student_id varchar(12),
	college_id varchar(10),
	platform_id varchar(10),
	study_method_id varchar(10),
	study_time int,
	social_media_time int,
	cgpa float,
	foreign key(student_id) references student_dim(student_id),
	foreign key(college_id) references college_dim(college_id),
	foreign key(platform_id) references social_media_dim(platform_id),
	foreign key(study_method_id) references study_method_dim(study_method_id)
);

--drop table acedemics_fact;

create table achievements_fact (
	student_achievements_id varchar(10) primary key,
	student_id varchar(12),
	college_id varchar(10),
	platform_id varchar(10),
	certifications int,
	projects int,
	workshops int,
	foreign key(student_id) references student_dim(student_id),
	foreign key(college_id) references college_dim(college_id),
	foreign key(platform_id) references social_media_dim(platform_id)
);

INSERT INTO location_dim (location_id, city, district, state_name) VALUES ('LOC001', 'Pedana', 'Krishna', 'AP');
INSERT INTO location_dim (location_id, city, district, state_name) VALUES ('LOC002', 'Gudivada', 'Krishna', 'AP');
INSERT INTO location_dim (location_id, city, district, state_name) VALUES ('LOC003', 'Rajahmundry', 'East Godavari', 'AP');
INSERT INTO college_dim (college_id, location_id, college_name, course) VALUES ('COL001', 'LOC001', 'SVIET College', 'B.Tech');
INSERT INTO college_dim (college_id, location_id, college_name, course) VALUES ('COL002', 'LOC002', 'SR Gudlavalleru Engineering College', 'B.Tech');
INSERT INTO college_dim (college_id, location_id, college_name, course) VALUES ('COL003', 'LOC003', 'ISTS Womens College', 'B.Tech');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS001', 'IV', 'CSE', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS002', 'II', 'ECE', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS003', 'III', 'CSE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS004', 'II', 'CSE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS005', 'III', 'MECH', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS006', 'III', 'CSE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS007', 'III', 'CSE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS008', 'II', 'MECH', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS009', 'I', 'ECE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS010', 'II', 'CSE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS011', 'III', 'ECE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS012', 'I', 'CSE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS013', 'III', 'CSE', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS014', 'II', 'ECE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS015', 'I', 'CSE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS016', 'IV', 'ECE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS017', 'III', 'MECH', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS018', 'I', 'CSE', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS019', 'IV', 'ECE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS020', 'II', 'ECE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS021', 'IV', 'MECH', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS022', 'I', 'CSE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS023', 'III', 'ECE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS024', 'II', 'MECH', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS025', 'IV', 'CSE', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS026', 'IV', 'MECH', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS027', 'I', 'MECH', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS028', 'IV', 'ECE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS029', 'II', 'MECH', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS030', 'I', 'MECH', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS031', 'IV', 'CSE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS032', 'I', 'ECE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS033', 'III', 'MECH', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS034', 'II', 'CSE', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS035', 'III', 'ECE', 'D');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS036', 'IV', 'CSE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS037', 'IV', 'MECH', 'B');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS038', 'II', 'CSE', 'C');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS039', 'I', 'ECE', 'A');
INSERT INTO class_dim (class_id, year_of_study, branch, section) VALUES ('CLS040', 'I', 'MECH', 'C');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A05K7', 'CLS001', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0426', 'CLS002', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0503', 'CLS003', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A05A7', 'CLS004', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A03G9', 'CLS005', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0590', 'CLS003', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05J1', 'CLS003', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0549', 'CLS006', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05C6', 'CLS007', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A03K4', 'CLS008', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A04M5', 'CLS009', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0507', 'CLS010', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A04G5', 'CLS011', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('246W1A05N7', 'CLS012', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05B7', 'CLS013', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A04I2', 'CLS014', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A05N5', 'CLS007', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24481A05G1', 'CLS015', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24481A05N3', 'CLS015', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0421', 'CLS016', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05N4', 'CLS007', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A05A5', 'CLS007', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05I4', 'CLS003', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05M2', 'CLS007', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A03I5', 'CLS017', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A04H2', 'CLS002', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0531', 'CLS006', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24481A05M6', 'CLS018', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05H6', 'CLS003', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0470', 'CLS019', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05E0', 'CLS007', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0457', 'CLS020', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0517', 'CLS003', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0488', 'CLS009', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05D7', 'CLS013', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A05O4', 'CLS003', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0545', 'CLS018', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0565', 'CLS006', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05D3', 'CLS013', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A03K4', 'CLS021', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0521', 'CLS022', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0517', 'CLS007', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05K2', 'CLS007', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A04A0', 'CLS023', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0397', 'CLS024', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A0522', 'CLS006', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0548', 'CLS025', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0592', 'CLS006', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0594', 'CLS001', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A04B6', 'CLS014', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05D6', 'CLS003', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0310', 'CLS026', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('246W1A0568', 'CLS012', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05C8', 'CLS013', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0518', 'CLS015', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0505', 'CLS004', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A03B7', 'CLS027', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A04H4', 'CLS019', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A04M3', 'CLS028', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0534', 'CLS006', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05L0', 'CLS007', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0337', 'CLS029', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A03F8', 'CLS030', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24481A05G6', 'CLS015', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0581', 'CLS006', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A04J4', 'CLS009', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A03N6', 'CLS027', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0502', 'CLS012', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A05H5', 'CLS031', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('246W1A05N3', 'CLS015', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A04I9', 'CLS032', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05O0', 'CLS006', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A0414', 'CLS011', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05L6', 'CLS006', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0434', 'CLS019', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('246W1A0510', 'CLS012', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23481A0565', 'CLS004', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0510', 'CLS006', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A03M2', 'CLS033', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23481A0574', 'CLS034', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A0305', 'CLS033', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0395', 'CLS008', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A04K9', 'CLS035', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('246W1A0522', 'CLS015', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0582', 'CLS036', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A03N3', 'CLS017', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0549', 'CLS022', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A04G0', 'CLS011', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05C2', 'CLS013', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05G8', 'CLS003', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A04E9', 'CLS011', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A05D4', 'CLS036', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A03F5', 'CLS037', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05J4', 'CLS007', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0587', 'CLS003', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A03M5', 'CLS017', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A05F2', 'CLS038', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0410', 'CLS028', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24481A05K3', 'CLS022', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A0321', 'CLS021', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23481A0554', 'CLS038', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A0482', 'CLS002', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0527', 'CLS007', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23481A05M2', 'CLS034', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23481A05E3', 'CLS034', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0571', 'CLS013', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A03B6', 'CLS008', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A04O9', 'CLS039', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0546', 'CLS006', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A05E8', 'CLS004', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('246W1A05A8', 'CLS018', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A05G2', 'CLS038', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A05N8', 'CLS012', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24481A0545', 'CLS012', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23481A05G5', 'CLS010', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A0564', 'CLS006', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0517', 'CLS007', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A03G0', 'CLS021', 'Male', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0551', 'CLS013', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A03E3', 'CLS027', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A05F9', 'CLS003', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('21MQ1A03I6', 'CLS037', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0568', 'CLS006', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A03J6', 'CLS040', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22481A0556', 'CLS006', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('23MQ1A03J8', 'CLS008', 'Male', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('22MQ1A05B8', 'CLS013', 'Female', 'Hostler');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A04E4', 'CLS039', 'Female', 'DaySchoolar');
INSERT INTO student_dim (student_id, class_id, gender, residence_type) VALUES ('24MQ1A0304', 'CLS027', 'Female', 'Hostler');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT001', 'YouTube');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT002', 'Snapchat');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT003', 'X');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT004', 'Instagram');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT005', 'LinkedIn');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT006', 'Threads');
INSERT INTO social_media_dim (platform_id, platform_name) VALUES ('PLT007', 'Facebook');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD001', 'One Week', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD002', 'One Month', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD003', 'One Week', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD004', 'Two Weeks', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD005', 'One Week', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD006', 'One Day', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD007', 'One Week', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD008', 'One Day', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD009', 'One Month', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD010', 'One Week', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD011', 'Two Weeks', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD012', 'Two Weeks', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD013', 'One Week', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD014', 'Two Weeks', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD015', 'Two Weeks', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD016', 'One Day', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD017', 'One Month', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD018', 'One Month', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD019', 'One Day', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD020', 'One Month', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD021', 'Two Weeks', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD022', 'One Month', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD023', 'One Week', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD024', 'One Day', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD025', 'One Day', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD026', 'Two Weeks', 'Learning Materials');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD027', 'One Day', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD028', 'One Month', 'Online Videos');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD029', 'One Week', 'Library');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD030', 'One Day', 'Notes');
INSERT INTO study_method_dim (study_method_id, preparation_period, study_resource) VALUES ('STD031', 'One Month', 'Notes');
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD001', '21MQ1A05K7', 'COL001', 'PLT001', 'STD001', 2, 3, 8.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD002', '23MQ1A0426', 'COL001', 'PLT002', 'STD001', 5, 5, 6.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD003', '22481A0503', 'COL002', 'PLT002', 'STD001', 3, 5, 7.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD004', '23MQ1A05A7', 'COL001', 'PLT001', 'STD004', 4, 5, 6.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD005', '22MQ1A03G9', 'COL001', 'PLT002', 'STD001', 5, 2, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD006', '22481A0590', 'COL002', 'PLT003', 'STD001', 4, 2, 8.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD007', '22481A05J1', 'COL002', 'PLT004', 'STD004', 3, 4, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD008', '22481A0549', 'COL002', 'PLT005', 'STD001', 5, 4, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD009', '22481A05C6', 'COL002', 'PLT006', 'STD001', 1, 5, 7.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD010', '23MQ1A03K4', 'COL001', 'PLT003', 'STD001', 3, 3, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD011', '24MQ1A04M5', 'COL001', 'PLT002', 'STD004', 4, 1, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD012', '23MQ1A0507', 'COL001', 'PLT002', 'STD001', 3, 2, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD013', '22MQ1A04G5', 'COL001', 'PLT002', 'STD004', 2, 3, 7.1);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD014', '246W1A05N7', 'COL003', 'PLT002', 'STD004', 5, 2, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD015', '22481A05B7', 'COL002', 'PLT007', 'STD004', 4, 3, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD016', '23MQ1A04I2', 'COL001', 'PLT003', 'STD004', 2, 5, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD017', '22MQ1A05N5', 'COL001', 'PLT003', 'STD001', 1, 5, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD018', '24481A05G1', 'COL002', 'PLT005', 'STD004', 2, 5, 7.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD019', '24481A05N3', 'COL002', 'PLT002', 'STD001', 2, 3, 6.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD020', '21MQ1A0421', 'COL001', 'PLT005', 'STD001', 2, 2, 9.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD021', '22481A05N4', 'COL002', 'PLT007', 'STD004', 2, 3, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD022', '22MQ1A05A5', 'COL001', 'PLT003', 'STD004', 3, 4, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD023', '22481A05I4', 'COL002', 'PLT002', 'STD004', 1, 3, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD024', '22481A05M2', 'COL002', 'PLT004', 'STD001', 2, 2, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD025', '22MQ1A03I5', 'COL001', 'PLT001', 'STD004', 1, 2, 8.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD026', '23MQ1A04H2', 'COL001', 'PLT004', 'STD004', 2, 2, 7.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD027', '22481A0531', 'COL002', 'PLT006', 'STD004', 5, 2, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD028', '24481A05M6', 'COL002', 'PLT007', 'STD004', 1, 5, 6.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD029', '22481A05H6', 'COL002', 'PLT004', 'STD001', 5, 1, 7.1);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD030', '21MQ1A0470', 'COL001', 'PLT006', 'STD001', 4, 2, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD031', '22481A05E0', 'COL002', 'PLT005', 'STD001', 3, 4, 8.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD032', '23MQ1A0457', 'COL001', 'PLT001', 'STD004', 3, 4, 8.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD033', '22481A0517', 'COL002', 'PLT002', 'STD001', 4, 1, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD034', '24MQ1A0488', 'COL001', 'PLT001', 'STD004', 1, 1, 8.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD035', '22481A05D7', 'COL002', 'PLT005', 'STD001', 5, 4, 8.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD036', '22MQ1A05O4', 'COL001', 'PLT005', 'STD001', 5, 4, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD037', '24MQ1A0545', 'COL001', 'PLT006', 'STD004', 5, 4, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD038', '22481A0565', 'COL002', 'PLT007', 'STD004', 1, 3, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD039', '22481A05D3', 'COL002', 'PLT006', 'STD004', 2, 2, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD040', '21MQ1A03K4', 'COL001', 'PLT001', 'STD001', 1, 3, 8.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD041', '24MQ1A0521', 'COL001', 'PLT006', 'STD004', 2, 1, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD042', '22481A0517', 'COL002', 'PLT001', 'STD001', 4, 4, 6.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD043', '22481A05K2', 'COL002', 'PLT003', 'STD004', 3, 2, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD044', '22MQ1A04A0', 'COL001', 'PLT006', 'STD001', 3, 2, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD045', '23MQ1A0397', 'COL001', 'PLT007', 'STD001', 1, 1, 8.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD046', '22MQ1A0522', 'COL001', 'PLT003', 'STD004', 3, 5, 7.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD047', '21MQ1A0548', 'COL001', 'PLT001', 'STD001', 2, 2, 8.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD048', '22481A0592', 'COL002', 'PLT005', 'STD004', 1, 5, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD049', '21MQ1A0594', 'COL001', 'PLT007', 'STD004', 4, 3, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD050', '23MQ1A04B6', 'COL001', 'PLT003', 'STD004', 3, 1, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD051', '22481A05D6', 'COL002', 'PLT005', 'STD001', 3, 5, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD052', '21MQ1A0310', 'COL001', 'PLT001', 'STD004', 3, 2, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD053', '246W1A0568', 'COL003', 'PLT003', 'STD001', 4, 4, 8.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD054', '22481A05C8', 'COL002', 'PLT005', 'STD004', 1, 4, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD055', '24MQ1A0518', 'COL001', 'PLT006', 'STD004', 2, 4, 7.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD056', '23MQ1A0505', 'COL001', 'PLT007', 'STD004', 5, 2, 8.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD057', '24MQ1A03B7', 'COL001', 'PLT007', 'STD004', 4, 5, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD058', '21MQ1A04H4', 'COL001', 'PLT007', 'STD004', 5, 4, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD059', '21MQ1A04M3', 'COL001', 'PLT006', 'STD001', 2, 2, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD060', '22481A0534', 'COL002', 'PLT003', 'STD004', 2, 2, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD061', '22481A05L0', 'COL002', 'PLT005', 'STD001', 2, 1, 8.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD062', '23MQ1A0337', 'COL001', 'PLT004', 'STD001', 5, 4, 7.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD063', '24MQ1A03F8', 'COL001', 'PLT004', 'STD004', 2, 2, 7.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD064', '24481A05G6', 'COL002', 'PLT005', 'STD004', 3, 4, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD065', '22481A0581', 'COL002', 'PLT006', 'STD004', 1, 4, 7.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD066', '24MQ1A04J4', 'COL001', 'PLT001', 'STD001', 4, 4, 8.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD067', '24MQ1A03N6', 'COL001', 'PLT004', 'STD001', 3, 3, 6.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD068', '24MQ1A0502', 'COL001', 'PLT005', 'STD001', 5, 4, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD069', '21MQ1A05H5', 'COL001', 'PLT001', 'STD004', 4, 4, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD070', '246W1A05N3', 'COL003', 'PLT005', 'STD004', 4, 5, 8.1);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD071', '24MQ1A04I9', 'COL001', 'PLT004', 'STD001', 1, 5, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD072', '22481A05O0', 'COL002', 'PLT005', 'STD001', 2, 2, 8.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD073', '22MQ1A0414', 'COL001', 'PLT004', 'STD001', 3, 1, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD074', '22481A05L6', 'COL002', 'PLT007', 'STD004', 1, 5, 7.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD075', '21MQ1A0434', 'COL001', 'PLT005', 'STD004', 3, 2, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD076', '246W1A0510', 'COL003', 'PLT005', 'STD004', 3, 1, 9.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD077', '23481A0565', 'COL002', 'PLT007', 'STD001', 3, 4, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD078', '22481A0510', 'COL002', 'PLT001', 'STD001', 4, 1, 7.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD079', '22MQ1A03M2', 'COL001', 'PLT002', 'STD001', 5, 1, 7.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD080', '23481A0574', 'COL002', 'PLT007', 'STD004', 1, 5, 7.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD081', '22MQ1A0305', 'COL001', 'PLT003', 'STD001', 2, 1, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD082', '23MQ1A0395', 'COL001', 'PLT002', 'STD001', 1, 5, 6.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD083', '22MQ1A04K9', 'COL001', 'PLT002', 'STD001', 2, 3, 6.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD084', '246W1A0522', 'COL003', 'PLT004', 'STD001', 2, 2, 7.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD085', '21MQ1A0582', 'COL001', 'PLT006', 'STD001', 1, 4, 7.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD086', '22MQ1A03N3', 'COL001', 'PLT007', 'STD001', 3, 1, 8.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD087', '24MQ1A0549', 'COL001', 'PLT004', 'STD001', 5, 2, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD088', '22MQ1A04G0', 'COL001', 'PLT004', 'STD004', 1, 3, 6.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD089', '22481A05C2', 'COL002', 'PLT002', 'STD001', 1, 2, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD090', '22481A05G8', 'COL002', 'PLT001', 'STD004', 5, 5, 6.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD091', '22MQ1A04E9', 'COL001', 'PLT005', 'STD004', 5, 2, 8.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD092', '21MQ1A05D4', 'COL001', 'PLT007', 'STD001', 1, 2, 8.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD093', '21MQ1A03F5', 'COL001', 'PLT004', 'STD001', 1, 4, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD094', '22481A05J4', 'COL002', 'PLT007', 'STD001', 2, 5, 7.4);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD095', '22481A0587', 'COL002', 'PLT003', 'STD004', 5, 4, 7.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD096', '22MQ1A03M5', 'COL001', 'PLT002', 'STD004', 5, 1, 7.1);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD097', '23MQ1A05F2', 'COL001', 'PLT006', 'STD004', 3, 4, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD098', '21MQ1A0410', 'COL001', 'PLT005', 'STD004', 1, 2, 8.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD099', '22481A05D6', 'COL002', 'PLT001', 'STD001', 5, 5, 6.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD100', '24481A05K3', 'COL002', 'PLT001', 'STD001', 5, 5, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD101', '21MQ1A0321', 'COL001', 'PLT003', 'STD001', 1, 4, 7.7);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD102', '23481A0554', 'COL002', 'PLT004', 'STD004', 2, 1, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD103', '23MQ1A0482', 'COL001', 'PLT001', 'STD001', 4, 1, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD104', '22481A0527', 'COL002', 'PLT005', 'STD004', 5, 3, 8.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD105', '23481A05M2', 'COL002', 'PLT006', 'STD001', 3, 3, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD106', '23481A05E3', 'COL002', 'PLT003', 'STD004', 4, 3, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD107', '22481A0571', 'COL002', 'PLT004', 'STD004', 1, 5, 6.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD108', '23MQ1A03B6', 'COL001', 'PLT006', 'STD001', 3, 5, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD109', '24MQ1A04O9', 'COL001', 'PLT003', 'STD001', 1, 1, 7.8);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD110', '22481A0546', 'COL002', 'PLT005', 'STD004', 5, 3, 8.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD111', '23MQ1A05E8', 'COL001', 'PLT001', 'STD004', 5, 1, 8.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD112', '246W1A05A8', 'COL003', 'PLT001', 'STD004', 5, 5, 6.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD113', '23MQ1A05G2', 'COL001', 'PLT001', 'STD001', 4, 5, 8.1);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD114', '24MQ1A05N8', 'COL001', 'PLT007', 'STD001', 1, 5, 7.0);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD115', '24481A0545', 'COL002', 'PLT002', 'STD004', 5, 4, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD116', '23481A05G5', 'COL002', 'PLT004', 'STD001', 3, 2, 7.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD117', '22MQ1A0564', 'COL001', 'PLT004', 'STD004', 5, 1, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD118', '22481A0517', 'COL002', 'PLT005', 'STD004', 5, 5, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD119', '21MQ1A03G0', 'COL001', 'PLT006', 'STD004', 1, 4, 7.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD120', '22481A0551', 'COL002', 'PLT002', 'STD001', 3, 2, 7.1);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD121', '24MQ1A03E3', 'COL001', 'PLT004', 'STD001', 5, 3, 6.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD122', '22481A05F9', 'COL002', 'PLT006', 'STD004', 2, 3, 6.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD123', '21MQ1A03I6', 'COL001', 'PLT003', 'STD004', 3, 1, 7.6);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD124', '22481A0568', 'COL002', 'PLT003', 'STD004', 4, 1, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD125', '24MQ1A03J6', 'COL001', 'PLT004', 'STD004', 4, 1, 7.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD126', '22481A0556', 'COL002', 'PLT001', 'STD001', 2, 2, 9.2);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD127', '23MQ1A03J8', 'COL001', 'PLT002', 'STD001', 2, 3, 6.9);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD128', '22MQ1A05B8', 'COL001', 'PLT002', 'STD004', 1, 3, 7.5);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD129', '24MQ1A04E4', 'COL001', 'PLT003', 'STD004', 3, 1, 8.3);
INSERT INTO academics_fact (student_academic_id, student_id, college_id, platform_id, study_method_id, study_time, social_media_time, cgpa) VALUES ('ACD130', '24MQ1A0304', 'COL001', 'PLT005', 'STD004', 3, 1, 8.5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH001', '21MQ1A05K7', 'COL001', 'PLT001', 0, 4, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH002', '23MQ1A0426', 'COL001', 'PLT002', 1, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH003', '22481A0503', 'COL002', 'PLT002', 2, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH004', '23MQ1A05A7', 'COL001', 'PLT001', 0, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH005', '22MQ1A03G9', 'COL001', 'PLT002', 0, 5, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH006', '22481A0590', 'COL002', 'PLT003', 1, 2, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH007', '22481A05J1', 'COL002', 'PLT004', 1, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH008', '22481A0549', 'COL002', 'PLT005', 2, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH009', '22481A05C6', 'COL002', 'PLT006', 1, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH010', '23MQ1A03K4', 'COL001', 'PLT003', 1, 5, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH011', '24MQ1A04M5', 'COL001', 'PLT002', 4, 3, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH012', '23MQ1A0507', 'COL001', 'PLT002', 5, 5, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH013', '22MQ1A04G5', 'COL001', 'PLT002', 4, 3, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH014', '246W1A05N7', 'COL003', 'PLT002', 2, 1, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH015', '22481A05B7', 'COL002', 'PLT007', 0, 4, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH016', '23MQ1A04I2', 'COL001', 'PLT003', 1, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH017', '22MQ1A05N5', 'COL001', 'PLT003', 0, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH018', '24481A05G1', 'COL002', 'PLT005', 2, 2, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH019', '24481A05N3', 'COL002', 'PLT002', 5, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH020', '21MQ1A0421', 'COL001', 'PLT005', 2, 5, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH021', '22481A05N4', 'COL002', 'PLT007', 4, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH022', '22MQ1A05A5', 'COL001', 'PLT003', 2, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH023', '22481A05I4', 'COL002', 'PLT002', 4, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH024', '22481A05M2', 'COL002', 'PLT004', 1, 5, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH025', '22MQ1A03I5', 'COL001', 'PLT001', 4, 1, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH026', '23MQ1A04H2', 'COL001', 'PLT004', 1, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH027', '22481A0531', 'COL002', 'PLT006', 1, 4, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH028', '24481A05M6', 'COL002', 'PLT007', 2, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH029', '22481A05H6', 'COL002', 'PLT004', 0, 2, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH030', '21MQ1A0470', 'COL001', 'PLT006', 2, 1, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH031', '22481A05E0', 'COL002', 'PLT005', 1, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH032', '23MQ1A0457', 'COL001', 'PLT001', 2, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH033', '22481A0517', 'COL002', 'PLT002', 2, 4, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH034', '24MQ1A0488', 'COL001', 'PLT001', 1, 1, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH035', '22481A05D7', 'COL002', 'PLT005', 0, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH036', '22MQ1A05O4', 'COL001', 'PLT005', 1, 1, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH037', '24MQ1A0545', 'COL001', 'PLT006', 1, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH038', '22481A0565', 'COL002', 'PLT007', 1, 5, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH039', '22481A05D3', 'COL002', 'PLT006', 1, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH040', '21MQ1A03K4', 'COL001', 'PLT001', 5, 5, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH041', '24MQ1A0521', 'COL001', 'PLT006', 0, 2, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH042', '22481A0517', 'COL002', 'PLT001', 0, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH043', '22481A05K2', 'COL002', 'PLT003', 0, 5, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH044', '22MQ1A04A0', 'COL001', 'PLT006', 0, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH045', '23MQ1A0397', 'COL001', 'PLT007', 4, 5, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH046', '22MQ1A0522', 'COL001', 'PLT003', 1, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH047', '21MQ1A0548', 'COL001', 'PLT001', 4, 4, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH048', '22481A0592', 'COL002', 'PLT005', 2, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH049', '21MQ1A0594', 'COL001', 'PLT007', 4, 1, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH050', '23MQ1A04B6', 'COL001', 'PLT003', 5, 1, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH051', '22481A05D6', 'COL002', 'PLT005', 0, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH052', '21MQ1A0310', 'COL001', 'PLT001', 2, 5, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH053', '246W1A0568', 'COL003', 'PLT003', 2, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH054', '22481A05C8', 'COL002', 'PLT005', 1, 2, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH055', '24MQ1A0518', 'COL001', 'PLT006', 1, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH056', '23MQ1A0505', 'COL001', 'PLT007', 1, 5, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH057', '24MQ1A03B7', 'COL001', 'PLT007', 0, 1, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH058', '21MQ1A04H4', 'COL001', 'PLT007', 1, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH059', '21MQ1A04M3', 'COL001', 'PLT006', 5, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH060', '22481A0534', 'COL002', 'PLT003', 1, 3, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH061', '22481A05L0', 'COL002', 'PLT005', 3, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH062', '23MQ1A0337', 'COL001', 'PLT004', 0, 1, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH063', '24MQ1A03F8', 'COL001', 'PLT004', 3, 3, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH064', '24481A05G6', 'COL002', 'PLT005', 1, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH065', '22481A0581', 'COL002', 'PLT006', 2, 1, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH066', '24MQ1A04J4', 'COL001', 'PLT001', 0, 0, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH067', '24MQ1A03N6', 'COL001', 'PLT004', 3, 2, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH068', '24MQ1A0502', 'COL001', 'PLT005', 1, 0, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH069', '21MQ1A05H5', 'COL001', 'PLT001', 2, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH070', '246W1A05N3', 'COL003', 'PLT005', 1, 1, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH071', '24MQ1A04I9', 'COL001', 'PLT004', 0, 1, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH072', '22481A05O0', 'COL002', 'PLT005', 0, 5, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH073', '22MQ1A0414', 'COL001', 'PLT004', 0, 0, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH074', '22481A05L6', 'COL002', 'PLT007', 0, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH075', '21MQ1A0434', 'COL001', 'PLT005', 1, 3, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH076', '246W1A0510', 'COL003', 'PLT005', 2, 1, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH077', '23481A0565', 'COL002', 'PLT007', 0, 0, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH078', '22481A0510', 'COL002', 'PLT001', 3, 1, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH079', '22MQ1A03M2', 'COL001', 'PLT002', 5, 2, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH080', '23481A0574', 'COL002', 'PLT007', 0, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH081', '22MQ1A0305', 'COL001', 'PLT003', 0, 2, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH082', '23MQ1A0395', 'COL001', 'PLT002', 0, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH083', '22MQ1A04K9', 'COL001', 'PLT002', 4, 2, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH084', '246W1A0522', 'COL003', 'PLT004', 1, 4, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH085', '21MQ1A0582', 'COL001', 'PLT006', 0, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH086', '22MQ1A03N3', 'COL001', 'PLT007', 4, 5, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH087', '24MQ1A0549', 'COL001', 'PLT004', 0, 0, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH088', '22MQ1A04G0', 'COL001', 'PLT004', 0, 3, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH089', '22481A05C2', 'COL002', 'PLT002', 2, 2, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH090', '22481A05G8', 'COL002', 'PLT001', 2, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH091', '22MQ1A04E9', 'COL001', 'PLT005', 3, 1, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH092', '21MQ1A05D4', 'COL001', 'PLT007', 5, 0, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH093', '21MQ1A03F5', 'COL001', 'PLT004', 0, 1, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH094', '22481A05J4', 'COL002', 'PLT007', 1, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH095', '22481A0587', 'COL002', 'PLT003', 2, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH096', '22MQ1A03M5', 'COL001', 'PLT002', 5, 4, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH097', '23MQ1A05F2', 'COL001', 'PLT006', 0, 1, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH098', '21MQ1A0410', 'COL001', 'PLT005', 3, 1, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH099', '22481A05D6', 'COL002', 'PLT001', 1, 1, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH100', '24481A05K3', 'COL002', 'PLT001', 2, 0, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH101', '21MQ1A0321', 'COL001', 'PLT003', 1, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH102', '23481A0554', 'COL002', 'PLT004', 0, 3, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH103', '23MQ1A0482', 'COL001', 'PLT001', 3, 2, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH104', '22481A0527', 'COL002', 'PLT005', 4, 4, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH105', '23481A05M2', 'COL002', 'PLT006', 4, 5, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH106', '23481A05E3', 'COL002', 'PLT003', 1, 1, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH107', '22481A0571', 'COL002', 'PLT004', 0, 2, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH108', '23MQ1A03B6', 'COL001', 'PLT006', 2, 0, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH109', '24MQ1A04O9', 'COL001', 'PLT003', 5, 2, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH110', '22481A0546', 'COL002', 'PLT005', 2, 5, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH111', '23MQ1A05E8', 'COL001', 'PLT001', 0, 4, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH112', '246W1A05A8', 'COL003', 'PLT001', 0, 1, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH113', '23MQ1A05G2', 'COL001', 'PLT001', 0, 2, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH114', '24MQ1A05N8', 'COL001', 'PLT007', 2, 1, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH115', '24481A0545', 'COL002', 'PLT002', 1, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH116', '23481A05G5', 'COL002', 'PLT004', 1, 5, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH117', '22MQ1A0564', 'COL001', 'PLT004', 2, 5, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH118', '22481A0517', 'COL002', 'PLT005', 1, 0, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH119', '21MQ1A03G0', 'COL001', 'PLT006', 2, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH120', '22481A0551', 'COL002', 'PLT002', 2, 4, 0);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH121', '24MQ1A03E3', 'COL001', 'PLT004', 2, 0, 3);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH122', '22481A05F9', 'COL002', 'PLT006', 2, 4, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH123', '21MQ1A03I6', 'COL001', 'PLT003', 5, 1, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH124', '22481A0568', 'COL002', 'PLT003', 2, 5, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH125', '24MQ1A03J6', 'COL001', 'PLT004', 1, 1, 4);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH126', '22481A0556', 'COL002', 'PLT001', 0, 0, 5);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH127', '23MQ1A03J8', 'COL001', 'PLT002', 0, 5, 2);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH128', '22MQ1A05B8', 'COL001', 'PLT002', 3, 0, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH129', '24MQ1A04E4', 'COL001', 'PLT003', 2, 4, 1);
INSERT INTO achievements_fact (student_achievements_id, student_id, college_id, platform_id, certifications, projects, workshops) VALUES ('ACH130', '24MQ1A0304', 'COL001', 'PLT005', 5, 4, 3);