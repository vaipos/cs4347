-- CreateTable
CREATE TABLE `MedicalRecords` (
    `record_id` INTEGER NOT NULL,
    `allergy_list` VARCHAR(191) NOT NULL,
    `lab_results` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`record_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
