import {MigrationInterface, QueryRunner} from "typeorm";

export class alterColumnProduct1678527741517 implements MigrationInterface {

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query("ALTER TABLE product MODIFY COLUMN description text");
        await queryRunner.query("ALTER TABLE product ADD COLUMN detailAddress varchar(255) DEFAULT NULL");
        await queryRunner.query("ALTER TABLE product ADD COLUMN ownerName varchar(255) DEFAULT NULL");
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query("ALTER TABLE product DROP COLUMN detailAddress");
        await queryRunner.query("ALTER TABLE product DROP COLUMN ownerName");
    }

}
