-- AlterTable
ALTER TABLE `patient` MODIFY `patient_id` INTEGER NOT NULL AUTO_INCREMENT;

-- CreateTable
CREATE TABLE `PhoneNumber` (
    `pid` INTEGER NOT NULL AUTO_INCREMENT,
    `phone_number` INTEGER NOT NULL,

    PRIMARY KEY (`pid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payement` (
    `billing_id` INTEGER NOT NULL AUTO_INCREMENT,
    `payment_method` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`billing_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Location` (
    `street` VARCHAR(191) NOT NULL,
    `zip` INTEGER NOT NULL,

    PRIMARY KEY (`street`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
