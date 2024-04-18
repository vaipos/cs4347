-- CreateTable
CREATE TABLE `Company` (
    `company` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,

    PRIMARY KEY (`company`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LabResults` (
    `lab_results` VARCHAR(191) NOT NULL,
    `post_diagnosis` VARCHAR(191) NOT NULL,
    `current_medication` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`lab_results`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AllergyList` (
    `allergy_list` VARCHAR(191) NOT NULL,
    `allergies` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`allergy_list`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
