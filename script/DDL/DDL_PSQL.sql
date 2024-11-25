CREATE TABLE "DKPB" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "areaId" VARCHAR2(50),
  "periode" NUMBER,
  "verified_oleh" VARCHAR2(100),
  "verified_tanggal" DATE,
  "approved_oleh" VARCHAR2(100),
  "approved_tanggal" DATE,
  "uploaded_oleh" VARCHAR2(20),
  "created_at" DATE,
  "counter" NUMBER,
  "status" VARCHAR2(50)
);

CREATE TABLE "Log" (
  "dkpb_id" NUMBER,
  "uploader" NUMBER,
  "viewer" NUMBER,
  "status" NUMBER,
  "message" VARCHAR2(255),
  "created_at" DATE,
  CONSTRAINT "FK_Log_dkpb" FOREIGN KEY ("dkpb_id") REFERENCES "DKPB" ("id")
);

CREATE TABLE "Upload" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "path" VARCHAR2(255),
  "dkpbid" NUMBER,
  "periode" DATE,
  CONSTRAINT "FK_Upload_dkpb" FOREIGN KEY ("dkpbid") REFERENCES "DKPB" ("id")
);

CREATE TABLE "dkpb_details" (
  "dkpb_id" NUMBER,
  "id" NUMBER PRIMARY KEY,
  "kategori_bangunan" VARCHAR2(100),
  "komponen_id" NUMBER,
  "material_id" NUMBER,
  "value" FLOAT,
  CONSTRAINT "FK_dkpb_details_dkpb" FOREIGN KEY ("dkpb_id") REFERENCES "DKPB" ("id")
);

CREATE TABLE "User" (
  "NIP" VARCHAR2(20) PRIMARY KEY,
  "UnitKantor" VARCHAR2(100)
);

CREATE TABLE "MaterialDetail" (
  "id" NUMBER PRIMARY KEY,
  "materialId" NUMBER,
  "harga" FLOAT,
  "koefisien" FLOAT,
  "periode" DATE,
  "idArea" NUMBER,
  "created_at" DATE,
  "updated_at" DATE
);

CREATE TABLE "ModelBangunan" (
  "id" NUMBER PRIMARY KEY,
  "name" VARCHAR2(100),
  "idArea" NUMBER,
  "DKPBID" NUMBER,
  CONSTRAINT "FK_ModelBangunan_dkpb" FOREIGN KEY ("DKPBID") REFERENCES "DKPB" ("id")
);

CREATE TABLE "ModelBangunanDetails" (
  "modelBangunanid" NUMBER,
  "lantai" VARCHAR2(50),
  "luas" FLOAT,
  "basement" NUMBER,
  "kondisiTanah" NUMBER,
  "MasterModel" NUMBER,
  CONSTRAINT "FK_ModelBangunanDetails_ModelBangunan" FOREIGN KEY ("modelBangunanid") REFERENCES "ModelBangunan" ("id")
);

CREATE TABLE "MasterKondisiTanah" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "koefisen" FLOAT,
  "periode" DATE
);

CREATE TABLE "MasterLantai" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "koefisien" FLOAT,
  "periode" DATE
);

CREATE TABLE "MasterListrik" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "harga" FLOAT,
  "periode" DATE
);

CREATE TABLE "MasterMaterial" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "created_at" DATE,
  "updated_at" DATE,
  "komponen_id" NUMBER,
  CONSTRAINT "FK_MasterMaterial_komponen" FOREIGN KEY ("komponen_id") REFERENCES "MasterKomponen" ("id")
);

CREATE TABLE "MasterKomponen" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100)
);

CREATE TABLE "MasterKategoriBangunan" (
  "id" NUMBER PRIMARY KEY,
  "kode" VARCHAR2(50),
  "nama" VARCHAR2(100)
);

CREATE TABLE "MasterArea" (
  "id" NUMBER PRIMARY KEY,
  "nama" VARCHAR2(100),
  "kanwil" VARCHAR2(100)
);

CREATE TABLE "MasterModel" (
  "id" NUMBER PRIMARY KEY,
  "KategoriBangunan" NUMBER,
  "Struktur_Bawah" NUMBER,
  "Struktur_Rangka" NUMBER,
  "Struktur_Atap" NUMBER,
  "Atap" NUMBER,
  "Dinding" NUMBER,
  "Langit_Langit" NUMBER,
  "Lantai" NUMBER,
  "Instalasi_Air" NUMBER,
  "Instalasi_Listrik" NUMBER,
  "Penyambungan" NUMBER,
  "Pelapis_Dinding" NUMBER
);

CREATE TABLE "SNBA" (
  "id" NUMBER PRIMARY KEY,
  "input" VARCHAR2(255),
  "snba" FLOAT,
  "approved_oleh" NUMBER,
  "approved_date" DATE,
  "send_date" DATE,
  "send_status" NUMBER
);
