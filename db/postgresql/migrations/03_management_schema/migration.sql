-- Dev: Rename Table
ALTER TABLE "account" RENAME TO "user";
ALTER TABLE "user" RENAME CONSTRAINT "account_pkey" TO "user_pkey";
ALTER INDEX "account_username_key" RENAME TO "user_username_key";

-- DropForeignKey
ALTER TABLE "event" DROP CONSTRAINT "event_session_id_fkey";

-- DropForeignKey
ALTER TABLE "event" DROP CONSTRAINT "event_website_id_fkey";

-- DropForeignKey
ALTER TABLE "pageview" DROP CONSTRAINT "pageview_session_id_fkey";

-- DropForeignKey
ALTER TABLE "pageview" DROP CONSTRAINT "pageview_website_id_fkey";

-- DropForeignKey
ALTER TABLE "session" DROP CONSTRAINT "session_website_id_fkey";

-- DropForeignKey
ALTER TABLE "website" DROP CONSTRAINT "website_user_id_fkey";

-- DropIndex
DROP INDEX "session_session_uuid_key";

-- DropIndex
DROP INDEX "website_user_id_idx";

-- AlterTable
ALTER TABLE "user"
ADD COLUMN     "user_uuid" UUID,
ADD COLUMN     "created_by_id" INTEGER,
ADD COLUMN     "is_deleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "updated_by_id" INTEGER;

-- AlterTable
ALTER TABLE "website"
ADD COLUMN     "created_by_id" INTEGER,
ADD COLUMN     "is_deleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "updated_at" TIMESTAMPTZ(6),
ADD COLUMN     "updated_by_id" INTEGER;

-- CreateTable
CREATE TABLE "group" (
    "group_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "group_pkey" PRIMARY KEY ("group_id")
);

-- CreateTable
CREATE TABLE "group_role" (
    "group_role_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "group_role_pkey" PRIMARY KEY ("group_role_id")
);

-- CreateTable
CREATE TABLE "group_website" (
    "group_website_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "website_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "group_website_pkey" PRIMARY KEY ("group_website_id")
);

-- CreateTable
CREATE TABLE "group_website_role" (
    "group_website_role_id" SERIAL NOT NULL,
    "group_website_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "group_website_role_pkey" PRIMARY KEY ("group_website_role_id")
);

-- CreateTable
CREATE TABLE "group_user" (
    "group_user_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "group_user_pkey" PRIMARY KEY ("group_user_id")
);

-- CreateTable
CREATE TABLE "permission" (
    "permission_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "permission_pkey" PRIMARY KEY ("permission_id")
);

