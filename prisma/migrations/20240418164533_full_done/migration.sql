-- CreateTable
CREATE TABLE `Insurance` (
    `insurance_id` INTEGER NOT NULL AUTO_INCREMENT,
    `company` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`insurance_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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
    `Date` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Billing_billing_id_key`(`billing_id`),
    PRIMARY KEY (`patient_id`, `billing_id`, `insurance_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TotalCost` (
    `total_cost` INTEGER NOT NULL,
    `itemized_cost` INTEGER NOT NULL,

    PRIMARY KEY (`total_cost`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Appointment` (
    `appointment_id` INTEGER NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `professional_id` INTEGER NOT NULL,
    `data` VARCHAR(191) NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `purpose` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Appointment_appointment_id_key`(`appointment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patient` (
    `patient_id` INTEGER NOT NULL,
    `billing_id` INTEGER NOT NULL,

    PRIMARY KEY (`patient_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MedicalRecords` (
    `record_id` INTEGER NOT NULL AUTO_INCREMENT,
    `allergy_list` VARCHAR(191) NOT NULL,
    `lab_results` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`record_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Attend` (
    `appointment_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `purpose` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Attend_appointment_id_employee_id_key`(`appointment_id`, `employee_id`),
    PRIMARY KEY (`appointment_id`, `employee_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PhoneNumbers` (
    `pid` INTEGER NOT NULL AUTO_INCREMENT,
    `phone_number` INTEGER NOT NULL,

    PRIMARY KEY (`pid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payment` (
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

-- CreateTable
CREATE TABLE `Person` (
    `billing_id` INTEGER NOT NULL,
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

    UNIQUE INDEX `Person_PID_key`(`PID`),
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

-- AddForeignKey
ALTER TABLE `Billing` ADD CONSTRAINT `Billing_insurance_id_fkey` FOREIGN KEY (`insurance_id`) REFERENCES `Insurance`(`insurance_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Billing` ADD CONSTRAINT `Billing_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `Patient`(`patient_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `Patient`(`patient_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Attend` ADD CONSTRAINT `Attend_appointment_id_fkey` FOREIGN KEY (`appointment_id`) REFERENCES `Appointment`(`appointment_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Attend` ADD CONSTRAINT `Attend_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`Employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PhoneNumbers` ADD CONSTRAINT `PhoneNumbers_pid_fkey` FOREIGN KEY (`pid`) REFERENCES `Person`(`PID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_billing_id_fkey` FOREIGN KEY (`billing_id`) REFERENCES `Billing`(`billing_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Person` ADD CONSTRAINT `Person_billing_id_fkey` FOREIGN KEY (`billing_id`) REFERENCES `Billing`(`billing_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Assigned` ADD CONSTRAINT `Assigned_record_id_fkey` FOREIGN KEY (`record_id`) REFERENCES `MedicalRecords`(`record_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Assigned` ADD CONSTRAINT `Assigned_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`Employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Prescribed` ADD CONSTRAINT `Prescribed_treatment_id_fkey` FOREIGN KEY (`treatment_id`) REFERENCES `Treatments`(`treatment_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Prescribed` ADD CONSTRAINT `Prescribed_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`Employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Treatment_Prescription_Record` ADD CONSTRAINT `Treatment_Prescription_Record_treatment_id_fkey` FOREIGN KEY (`treatment_id`) REFERENCES `Treatments`(`treatment_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
