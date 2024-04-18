/*
  Warnings:

  - You are about to drop the `Ayo` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `Ayo`;

-- CreateTable
CREATE TABLE `Insurance` (
    `insurance_id` INTEGER NOT NULL,
    `company` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`insurance_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