-- CreateTable
CREATE TABLE "role" (
    "role_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "role_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "team" (
    "team_id" SERIAL NOT NULL,
    "team_uuid" UUID NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "team_pkey" PRIMARY KEY ("team_id")
);

-- CreateTable
CREATE TABLE "team_website" (
    "team_website_id" SERIAL NOT NULL,
    "team_id" INTEGER NOT NULL,
    "website_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "team_website_pkey" PRIMARY KEY ("team_website_id")
);

-- CreateTable
CREATE TABLE "team_user" (
    "team_user_id" SERIAL NOT NULL,
    "team_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "team_user_pkey" PRIMARY KEY ("team_user_id")
);

-- CreateTable
CREATE TABLE "user_role" (
    "user_role_id" SERIAL NOT NULL,
    "role_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "user_role_pkey" PRIMARY KEY ("user_role_id")
);

-- CreateTable
CREATE TABLE "user_website" (
    "user_website_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "website_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMPTZ(6),
    "updated_by_id" INTEGER,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "user_website_pkey" PRIMARY KEY ("user_website_id")
);

-- CreateAdminRole
INSERT INTO "role" ("name", "description") VALUES ('administrator', 'system administrator');

-- MoveAssignAdminUsersAdmin role
INSERT INTO user_role (role_id, user_id)
SELECT (SELECT role_id FROM "role" where name ='administrator'), user_id
FROM "user" where is_admin = true;

-- AssignWebsiteOwnersTo 
INSERT INTO user_website (user_id, website_id)
SELECT user_id, website_id 
FROM website;

-- AlterTable
ALTER TABLE "website" DROP COLUMN "user_id";

-- AlterTable
ALTER TABLE "user" DROP COLUMN "is_admin";

-- CreateIndex
CREATE UNIQUE INDEX "group_group_id_key" ON "group"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_name_key" ON "group"("name");

-- CreateIndex
CREATE UNIQUE INDEX "group_role_group_role_id_key" ON "group_role"("group_role_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_website_group_website_id_key" ON "group_website"("group_website_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_website_role_group_website_role_id_key" ON "group_website_role"("group_website_role_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_user_group_user_id_key" ON "group_user"("group_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "permission_permission_id_key" ON "permission"("permission_id");

-- CreateIndex
CREATE UNIQUE INDEX "permission_name_key" ON "permission"("name");

-- CreateIndex
CREATE UNIQUE INDEX "role_role_id_key" ON "role"("role_id");

-- CreateIndex
CREATE UNIQUE INDEX "role_name_uindex" ON "role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "team_team_id_key" ON "team"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "team_team_uuid_uindex" ON "team"("team_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "team_name_uindex" ON "team"("name");

-- CreateIndex
CREATE UNIQUE INDEX "team_website_team_website_id_key" ON "team_website"("team_website_id");

-- CreateIndex
CREATE UNIQUE INDEX "team_user_team_user_id_key" ON "team_user"("team_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_role_user_role_id_key" ON "user_role"("user_role_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_website_user_website_id_key" ON "user_website"("user_website_id");

-- CreateIndex
CREATE UNIQUE INDEX "event_event_id_key" ON "event"("event_id");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "event" ADD CONSTRAINT "event_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "session"("session_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "event" ADD CONSTRAINT "event_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "website"("website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pageview" ADD CONSTRAINT "pageview_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "session"("session_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pageview" ADD CONSTRAINT "pageview_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "website"("website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "website"("website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "website" ADD CONSTRAINT "website_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "website" ADD CONSTRAINT "website_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group" ADD CONSTRAINT "group_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group" ADD CONSTRAINT "group_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_role" ADD CONSTRAINT "group_role_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_role" ADD CONSTRAINT "group_role_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_role" ADD CONSTRAINT "group_role_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_role" ADD CONSTRAINT "group_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website" ADD CONSTRAINT "group_website_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website" ADD CONSTRAINT "group_website_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website" ADD CONSTRAINT "group_website_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "website"("website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website" ADD CONSTRAINT "group_website_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website_role" ADD CONSTRAINT "group_website_role_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website_role" ADD CONSTRAINT "group_website_role_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website_role" ADD CONSTRAINT "group_website_role_group_website_id_fkey" FOREIGN KEY ("group_website_id") REFERENCES "group_website"("group_website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_website_role" ADD CONSTRAINT "group_website_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_user" ADD CONSTRAINT "group_user_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_user" ADD CONSTRAINT "group_user_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_user" ADD CONSTRAINT "group_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_user" ADD CONSTRAINT "group_user_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permission" ADD CONSTRAINT "permission_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permission" ADD CONSTRAINT "permission_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role" ADD CONSTRAINT "role_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role" ADD CONSTRAINT "role_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_website" ADD CONSTRAINT "team_website_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_website" ADD CONSTRAINT "team_website_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_website" ADD CONSTRAINT "team_website_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "website"("website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_website" ADD CONSTRAINT "team_website_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "team"("team_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_user" ADD CONSTRAINT "team_user_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_user" ADD CONSTRAINT "team_user_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_user" ADD CONSTRAINT "team_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_user" ADD CONSTRAINT "team_user_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "team"("team_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD CONSTRAINT "user_role_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD CONSTRAINT "user_role_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD CONSTRAINT "user_role_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD CONSTRAINT "user_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_website" ADD CONSTRAINT "user_website_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_website" ADD CONSTRAINT "user_website_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "user"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_website" ADD CONSTRAINT "user_website_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "website"("website_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_website" ADD CONSTRAINT "user_website_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "website_share_id_key" RENAME TO "website_share_id_idx";
