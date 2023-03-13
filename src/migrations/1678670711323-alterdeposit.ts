import {MigrationInterface, QueryRunner} from "typeorm";

export class alterdeposit1678670711323 implements MigrationInterface {

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query("ALTER TABLE deposit ADD COLUMN ownerName varchar(255) DEFAULT NULL");
        await queryRunner.query("ALTER TABLE deposit ADD COLUMN ownerEmail varchar(255) DEFAULT NULL");
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query("ALTER TABLE deposit DROP COLUMN ownerName");
        await queryRunner.query("ALTER TABLE deposit DROP COLUMN ownerEmail");
    }

}
