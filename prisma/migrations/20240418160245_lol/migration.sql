/*
  Warnings:

  - The primary key for the `Appointment` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Billing` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `PhoneNumber` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `patient` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `Appointment` DROP PRIMARY KEY,
    MODIFY `appointment_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`patient_id`, `appointment_id`);

-- AlterTable
ALTER TABLE `Billing` DROP PRIMARY KEY,
    ADD PRIMARY KEY (`patient_id`, `billing_id`, `insurance_id`);

-- DropTable
DROP TABLE `PhoneNumber`;

-- DropTable
DROP TABLE `patient`;

-- CreateTable
CREATE TABLE `Patient` (
    `patient_id` INTEGER NOT NULL,
    `billing_id` INTEGER NOT NULL,

    PRIMARY KEY (`patient_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Attend` (
    `appointment_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `purpose` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`appointment_id`, `employee_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PhoneNumbers` (
    `pid` INTEGER NOT NULL AUTO_INCREMENT,
    `phone_number` INTEGER NOT NULL,

    PRIMARY KEY (`pid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Person` (
    `first` VARCHAR(191) NOT NULL,
    `middle` VARCHAR(191) NOT NULL,
    `last` VARCHAR(191) NOT NULL,
    `DOB` DATETIME(3) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `street` VARCHAR(191) NOT NULL,
    `State` VARCHAR(191) NOT NULL,
    `PatientFlag` INTEGER NOT NULL,
    `HCPFlag` INTEGER NOT NULL,
    `PatientState` VARCHAR(191) NOT NULL,
    `Patient_id` INTEGER NOT NULL,
    `PID` INTEGER NOT NULL,
    `Employee_id` INTEGER NOT NULL,

    PRIMARY KEY (`PID`, `Employee_id`, `Patient_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Employee` (
    `Employee_id` INTEGER NOT NULL,
    `Specialization` VARCHAR(191) NOT NULL,
    `WorkingHours` INTEGER NOT NULL,
    `YearsofExperience` INTEGER NOT NULL,

    PRIMARY KEY (`Employee_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Specialization` (
    `Specialization` VARCHAR(191) NOT NULL,
    `Department` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Specialization`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Assigned` (
    `record_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `lab_results` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`record_id`, `employee_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prescribed` (
    `treatment_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`treatment_id`, `employee_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Treatment_Prescription_Record` (
    `treatment_id` INTEGER NOT NULL,
    `prescription_record` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`treatment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
