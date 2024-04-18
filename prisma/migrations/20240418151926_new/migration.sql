-- CreateTable
CREATE TABLE `Treatments` (
    `treatment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `outcome` VARCHAR(191) NOT NULL,
    `start_data` VARCHAR(191) NOT NULL,
    `end_data` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`treatment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Billing` (
    `patient_id` INTEGER NOT NULL,
    `billing_id` INTEGER NOT NULL,
    `insurance_id` INTEGER NOT NULL,
    `itemized_cost` INTEGER NOT NULL,
    `Date` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`billing_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TotalCost` (
    `total_cost` INTEGER NOT NULL,
    `itemized_cost` INTEGER NOT NULL,

    PRIMARY KEY (`total_cost`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Appointment` (
    `appointment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `patient_id` INTEGER NOT NULL,
    `professional_id` INTEGER NOT NULL,
    `data` VARCHAR(191) NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `purpose` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`appointment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patient` (
    `patient_id` INTEGER NOT NULL,
    `billing_id` INTEGER NOT NULL,

    PRIMARY KEY (`patient_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
