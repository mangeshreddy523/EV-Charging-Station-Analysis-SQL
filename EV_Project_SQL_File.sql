CREATE DATABASE ev_charging_project;
USE ev_charging_project;

CREATE TABLE stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    city VARCHAR(60) NOT NULL,
    state VARCHAR(60) NOT NULL,
    operator VARCHAR(60) NOT NULL,
    connector_type VARCHAR(30) NOT NULL,
    power_kw INT NOT NULL,
    charging_ports INT NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    city VARCHAR(60) NOT NULL,
    state VARCHAR(60) NOT NULL,
    vehicle_model VARCHAR(60) NOT NULL,
    battery_capacity_kwh INT NOT NULL
);

CREATE TABLE charging_sessions (
    session_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    station_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    duration_minutes DECIMAL(6,1) NOT NULL,
    energy_kwh DECIMAL(7,2) NOT NULL,
    cost_inr DECIMAL(9,2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    session_status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_session_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_session_station FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

INSERT INTO stations (station_id, station_name, city, state, operator, connector_type, power_kw, charging_ports, status) VALUES
  (1, 'Pune EV Hub 1', 'Pune', 'Maharashtra', 'Tata Power', 'CCS2', 22, 2, 'Active'),
  (2, 'Mumbai EV Hub 2', 'Mumbai', 'Maharashtra', 'ChargeZone', 'Type 2', 30, 4, 'Active'),
  (3, 'Nagpur EV Hub 3', 'Nagpur', 'Maharashtra', 'Statiq', 'CHAdeMO', 50, 6, 'Active'),
  (4, 'Bengaluru EV Hub 1', 'Bengaluru', 'Karnataka', 'Ather Grid', 'Bharat AC-001', 60, 8, 'Maintenance'),
  (5, 'Mysuru EV Hub 2', 'Mysuru', 'Karnataka', 'Zeon Charging', 'CCS2', 120, 2, 'Active'),
  (6, 'Hyderabad EV Hub 3', 'Hyderabad', 'Telangana', 'Tata Power', 'Type 2', 150, 4, 'Active'),
  (7, 'Chennai EV Hub 1', 'Chennai', 'Tamil Nadu', 'ChargeZone', 'CHAdeMO', 22, 6, 'Active'),
  (8, 'Coimbatore EV Hub 2', 'Coimbatore', 'Tamil Nadu', 'Statiq', 'Bharat AC-001', 30, 8, 'Maintenance'),
  (9, 'Delhi EV Hub 3', 'Delhi', 'Delhi', 'Ather Grid', 'CCS2', 50, 2, 'Active'),
  (10, 'Jaipur EV Hub 1', 'Jaipur', 'Rajasthan', 'Zeon Charging', 'Type 2', 60, 4, 'Active'),
  (11, 'Ahmedabad EV Hub 2', 'Ahmedabad', 'Gujarat', 'Tata Power', 'CHAdeMO', 120, 6, 'Active'),
  (12, 'Surat EV Hub 3', 'Surat', 'Gujarat', 'ChargeZone', 'Bharat AC-001', 150, 8, 'Maintenance'),
  (13, 'Kochi EV Hub 1', 'Kochi', 'Kerala', 'Statiq', 'CCS2', 22, 2, 'Active'),
  (14, 'Indore EV Hub 2', 'Indore', 'Madhya Pradesh', 'Ather Grid', 'Type 2', 30, 4, 'Active'),
  (15, 'Lucknow EV Hub 3', 'Lucknow', 'Uttar Pradesh', 'Zeon Charging', 'CHAdeMO', 50, 6, 'Active');

INSERT INTO users (user_id, full_name, email, city, state, vehicle_model, battery_capacity_kwh) VALUES
  (1, 'Aarav Singh', 'evuser001@example.com', 'Bengaluru', 'Karnataka', 'Tata Nexon EV', 30),
  (2, 'Isha Shah', 'evuser002@example.com', 'Chennai', 'Tamil Nadu', 'MG ZS EV', 35),
  (3, 'Vivaan Iyer', 'evuser003@example.com', 'Jaipur', 'Rajasthan', 'Hyundai Kona', 40),
  (4, 'Ananya Pawar', 'evuser004@example.com', 'Kochi', 'Kerala', 'Tata Tiago EV', 45),
  (5, 'Aditya Reddy', 'evuser005@example.com', 'Pune', 'Maharashtra', 'BYD Atto 3', 50),
  (6, 'Saanvi Jadhav', 'evuser006@example.com', 'Bengaluru', 'Karnataka', 'Mahindra XUV400', 60),
  (7, 'Arjun Joshi', 'evuser007@example.com', 'Chennai', 'Tamil Nadu', 'Tata Nexon EV', 72),
  (8, 'Diya Gupta', 'evuser008@example.com', 'Jaipur', 'Rajasthan', 'MG ZS EV', 30),
  (9, 'Rohan Kulkarni', 'evuser009@example.com', 'Kochi', 'Kerala', 'Hyundai Kona', 35),
  (10, 'Meera Khan', 'evuser010@example.com', 'Pune', 'Maharashtra', 'Tata Tiago EV', 40),
  (11, 'Kabir Deshmukh', 'evuser011@example.com', 'Bengaluru', 'Karnataka', 'BYD Atto 3', 45),
  (12, 'Aditi Nair', 'evuser012@example.com', 'Chennai', 'Tamil Nadu', 'Mahindra XUV400', 50),
  (13, 'Reyansh Patil', 'evuser013@example.com', 'Jaipur', 'Rajasthan', 'Tata Nexon EV', 60),
  (14, 'Kavya Mehta', 'evuser014@example.com', 'Kochi', 'Kerala', 'MG ZS EV', 72),
  (15, 'Ishaan Sharma', 'evuser015@example.com', 'Pune', 'Maharashtra', 'Hyundai Kona', 30),
  (16, 'Pooja Singh', 'evuser016@example.com', 'Bengaluru', 'Karnataka', 'Tata Tiago EV', 35),
  (17, 'Rahul Shah', 'evuser017@example.com', 'Chennai', 'Tamil Nadu', 'BYD Atto 3', 40),
  (18, 'Neha Iyer', 'evuser018@example.com', 'Jaipur', 'Rajasthan', 'Mahindra XUV400', 45),
  (19, 'Om Pawar', 'evuser019@example.com', 'Kochi', 'Kerala', 'Tata Nexon EV', 50),
  (20, 'Sneha Reddy', 'evuser020@example.com', 'Pune', 'Maharashtra', 'MG ZS EV', 60),
  (21, 'Siddharth Jadhav', 'evuser021@example.com', 'Bengaluru', 'Karnataka', 'Hyundai Kona', 72),
  (22, 'Riya Joshi', 'evuser022@example.com', 'Chennai', 'Tamil Nadu', 'Tata Tiago EV', 30),
  (23, 'Atharv Gupta', 'evuser023@example.com', 'Jaipur', 'Rajasthan', 'BYD Atto 3', 35),
  (24, 'Tanvi Kulkarni', 'evuser024@example.com', 'Kochi', 'Kerala', 'Mahindra XUV400', 40),
  (25, 'Kunal Khan', 'evuser025@example.com', 'Pune', 'Maharashtra', 'Tata Nexon EV', 45),
  (26, 'Priya Deshmukh', 'evuser026@example.com', 'Bengaluru', 'Karnataka', 'MG ZS EV', 50),
  (27, 'Yash Nair', 'evuser027@example.com', 'Chennai', 'Tamil Nadu', 'Hyundai Kona', 60),
  (28, 'Mira Patil', 'evuser028@example.com', 'Jaipur', 'Rajasthan', 'Tata Tiago EV', 72),
  (29, 'Dev Mehta', 'evuser029@example.com', 'Kochi', 'Kerala', 'BYD Atto 3', 30),
  (30, 'Sakshi Sharma', 'evuser030@example.com', 'Pune', 'Maharashtra', 'Mahindra XUV400', 35),
  (31, 'Nikhil Singh', 'evuser031@example.com', 'Bengaluru', 'Karnataka', 'Tata Nexon EV', 40),
  (32, 'Janhavi Shah', 'evuser032@example.com', 'Chennai', 'Tamil Nadu', 'MG ZS EV', 45),
  (33, 'Akash Iyer', 'evuser033@example.com', 'Jaipur', 'Rajasthan', 'Hyundai Kona', 50),
  (34, 'Shruti Pawar', 'evuser034@example.com', 'Kochi', 'Kerala', 'Tata Tiago EV', 60),
  (35, 'Manav Reddy', 'evuser035@example.com', 'Pune', 'Maharashtra', 'BYD Atto 3', 72);

INSERT INTO charging_sessions (session_id, user_id, station_id, start_time, duration_minutes, energy_kwh, cost_inr, payment_method, session_status) VALUES
  (1, 8, 1, '2026-09-11 08:15:00', 57.7, 14.35, 144.79, 'UPI', 'Completed'),
  (2, 35, 2, '2026-07-21 19:20:00', 23.1, 11.28, 136.6, 'Card', 'Completed'),
  (3, 2, 9, '2026-03-10 02:45:00', 123.3, 41.51, 494.8, 'Wallet', 'Completed'),
  (4, 18, 13, '2026-01-03 11:10:00', 131.1, 27.8, 303.3, 'Net Banking', 'Cancelled'),
  (5, 22, 2, '2026-02-01 21:20:00', 33.7, 61.78, 1103.39, 'UPI', 'Completed'),
  (6, 3, 12, '2026-06-07 01:30:00', 38.2, 66.79, 649.2, 'Card', 'Completed'),
  (7, 19, 14, '2026-08-03 19:30:00', 161.4, 29.23, 335.56, 'Wallet', 'Completed'),
  (8, 5, 1, '2026-08-14 23:10:00', 143.2, 71.01, 1545.18, 'Net Banking', 'Cancelled'),
  (9, 7, 7, '2026-04-06 03:20:00', 121.0, 29.44, 419.23, 'UPI', 'Completed'),
  (10, 14, 11, '2026-04-02 09:45:00', 169.7, 48.42, 868.65, 'Card', 'Completed'),
  (11, 11, 9, '2026-09-07 03:10:00', 44.5, 30.42, 725.21, 'Wallet', 'Completed'),
  (12, 15, 11, '2026-04-21 22:00:00', 55.1, 7.15, 95.74, 'Net Banking', 'Cancelled'),
  (13, 18, 2, '2026-03-14 06:30:00', 160.0, 26.08, 486.65, 'UPI', 'Completed'),
  (14, 26, 15, '2026-08-08 16:20:00', 41.1, 14.36, 287.92, 'Card', 'Completed'),
  (15, 35, 5, '2026-09-13 05:30:00', 87.4, 44.1, 622.25, 'Wallet', 'Completed'),
  (16, 9, 9, '2026-06-18 16:00:00', 140.4, 62.69, 681.44, 'Net Banking', 'Cancelled'),
  (17, 11, 13, '2026-08-21 12:20:00', 114.6, 30.78, 546.04, 'UPI', 'Completed'),
  (18, 30, 9, '2026-03-28 01:30:00', 157.4, 5.77, 113.5, 'Card', 'Completed'),
  (19, 35, 13, '2026-04-02 07:45:00', 73.1, 24.66, 270.03, 'Wallet', 'Completed'),
  (20, 1, 12, '2026-09-03 21:15:00', 175.4, 56.05, 917.54, 'Net Banking', 'Cancelled'),
  (21, 7, 14, '2026-08-02 16:15:00', 154.4, 39.01, 451.74, 'UPI', 'Completed'),
  (22, 24, 13, '2026-02-25 09:30:00', 172.5, 66.8, 1519.03, 'Card', 'Completed'),
  (23, 21, 8, '2026-01-07 21:00:00', 168.5, 63.87, 1366.18, 'Wallet', 'Completed'),
  (24, 20, 4, '2026-01-21 00:10:00', 160.2, 68.45, 672.86, 'Net Banking', 'Cancelled'),
  (25, 32, 14, '2026-01-24 20:30:00', 142.1, 13.6, 215.83, 'UPI', 'Completed'),
  (26, 11, 5, '2026-06-30 08:30:00', 86.5, 19.19, 323.54, 'Card', 'Completed'),
  (27, 13, 12, '2026-04-17 15:20:00', 179.2, 48.54, 742.18, 'Wallet', 'Completed'),
  (28, 34, 8, '2026-02-11 13:10:00', 54.4, 27.65, 487.19, 'Net Banking', 'Cancelled'),
  (29, 15, 10, '2026-03-17 10:00:00', 29.5, 47.28, 569.72, 'UPI', 'Completed'),
  (30, 3, 14, '2026-04-24 00:00:00', 101.3, 23.66, 379.03, 'Card', 'Completed'),
  (31, 35, 3, '2026-09-05 03:30:00', 111.3, 21.28, 336.86, 'Wallet', 'Completed'),
  (32, 27, 4, '2026-02-02 10:00:00', 124.8, 28.74, 427.36, 'Net Banking', 'Cancelled'),
  (33, 4, 11, '2026-08-12 07:45:00', 33.9, 31.98, 440.04, 'UPI', 'Completed'),
  (34, 7, 4, '2026-03-07 15:10:00', 104.9, 14.39, 163.18, 'Card', 'Completed'),
  (35, 30, 4, '2026-01-26 23:20:00', 148.9, 62.35, 624.75, 'Wallet', 'Completed'),
  (36, 35, 14, '2026-01-06 06:00:00', 168.1, 61.86, 685.41, 'Net Banking', 'Cancelled'),
  (37, 32, 8, '2026-03-15 05:20:00', 164.2, 16.03, 136.74, 'UPI', 'Completed'),
  (38, 25, 5, '2026-09-25 21:20:00', 64.2, 51.67, 1024.1, 'Card', 'Completed'),
  (39, 32, 3, '2026-03-07 01:15:00', 53.3, 8.92, 177.51, 'Wallet', 'Completed'),
  (40, 4, 12, '2026-04-18 07:00:00', 26.1, 36.94, 840.38, 'Net Banking', 'Cancelled'),
  (41, 34, 3, '2026-01-20 15:30:00', 31.0, 17.45, 309.21, 'UPI', 'Completed'),
  (42, 16, 7, '2026-02-11 04:30:00', 57.9, 44.83, 811.42, 'Card', 'Completed'),
  (43, 27, 11, '2026-07-19 11:30:00', 102.7, 67.63, 789.24, 'Wallet', 'Completed'),
  (44, 21, 4, '2026-04-01 21:20:00', 39.2, 48.25, 752.22, 'Net Banking', 'Cancelled'),
  (45, 5, 1, '2026-06-06 16:30:00', 179.7, 71.74, 691.57, 'UPI', 'Completed'),
  (46, 14, 9, '2026-04-01 18:10:00', 169.2, 64.02, 1416.76, 'Card', 'Completed'),
  (47, 24, 5, '2026-02-24 02:20:00', 153.1, 52.14, 937.48, 'Wallet', 'Completed'),
  (48, 34, 1, '2026-08-17 05:30:00', 66.5, 49.45, 1139.82, 'Net Banking', 'Cancelled'),
  (49, 9, 5, '2026-02-09 15:00:00', 138.3, 15.42, 198.46, 'UPI', 'Completed'),
  (50, 14, 12, '2026-04-28 06:10:00', 129.4, 62.15, 1014.91, 'Card', 'Completed'),
  (51, 17, 15, '2026-01-18 14:00:00', 120.8, 60.57, 556.03, 'Wallet', 'Completed'),
  (52, 22, 13, '2026-02-14 21:45:00', 176.7, 15.83, 242.99, 'Net Banking', 'Cancelled'),
  (53, 28, 9, '2026-01-04 13:00:00', 30.2, 64.17, 1444.47, 'UPI', 'Completed'),
  (54, 35, 1, '2026-05-07 06:30:00', 107.5, 33.8, 309.27, 'Card', 'Completed'),
  (55, 24, 15, '2026-01-14 20:15:00', 52.0, 21.72, 219.15, 'Wallet', 'Completed'),
  (56, 27, 10, '2026-09-14 01:10:00', 168.0, 20.86, 229.88, 'Net Banking', 'Cancelled'),
  (57, 12, 15, '2026-05-21 23:00:00', 47.1, 66.94, 1380.97, 'UPI', 'Completed'),
  (58, 27, 13, '2026-08-17 21:45:00', 149.3, 22.88, 473.62, 'Card', 'Completed'),
  (59, 7, 7, '2026-01-14 11:20:00', 54.0, 59.71, 933.27, 'Wallet', 'Completed'),
  (60, 20, 14, '2026-03-19 22:10:00', 21.8, 17.94, 243.8, 'Net Banking', 'Cancelled'),
  (61, 5, 13, '2026-04-06 12:15:00', 121.9, 31.78, 753.5, 'UPI', 'Completed'),
  (62, 35, 6, '2026-01-10 16:00:00', 160.1, 22.5, 393.75, 'Card', 'Completed'),
  (63, 17, 1, '2026-02-07 06:30:00', 88.4, 53.81, 718.9, 'Wallet', 'Completed'),
  (64, 33, 2, '2026-05-12 17:30:00', 48.8, 7.97, 121.62, 'Net Banking', 'Cancelled'),
  (65, 34, 15, '2026-07-04 00:45:00', 134.5, 54.71, 1033.47, 'UPI', 'Completed'),
  (66, 24, 7, '2026-01-25 03:45:00', 167.2, 46.75, 877.97, 'Card', 'Completed'),
  (67, 8, 12, '2026-04-13 18:30:00', 68.1, 32.36, 476.99, 'Wallet', 'Completed'),
  (68, 19, 9, '2026-02-13 16:10:00', 86.1, 68.0, 1292.0, 'Net Banking', 'Cancelled'),
  (69, 12, 10, '2026-07-14 12:15:00', 83.8, 60.86, 803.96, 'UPI', 'Completed'),
  (70, 14, 7, '2026-09-26 10:30:00', 116.3, 26.59, 408.16, 'Card', 'Completed'),
  (71, 14, 9, '2026-06-11 18:45:00', 45.5, 10.68, 176.11, 'Wallet', 'Completed'),
  (72, 22, 2, '2026-09-14 15:10:00', 127.0, 20.05, 232.38, 'Net Banking', 'Cancelled'),
  (73, 2, 1, '2026-03-25 19:20:00', 117.0, 56.49, 878.98, 'UPI', 'Completed'),
  (74, 13, 12, '2026-08-26 22:20:00', 98.1, 21.35, 398.6, 'Card', 'Completed'),
  (75, 1, 15, '2026-09-14 13:00:00', 144.1, 19.66, 412.07, 'Wallet', 'Completed'),
  (76, 34, 8, '2026-01-18 09:30:00', 58.4, 61.84, 963.47, 'Net Banking', 'Cancelled'),
  (77, 30, 11, '2026-07-01 13:30:00', 114.5, 68.65, 1532.27, 'UPI', 'Completed'),
  (78, 33, 7, '2026-07-07 06:20:00', 163.3, 54.82, 869.45, 'Card', 'Completed'),
  (79, 17, 13, '2026-03-26 15:45:00', 62.9, 57.1, 914.17, 'Wallet', 'Completed'),
  (80, 16, 5, '2026-05-31 09:00:00', 133.6, 20.71, 283.93, 'Net Banking', 'Cancelled'),
  (81, 35, 2, '2026-02-17 11:10:00', 55.5, 51.49, 1001.48, 'UPI', 'Completed'),
  (82, 5, 7, '2026-05-20 09:15:00', 105.9, 32.86, 384.79, 'Card', 'Completed'),
  (83, 27, 7, '2026-09-21 00:30:00', 171.3, 6.31, 139.77, 'Wallet', 'Completed'),
  (84, 25, 8, '2026-01-03 06:15:00', 66.4, 31.13, 694.82, 'Net Banking', 'Cancelled'),
  (85, 27, 9, '2026-09-13 09:45:00', 106.5, 45.42, 541.41, 'UPI', 'Completed'),
  (86, 15, 5, '2026-05-30 00:20:00', 22.7, 27.52, 523.71, 'Card', 'Completed'),
  (87, 26, 12, '2026-02-26 14:20:00', 167.0, 70.71, 1186.51, 'Wallet', 'Completed'),
  (88, 26, 10, '2026-07-12 21:45:00', 22.4, 48.06, 509.44, 'Net Banking', 'Cancelled'),
  (89, 30, 3, '2026-01-18 09:15:00', 79.4, 19.18, 260.27, 'UPI', 'Completed'),
  (90, 25, 5, '2026-09-14 22:20:00', 58.9, 10.49, 92.31, 'Card', 'Completed'),
  (91, 35, 1, '2026-04-30 16:10:00', 123.3, 57.34, 1066.52, 'Wallet', 'Completed'),
  (92, 2, 4, '2026-03-10 07:00:00', 118.7, 20.98, 332.32, 'Net Banking', 'Cancelled'),
  (93, 8, 10, '2026-03-16 15:20:00', 131.3, 56.38, 625.82, 'UPI', 'Completed'),
  (94, 8, 13, '2026-02-26 03:15:00', 35.5, 6.72, 89.64, 'Card', 'Completed'),
  (95, 25, 7, '2026-09-02 07:10:00', 30.3, 51.27, 934.14, 'Wallet', 'Completed'),
  (96, 7, 12, '2026-09-21 22:15:00', 155.7, 45.23, 469.49, 'Net Banking', 'Cancelled'),
  (97, 3, 6, '2026-07-02 02:20:00', 125.2, 9.62, 178.35, 'UPI', 'Completed'),
  (98, 1, 14, '2026-05-24 15:20:00', 35.1, 69.37, 1272.94, 'Card', 'Completed'),
  (99, 30, 12, '2026-02-22 11:20:00', 46.5, 39.96, 742.46, 'Wallet', 'Completed'),
  (100, 35, 13, '2026-06-15 06:20:00', 88.6, 53.98, 683.39, 'Net Banking', 'Cancelled'),
  (101, 16, 14, '2026-01-30 19:15:00', 160.8, 21.34, 335.04, 'UPI', 'Completed'),
  (102, 25, 6, '2026-01-11 01:20:00', 155.9, 17.18, 202.55, 'Card', 'Completed'),
  (103, 17, 6, '2026-04-06 16:30:00', 131.6, 23.51, 203.6, 'Wallet', 'Completed'),
  (104, 13, 2, '2026-03-24 15:45:00', 83.8, 42.2, 516.11, 'Net Banking', 'Cancelled'),
  (105, 31, 11, '2026-09-01 05:20:00', 90.6, 6.16, 80.45, 'UPI', 'Completed'),
  (106, 26, 12, '2026-03-25 07:15:00', 125.6, 29.72, 507.62, 'Card', 'Completed'),
  (107, 23, 7, '2026-09-12 20:30:00', 71.6, 52.09, 661.54, 'Wallet', 'Completed'),
  (108, 17, 4, '2026-02-11 10:45:00', 49.2, 13.01, 218.7, 'Net Banking', 'Cancelled'),
  (109, 12, 4, '2026-03-16 02:45:00', 96.4, 53.55, 1265.92, 'UPI', 'Completed'),
  (110, 34, 10, '2026-04-07 20:00:00', 152.9, 24.85, 350.14, 'Card', 'Completed'),
  (111, 20, 1, '2026-08-30 22:30:00', 38.5, 8.05, 75.27, 'Wallet', 'Completed'),
  (112, 19, 12, '2026-02-13 08:45:00', 158.7, 37.89, 834.72, 'Net Banking', 'Cancelled'),
  (113, 19, 8, '2026-06-13 15:20:00', 73.2, 69.69, 864.85, 'UPI', 'Completed'),
  (114, 31, 2, '2026-01-23 13:20:00', 97.7, 43.66, 835.65, 'Card', 'Completed'),
  (115, 10, 3, '2026-07-12 08:15:00', 31.8, 21.63, 370.95, 'Wallet', 'Completed'),
  (116, 27, 10, '2026-07-23 17:30:00', 54.6, 40.01, 619.35, 'Net Banking', 'Cancelled'),
  (117, 29, 5, '2026-07-21 03:20:00', 67.5, 46.61, 836.65, 'UPI', 'Completed'),
  (118, 7, 13, '2026-03-13 04:45:00', 52.2, 49.25, 538.3, 'Card', 'Completed'),
  (119, 12, 9, '2026-01-26 20:10:00', 18.4, 35.18, 622.69, 'Wallet', 'Completed'),
  (120, 19, 1, '2026-03-21 06:15:00', 132.5, 52.1, 809.63, 'Net Banking', 'Cancelled'),
  (121, 15, 15, '2026-04-01 13:45:00', 113.5, 58.86, 681.01, 'UPI', 'Completed'),
  (122, 8, 9, '2026-03-18 23:45:00', 42.1, 22.8, 243.96, 'Card', 'Completed'),
  (123, 4, 3, '2026-04-16 05:30:00', 139.3, 43.14, 559.53, 'Wallet', 'Completed'),
  (124, 8, 8, '2026-08-24 07:15:00', 131.4, 68.16, 1108.28, 'Net Banking', 'Cancelled'),
  (125, 32, 8, '2026-01-28 16:30:00', 24.5, 33.95, 458.33, 'UPI', 'Completed'),
  (126, 17, 1, '2026-02-01 10:10:00', 173.8, 61.01, 1062.79, 'Card', 'Completed'),
  (127, 2, 13, '2026-08-18 17:15:00', 111.4, 56.13, 629.78, 'Wallet', 'Completed'),
  (128, 34, 11, '2026-06-01 04:15:00', 47.4, 44.22, 810.99, 'Net Banking', 'Cancelled'),
  (129, 32, 2, '2026-06-10 16:15:00', 84.2, 26.51, 268.28, 'UPI', 'Completed'),
  (130, 11, 6, '2026-05-21 18:45:00', 98.3, 49.39, 726.53, 'Card', 'Completed'),
  (131, 3, 8, '2026-01-31 07:15:00', 58.9, 12.77, 261.4, 'Wallet', 'Completed'),
  (132, 33, 14, '2026-01-01 15:45:00', 158.8, 35.95, 335.77, 'Net Banking', 'Cancelled'),
  (133, 34, 6, '2026-08-01 18:20:00', 119.3, 55.92, 652.03, 'UPI', 'Completed'),
  (134, 9, 15, '2026-04-09 13:20:00', 160.7, 37.48, 335.45, 'Card', 'Completed'),
  (135, 16, 12, '2026-02-24 07:15:00', 107.2, 42.0, 417.48, 'Wallet', 'Completed'),
  (136, 8, 8, '2026-02-10 08:45:00', 152.8, 38.39, 752.83, 'Net Banking', 'Cancelled'),
  (137, 33, 12, '2026-04-04 13:20:00', 153.2, 70.68, 867.95, 'UPI', 'Completed'),
  (138, 10, 7, '2026-03-07 07:30:00', 100.3, 63.91, 1398.99, 'Card', 'Completed'),
  (139, 18, 13, '2026-09-27 21:20:00', 73.1, 57.78, 730.34, 'Wallet', 'Completed'),
  (140, 1, 5, '2026-09-06 01:15:00', 153.7, 43.85, 821.31, 'Net Banking', 'Cancelled'),
  (141, 10, 8, '2026-07-04 02:20:00', 73.9, 41.98, 710.3, 'UPI', 'Completed'),
  (142, 30, 15, '2026-04-21 02:10:00', 176.9, 21.0, 303.24, 'Card', 'Completed'),
  (143, 27, 1, '2026-04-19 20:45:00', 94.6, 66.2, 953.94, 'Wallet', 'Completed'),
  (144, 10, 8, '2026-01-13 21:10:00', 99.4, 44.54, 978.99, 'Net Banking', 'Cancelled'),
  (145, 29, 2, '2026-06-29 18:20:00', 20.5, 14.66, 322.52, 'UPI', 'Completed'),
  (146, 10, 2, '2026-06-10 12:15:00', 72.8, 51.41, 954.68, 'Card', 'Completed'),
  (147, 22, 14, '2026-08-19 10:30:00', 79.6, 26.22, 514.96, 'Wallet', 'Completed'),
  (148, 32, 14, '2026-07-04 22:00:00', 118.0, 20.73, 396.15, 'Net Banking', 'Cancelled'),
  (149, 19, 4, '2026-09-13 03:00:00', 88.3, 11.6, 212.51, 'UPI', 'Completed'),
  (150, 7, 8, '2026-02-27 00:45:00', 66.5, 6.94, 93.9, 'Card', 'Completed'),
  (151, 4, 5, '2026-05-03 14:15:00', 87.8, 21.36, 318.05, 'Wallet', 'Completed'),
  (152, 12, 3, '2026-03-02 00:00:00', 116.7, 30.63, 584.73, 'Net Banking', 'Cancelled'),
  (153, 32, 15, '2026-07-19 07:10:00', 55.6, 47.74, 745.7, 'UPI', 'Completed'),
  (154, 1, 15, '2026-06-09 01:15:00', 127.8, 15.58, 239.15, 'Card', 'Completed'),
  (155, 23, 10, '2026-04-13 08:45:00', 173.8, 51.25, 798.48, 'Wallet', 'Completed'),
  (156, 20, 4, '2026-05-12 13:20:00', 35.3, 30.55, 429.53, 'Net Banking', 'Cancelled'),
  (157, 19, 12, '2026-04-12 00:00:00', 176.4, 49.1, 626.02, 'UPI', 'Completed'),
  (158, 4, 15, '2026-07-27 05:45:00', 98.5, 65.58, 848.61, 'Card', 'Completed'),
  (159, 15, 10, '2026-05-01 12:10:00', 121.1, 46.6, 885.87, 'Wallet', 'Completed'),
  (160, 9, 11, '2026-02-03 09:45:00', 122.7, 25.7, 393.98, 'Net Banking', 'Cancelled'),
  (161, 24, 12, '2026-02-15 02:00:00', 165.4, 26.89, 401.74, 'UPI', 'Completed'),
  (162, 13, 3, '2026-09-26 17:30:00', 160.0, 29.51, 480.42, 'Card', 'Completed'),
  (163, 18, 14, '2026-02-26 09:15:00', 166.1, 68.26, 1603.43, 'Wallet', 'Completed'),
  (164, 19, 12, '2026-04-26 20:00:00', 93.9, 10.05, 202.91, 'Net Banking', 'Cancelled'),
  (165, 15, 14, '2026-08-20 02:45:00', 127.3, 31.63, 683.52, 'UPI', 'Completed'),
  (166, 24, 2, '2026-09-28 03:20:00', 20.3, 40.95, 636.77, 'Card', 'Completed'),
  (167, 17, 10, '2026-05-11 07:45:00', 170.3, 12.26, 148.59, 'Wallet', 'Completed'),
  (168, 2, 10, '2026-07-11 21:15:00', 166.3, 19.83, 187.99, 'Net Banking', 'Cancelled'),
  (169, 30, 15, '2026-08-28 13:15:00', 123.2, 12.82, 117.94, 'UPI', 'Completed'),
  (170, 3, 5, '2026-06-18 09:00:00', 33.7, 64.45, 683.17, 'Card', 'Completed'),
  (171, 30, 6, '2026-08-18 02:45:00', 130.8, 41.19, 724.94, 'Wallet', 'Completed'),
  (172, 10, 15, '2026-05-22 20:45:00', 34.0, 37.79, 560.43, 'Net Banking', 'Cancelled'),
  (173, 18, 1, '2026-08-24 20:15:00', 53.2, 34.79, 423.05, 'UPI', 'Completed'),
  (174, 24, 2, '2026-08-23 07:15:00', 106.2, 70.52, 991.51, 'Card', 'Completed'),
  (175, 26, 5, '2026-03-07 00:00:00', 171.7, 60.22, 597.38, 'Wallet', 'Completed'),
  (176, 14, 11, '2026-08-07 12:30:00', 175.3, 8.39, 114.69, 'Net Banking', 'Cancelled'),
  (177, 9, 13, '2026-07-12 23:10:00', 29.1, 56.27, 658.92, 'UPI', 'Completed'),
  (178, 14, 14, '2026-03-21 18:15:00', 143.4, 57.84, 1026.08, 'Card', 'Completed'),
  (179, 18, 14, '2026-02-19 15:10:00', 105.5, 58.5, 596.7, 'Wallet', 'Completed'),
  (180, 2, 3, '2026-01-06 07:15:00', 146.0, 20.94, 283.11, 'Net Banking', 'Cancelled'),
  (181, 12, 5, '2026-01-19 03:10:00', 138.2, 40.25, 807.41, 'UPI', 'Completed'),
  (182, 31, 8, '2026-09-23 19:15:00', 101.1, 12.31, 200.78, 'Card', 'Completed'),
  (183, 3, 12, '2026-09-25 14:45:00', 102.5, 35.69, 836.57, 'Wallet', 'Completed'),
  (184, 4, 8, '2026-05-18 08:20:00', 129.1, 37.85, 855.41, 'Net Banking', 'Cancelled'),
  (185, 5, 15, '2026-01-28 19:15:00', 116.5, 9.4, 119.94, 'UPI', 'Completed'),
  (186, 21, 7, '2026-07-24 03:30:00', 65.8, 38.87, 589.66, 'Card', 'Completed'),
  (187, 8, 14, '2026-08-12 17:45:00', 160.2, 41.94, 919.32, 'Wallet', 'Completed'),
  (188, 28, 8, '2026-03-20 05:20:00', 72.9, 35.38, 528.93, 'Net Banking', 'Cancelled'),
  (189, 7, 6, '2026-05-26 22:15:00', 125.7, 30.08, 326.97, 'UPI', 'Completed'),
  (190, 31, 2, '2026-02-01 09:00:00', 33.1, 11.47, 228.83, 'Card', 'Completed'),
  (191, 9, 9, '2026-01-21 17:30:00', 173.0, 42.63, 805.28, 'Wallet', 'Completed'),
  (192, 27, 6, '2026-08-16 08:20:00', 158.6, 53.31, 1253.32, 'Net Banking', 'Cancelled'),
  (193, 20, 6, '2026-02-05 14:30:00', 100.2, 15.37, 245.46, 'UPI', 'Completed'),
  (194, 7, 6, '2026-07-10 02:15:00', 36.6, 23.66, 284.16, 'Card', 'Completed'),
  (195, 28, 14, '2026-07-11 17:30:00', 117.4, 48.06, 428.21, 'Wallet', 'Completed'),
  (196, 18, 1, '2026-03-03 19:15:00', 131.8, 25.7, 353.89, 'Net Banking', 'Cancelled'),
  (197, 1, 3, '2026-02-19 03:30:00', 124.5, 9.66, 193.1, 'UPI', 'Completed'),
  (198, 2, 2, '2026-09-12 22:30:00', 52.9, 33.13, 456.53, 'Card', 'Completed'),
  (199, 24, 5, '2026-09-04 13:15:00', 143.8, 43.03, 422.55, 'Wallet', 'Completed'),
  (200, 4, 3, '2026-02-23 23:30:00', 26.1, 10.47, 160.92, 'Net Banking', 'Cancelled'),
  (201, 28, 8, '2026-07-27 11:20:00', 85.1, 19.44, 319.59, 'UPI', 'Completed'),
  (202, 23, 7, '2026-02-08 02:15:00', 127.9, 44.74, 745.82, 'Card', 'Completed'),
  (203, 20, 1, '2026-03-17 12:20:00', 177.5, 8.67, 101.18, 'Wallet', 'Completed'),
  (204, 14, 13, '2026-02-17 02:15:00', 64.9, 13.04, 211.38, 'Net Banking', 'Cancelled'),
  (205, 28, 3, '2026-02-14 08:20:00', 104.3, 20.42, 350.41, 'UPI', 'Completed'),
  (206, 23, 2, '2026-05-16 18:45:00', 24.9, 6.26, 142.6, 'Card', 'Completed'),
  (207, 21, 10, '2026-05-27 18:30:00', 83.5, 47.89, 622.09, 'Wallet', 'Completed'),
  (208, 26, 1, '2026-04-22 02:10:00', 147.8, 46.41, 993.17, 'Net Banking', 'Cancelled'),
  (209, 24, 2, '2026-05-30 07:00:00', 57.4, 44.45, 738.76, 'UPI', 'Completed'),
  (210, 26, 14, '2026-04-17 03:45:00', 73.0, 27.32, 303.53, 'Card', 'Completed'),
  (211, 33, 11, '2026-02-09 04:30:00', 100.6, 65.7, 914.54, 'Wallet', 'Completed'),
  (212, 10, 4, '2026-02-05 08:10:00', 59.5, 16.62, 180.66, 'Net Banking', 'Cancelled'),
  (213, 5, 3, '2026-09-22 01:45:00', 98.0, 55.55, 1126.55, 'UPI', 'Completed'),
  (214, 29, 11, '2026-07-12 22:45:00', 120.9, 46.84, 1025.8, 'Card', 'Completed'),
  (215, 21, 3, '2026-05-31 08:00:00', 94.0, 47.3, 985.73, 'Wallet', 'Completed'),
  (216, 4, 6, '2026-06-23 10:00:00', 68.3, 35.28, 330.93, 'Net Banking', 'Cancelled'),
  (217, 19, 2, '2026-08-09 07:00:00', 117.6, 38.97, 610.66, 'UPI', 'Completed'),
  (218, 3, 8, '2026-07-15 09:45:00', 48.5, 45.54, 740.94, 'Card', 'Completed'),
  (219, 4, 8, '2026-02-05 13:15:00', 177.1, 10.65, 197.13, 'Wallet', 'Completed'),
  (220, 3, 4, '2026-08-30 18:20:00', 178.5, 40.11, 719.97, 'Net Banking', 'Cancelled'),
  (221, 24, 6, '2026-04-07 19:20:00', 84.2, 27.67, 491.7, 'UPI', 'Completed'),
  (222, 22, 2, '2026-04-23 18:00:00', 108.4, 30.9, 383.47, 'Card', 'Completed'),
  (223, 10, 6, '2026-01-29 01:30:00', 125.5, 66.42, 884.05, 'Wallet', 'Completed'),
  (224, 26, 3, '2026-07-23 08:45:00', 170.0, 25.74, 369.11, 'Net Banking', 'Cancelled'),
  (225, 22, 14, '2026-02-13 20:45:00', 131.9, 68.46, 1640.3, 'UPI', 'Completed'),
  (226, 34, 2, '2026-08-09 18:45:00', 86.6, 29.24, 412.87, 'Card', 'Completed'),
  (227, 12, 4, '2026-04-27 21:20:00', 49.1, 72.0, 784.8, 'Wallet', 'Completed'),
  (228, 19, 14, '2026-09-27 06:00:00', 100.2, 41.16, 821.14, 'Net Banking', 'Cancelled'),
  (229, 34, 1, '2026-08-15 04:15:00', 160.0, 46.41, 824.24, 'UPI', 'Completed'),
  (230, 10, 3, '2026-03-03 23:45:00', 142.9, 59.21, 655.45, 'Card', 'Completed'),
  (231, 29, 1, '2026-05-21 11:15:00', 127.6, 20.91, 321.8, 'Wallet', 'Completed'),
  (232, 19, 13, '2026-09-13 18:20:00', 55.9, 21.02, 493.34, 'Net Banking', 'Cancelled'),
  (233, 31, 15, '2026-03-08 11:15:00', 127.9, 43.22, 662.56, 'UPI', 'Completed'),
  (234, 19, 13, '2026-05-11 14:30:00', 103.4, 69.74, 1475.7, 'Card', 'Completed'),
  (235, 9, 14, '2026-03-27 14:00:00', 121.9, 63.57, 1087.05, 'Wallet', 'Completed'),
  (236, 7, 12, '2026-06-26 08:00:00', 64.2, 56.13, 714.53, 'Net Banking', 'Cancelled'),
  (237, 33, 3, '2026-05-30 13:00:00', 171.3, 19.88, 307.94, 'UPI', 'Completed'),
  (238, 23, 15, '2026-01-10 08:20:00', 26.6, 38.63, 469.35, 'Card', 'Completed'),
  (239, 6, 6, '2026-03-18 21:00:00', 69.6, 11.64, 227.91, 'Wallet', 'Completed'),
  (240, 22, 13, '2026-02-20 02:10:00', 24.2, 66.47, 1051.56, 'Net Banking', 'Cancelled'),
  (241, 9, 13, '2026-08-30 01:20:00', 90.7, 5.35, 52.06, 'UPI', 'Completed'),
  (242, 17, 4, '2026-02-21 06:30:00', 170.3, 45.79, 689.6, 'Card', 'Completed'),
  (243, 19, 4, '2026-04-14 01:00:00', 25.7, 33.13, 689.44, 'Wallet', 'Completed'),
  (244, 30, 2, '2026-02-08 02:20:00', 114.7, 6.1, 100.59, 'Net Banking', 'Cancelled'),
  (245, 16, 12, '2026-02-19 06:15:00', 87.5, 46.19, 564.9, 'UPI', 'Completed'),
  (246, 27, 3, '2026-08-16 00:45:00', 31.9, 70.3, 671.37, 'Card', 'Completed'),
  (247, 34, 9, '2026-06-23 10:30:00', 107.8, 31.16, 492.02, 'Wallet', 'Completed'),
  (248, 25, 6, '2026-03-28 19:45:00', 20.6, 57.83, 800.37, 'Net Banking', 'Cancelled'),
  (249, 7, 13, '2026-07-18 20:45:00', 140.6, 13.94, 194.6, 'UPI', 'Completed'),
  (250, 22, 14, '2026-08-08 15:10:00', 152.5, 50.87, 1205.62, 'Card', 'Completed');

-- =========================================================
-- SQL PRACTICE QUERIES: DDL, DML, filtering, joins, functions,
-- aggregates, subqueries, CTE, window functions, views, indexes
-- =========================================================

-- Show Table
SELECT * FROM stations;
SELECT * FROM charging_sessions;
SELECT * FROM users;

-- 1. Basic SELECT and aliases
SELECT station_name AS station, city, power_kw AS power_rating
FROM stations;

-- 2. WHERE, AND, OR, BETWEEN
SELECT * FROM charging_sessions
WHERE energy_kwh BETWEEN 20 AND 50
  AND session_status = 'Completed';

-- 3. IN, LIKE, IS NULL
SELECT * FROM stations WHERE connector_type IN ('CCS2', 'Type 2');
SELECT * FROM users WHERE full_name LIKE 'A%';
SELECT * FROM users WHERE email IS NOT NULL;

-- 4. ORDER BY and LIMIT
SELECT * FROM charging_sessions ORDER BY cost_inr DESC LIMIT 10;

-- 5. DISTINCT
SELECT DISTINCT vehicle_model FROM users;

-- 6. String functions
SELECT full_name, UPPER(full_name) AS uppercase_name,
       LENGTH(full_name) AS name_length,
       CONCAT(city, ', ', state) AS location
FROM users;

-- 7. Numeric functions
SELECT session_id, ROUND(energy_kwh, 1) AS energy_rounded,
       CEIL(cost_inr) AS cost_ceil, FLOOR(cost_inr) AS cost_floor,
       ABS(cost_inr) AS absolute_cost
FROM charging_sessions LIMIT 15;

-- 8. Date/time functions
SELECT session_id, DATE(start_time) AS session_date,
       MONTHNAME(start_time) AS session_month,
       DAYNAME(start_time) AS weekday,
       TIMESTAMPDIFF(HOUR, start_time, DATE_ADD(start_time, INTERVAL duration_minutes MINUTE)) AS approx_hours
FROM charging_sessions LIMIT 15;

-- 9. INNER JOIN: sessions with user and station details
SELECT cs.session_id, u.full_name, s.station_name, s.city,
       cs.energy_kwh, cs.cost_inr, cs.session_status
FROM charging_sessions cs
JOIN users u ON cs.user_id = u.user_id
JOIN stations s ON cs.station_id = s.station_id;

-- 10. LEFT JOIN: include stations with no sessions (if any)
SELECT s.station_id, s.station_name, COUNT(cs.session_id) AS total_sessions
FROM stations s
LEFT JOIN charging_sessions cs ON s.station_id = cs.station_id
GROUP BY s.station_id, s.station_name
ORDER BY total_sessions DESC;

-- 11. Aggregate functions: COUNT, SUM, AVG, MIN, MAX
SELECT COUNT(*) AS sessions,
       SUM(energy_kwh) AS total_energy_kwh,
       ROUND(AVG(cost_inr), 2) AS average_cost,
       MIN(cost_inr) AS lowest_cost,
       MAX(cost_inr) AS highest_cost
FROM charging_sessions;

-- 12. GROUP BY and HAVING
SELECT s.city, COUNT(cs.session_id) AS sessions,
       ROUND(SUM(cs.energy_kwh), 2) AS energy_kwh
FROM stations s
JOIN charging_sessions cs ON s.station_id = cs.station_id
GROUP BY s.city
HAVING COUNT(cs.session_id) >= 10
ORDER BY energy_kwh DESC;

-- 13. CASE expression
SELECT session_id, cost_inr,
       CASE WHEN cost_inr >= 1000 THEN 'High'
            WHEN cost_inr >= 500 THEN 'Medium'
            ELSE 'Low' END AS cost_category
FROM charging_sessions;

-- 14. Subquery: users whose energy usage is above average
SELECT u.user_id, u.full_name
FROM users u
WHERE u.user_id IN (
    SELECT cs.user_id FROM charging_sessions cs
    GROUP BY cs.user_id
    HAVING SUM(cs.energy_kwh) > (SELECT AVG(user_energy)
        FROM (SELECT SUM(energy_kwh) AS user_energy
              FROM charging_sessions GROUP BY user_id) x)
);

-- 15. EXISTS
SELECT s.station_id, s.station_name
FROM stations s
WHERE EXISTS (
    SELECT 1 FROM charging_sessions cs
    WHERE cs.station_id = s.station_id AND cs.session_status = 'Completed'
);

-- 16. UNION: station cities and user cities
SELECT city, 'Station City' AS city_type FROM stations
UNION
SELECT city, 'User City' AS city_type FROM users;

-- 17. CTE 
WITH station_energy AS (
    SELECT station_id, SUM(energy_kwh) AS total_energy
    FROM charging_sessions
    WHERE session_status = 'Completed'
    GROUP BY station_id
)
SELECT s.station_name, COALESCE(se.total_energy, 0) AS total_energy
FROM stations s LEFT JOIN station_energy se ON s.station_id = se.station_id
ORDER BY total_energy DESC;

-- 18. Window functions: RANK and running total
SELECT session_id, station_id, cost_inr,
       RANK() OVER (PARTITION BY station_id ORDER BY cost_inr DESC) AS cost_rank,
       SUM(cost_inr) OVER (ORDER BY session_id) AS running_cost
FROM charging_sessions;

-- 19. Find duplicate-like repeated emails (unique constraint should prevent duplicates)
SELECT email, COUNT(*) AS occurrences
FROM users GROUP BY email HAVING COUNT(*) = 1;




-- 20. UPDATE and DELETE examples (commented out to protect starter data)
-- UPDATE stations SET status = 'Maintenance' WHERE station_id = 1;
-- DELETE FROM charging_sessions WHERE session_id = 250;

-- 21. Add index for common reporting joins/filtering
CREATE INDEX idx_sessions_start_time ON charging_sessions(start_time);
CREATE INDEX idx_sessions_station_status ON charging_sessions(station_id, session_status);

-- 22.Calculate monthly energy consumption.
SELECT
    DATE_FORMAT(start_time, '%Y-%m') AS month,
    ROUND(SUM(energy_kwh), 2) AS total_energy
FROM charging_sessions
WHERE session_status = 'Completed'
GROUP BY DATE_FORMAT(start_time, '%Y-%m')
ORDER BY month;
-- 23. Calculate revenue generated by each operator.
SELECT
    s.operator,
    ROUND(SUM(cs.cost_inr), 2) AS total_revenue
FROM stations s
JOIN charging_sessions cs
    ON s.station_id = cs.station_id
WHERE cs.session_status = 'Completed'
GROUP BY s.operator
ORDER BY total_revenue DESC;
-- 24. Calculate the running total of charging revenue.
SELECT
    session_id,
    start_time,
    cost_inr,
    SUM(cost_inr) OVER (
        ORDER BY start_time, session_id
    ) AS running_revenue
FROM charging_sessions
WHERE session_status = 'Completed';
-- 25. Find the second-highest charging cost.
SELECT MAX(cost_inr) AS second_highest_cost
FROM charging_sessions
WHERE cost_inr < (
    SELECT MAX(cost_inr)
    FROM charging_sessions
);
-- 26. Find charging sessions whose cost is higher than the average cost.
SELECT session_id, energy_kwh, cost_inr
FROM charging_sessions
WHERE cost_inr > (
    SELECT AVG(cost_inr)
    FROM charging_sessions
);

show tables;