--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.2
-- Dumped by pg_dump version 9.2.2
-- Started on 2013-01-16 11:08:16

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 190 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 190
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 191 (class 3079 OID 50564)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 191
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


SET search_path = public, pg_catalog;

--
-- TOC entry 244 (class 1255 OID 50608)
-- Name: left(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "left"(p_strings text, p_position integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
/* ---------------------------------------------------------
プロシージャ名
    left
処理概要
    文字列 p_strings を左部分から p_position文字分を抽出した文字列
[引数]
    p_strings                           : 抽出元文字列
    p_position                          : 左から何文字目かという位置
[戻り値]
    抽出した文字列
[実行例]
SELECT left('h001001002',2) AS answer;
SELECT left('h001001002',10) AS answer;
SELECT left('全角文字',0) AS answer;
SELECT left('全角文字',1) AS answer;
SELECT left('全角文字',2) AS answer;
--------------------------------------------------------- */
DECLARE
    rtnData                             text;
BEGIN
  rtnData := substring(p_strings from 1 for p_position);
  RETURN rtnData;
END
$$;


ALTER FUNCTION public."left"(p_strings text, p_position integer) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 50609)
-- Name: right(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "right"(p_strings text, p_position integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
/* ---------------------------------------------------------
プロシージャ名
    right
処理概要
    文字列 p_strings を右部分から p_position 文字分を抽出した文字列
[引数]
    p_strings                           : 抽出元文字列
    p_position                          : 右から何文字目かという位置
[戻り値]
    抽出した文字列
[実行例]
SELECT right('h001001002',2) AS answer;
SELECT right('h001001002',10) AS answer;
SELECT right('全角文字',0) AS answer;
SELECT right('全角文字',1) AS answer;
SELECT right('全角文字',2) AS answer;
--------------------------------------------------------- */
DECLARE
    rtnData                             text;
BEGIN
  rtnData := substring(p_strings from length(p_strings)-(p_position-1) for length(p_strings));
  RETURN rtnData;
END
$$;


ALTER FUNCTION public."right"(p_strings text, p_position integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 169 (class 1259 OID 50610)
-- Name: at010; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE at010 (
    cdbumon character(5) DEFAULT ''::bpchar NOT NULL,
    txbumon character(30) DEFAULT ''::bpchar NOT NULL,
    nrkanrisya character(5) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0,
    txtekiyo character varying(300) DEFAULT ''::character varying
);


ALTER TABLE public.at010 OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 50618)
-- Name: at011; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE at011 (
    cdbumon character(5) DEFAULT ''::bpchar NOT NULL,
    dthakkounengetsu character(6) DEFAULT ''::bpchar NOT NULL,
    cdjyouibumon character(5) DEFAULT ''::bpchar NOT NULL,
    dtsikkounengetsu character(6) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.at011 OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 50626)
-- Name: at020; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE at020 (
    nrjyugyoin character(5) DEFAULT ''::bpchar NOT NULL,
    txkana character(30) DEFAULT ''::bpchar NOT NULL,
    txkanji character(30) DEFAULT ''::bpchar NOT NULL,
    kbkoyou character(5) DEFAULT ''::bpchar NOT NULL,
    dtnyusya date NOT NULL,
    dttaisya date,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.at020 OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 50634)
-- Name: at021; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE at021 (
    nrjyugyoin character(5) DEFAULT ''::bpchar NOT NULL,
    dtsyozokunengetsu character(6) DEFAULT ''::bpchar NOT NULL,
    cdbumon character(5) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.at021 OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 50641)
-- Name: tbl仕訳明細; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl仕訳明細" (
    "仕訳no" character(7) NOT NULL,
    "行no" smallint NOT NULL,
    "貸借区分" character(4),
    "科目c" character(4),
    "仕訳額" numeric(7,0),
    "行摘要" character varying(50),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl仕訳明細" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 50645)
-- Name: tbl仕訳見出; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl仕訳見出" (
    "仕訳no" character(7) NOT NULL,
    "仕訳日" date NOT NULL,
    "部門c" character(4),
    "見出摘要" character varying(50),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl仕訳見出" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 50649)
-- Name: tbl会計部門; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl会計部門" (
    "部門c" character(4) NOT NULL,
    "部門名" character varying(20),
    "部門階層" character(1),
    "上位部門c" character(4),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl会計部門" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 50653)
-- Name: tbl制御情報; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl制御情報" (
    "制御キー" character varying(10) NOT NULL,
    "制御データ" character varying(6),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl制御情報" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 50657)
-- Name: tbl勘定科目; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl勘定科目" (
    "勘定科目c" character(4) NOT NULL,
    "勘定科目名" character varying(20),
    "科目階層" character(1),
    "上位科目c" character(4),
    "科目分類c" character(4),
    "使用" character varying(1),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl勘定科目" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 50661)
-- Name: tbl期首残高; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl期首残高" (
    "会計年月" character(6) NOT NULL,
    "科目c" character(4) NOT NULL,
    "前期繰越" numeric(11,0),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl期首残高" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 50665)
-- Name: tbl科目分類; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbl科目分類" (
    "科目分類c" character(4) NOT NULL,
    "科目分類名" character varying(20),
    "貸借区分" character(4),
    "bp区分" character varying(6),
    updcounter integer DEFAULT 0
);


ALTER TABLE public."tbl科目分類" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 50669)
-- Name: zt010; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt010 (
    idvariant character(20) DEFAULT ''::bpchar NOT NULL,
    txname character(10) DEFAULT ''::bpchar NOT NULL,
    txtype character(10) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0,
    txvalue character(100) DEFAULT ''::bpchar NOT NULL,
    txremarks character varying(500) DEFAULT ''::character varying
);


ALTER TABLE public.zt010 OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 50681)
-- Name: zt020; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt020 (
    iduser character(5) DEFAULT ''::bpchar NOT NULL,
    txmenus character(30) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0,
    dtvalid date NOT NULL,
    dtexpire date NOT NULL,
    txname character(30) DEFAULT ''::bpchar NOT NULL,
    nremployee character(5) DEFAULT ''::bpchar,
    txpassword character(32) DEFAULT ''::bpchar NOT NULL,
    txemail character(40) DEFAULT ''::bpchar
);


ALTER TABLE public.zt020 OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 50691)
-- Name: zt030; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt030 (
    idnumber character(20) DEFAULT ''::bpchar NOT NULL,
    txprefix character(4) DEFAULT ''::bpchar,
    nrcurrent integer DEFAULT 0 NOT NULL,
    fgwithcd character(1) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0,
    nrnumdigit numeric(2,0) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.zt030 OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 50700)
-- Name: zt040; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt040 (
    iduserkubun character(20) DEFAULT ''::bpchar NOT NULL,
    kbuserkubun character(5) DEFAULT ''::bpchar NOT NULL,
    txuserkubun character(20) DEFAULT ''::bpchar NOT NULL,
    sqlist character(2) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.zt040 OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 50708)
-- Name: zt050; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt050 (
    nrsession character(7) DEFAULT ''::bpchar NOT NULL,
    dtlogin timestamp without time zone NOT NULL,
    dtlogout timestamp without time zone,
    iduser character(5) DEFAULT ''::bpchar NOT NULL,
    kbsessionstatus character(3) DEFAULT ''::bpchar NOT NULL,
    updcounter integer DEFAULT 0,
    txipaddress character(70) DEFAULT ''::bpchar NOT NULL
);


ALTER TABLE public.zt050 OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 50716)
-- Name: zt051; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt051 (
    nrsession character(7) DEFAULT ''::bpchar NOT NULL,
    sqprogram smallint DEFAULT 0 NOT NULL,
    idmenu character(2) DEFAULT ''::bpchar NOT NULL,
    idprogram character(10) DEFAULT ''::bpchar NOT NULL,
    txprogram character(30) DEFAULT ''::bpchar NOT NULL,
    dtstart timestamp without time zone NOT NULL,
    dtend timestamp without time zone,
    kbprogramstatus character(2) DEFAULT ''::bpchar,
    txerrorlog text DEFAULT ''::text,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.zt051 OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 50730)
-- Name: zt060; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt060 (
    dtstart date NOT NULL,
    vltaxrate numeric(3,2) DEFAULT 0.0 NOT NULL,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.zt060 OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 50735)
-- Name: zt070; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt070 (
    dtoff date NOT NULL,
    txoff character(20) DEFAULT ''::bpchar,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.zt070 OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 50740)
-- Name: zt080; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt080 (
    kbcurrency character(5) DEFAULT ''::bpchar NOT NULL,
    dtnend smallint DEFAULT 0 NOT NULL,
    vlrateb numeric(10,3) DEFAULT 0.0 NOT NULL,
    vlratem numeric(10,3) DEFAULT 0.0 NOT NULL,
    vlrates numeric(10,3) DEFAULT 0.0 NOT NULL,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.zt080 OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 50749)
-- Name: zt081; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zt081 (
    kbcurrency character(5) DEFAULT ''::bpchar NOT NULL,
    dtnend smallint DEFAULT 0 NOT NULL,
    dtmseq smallint DEFAULT 0 NOT NULL,
    vlrateb numeric(10,3) DEFAULT 0.0 NOT NULL,
    vlratem numeric(10,3) DEFAULT 0.0 NOT NULL,
    vlrates numeric(10,3) DEFAULT 0.0 NOT NULL,
    updcounter integer DEFAULT 0
);


ALTER TABLE public.zt081 OWNER TO postgres;

--
-- TOC entry 2165 (class 0 OID 50610)
-- Dependencies: 169
-- Data for Name: at010; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO at010 VALUES ('00001', '部門１                           ', '11111', 0, '');
INSERT INTO at010 VALUES ('00002', '部門２                           ', '11111', 0, '');


--
-- TOC entry 2166 (class 0 OID 50618)
-- Dependencies: 170
-- Data for Name: at011; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO at011 VALUES ('00002', '201111', '00001', '999912', 0);


--
-- TOC entry 2167 (class 0 OID 50626)
-- Dependencies: 171
-- Data for Name: at020; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO at020 VALUES ('11111', 'ﾔﾏﾓﾄﾖｳｺ                       ', '山本陽子                          ', '01   ', '2009-04-01', NULL, 1);


--
-- TOC entry 2168 (class 0 OID 50634)
-- Dependencies: 172
-- Data for Name: at021; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2169 (class 0 OID 50641)
-- Dependencies: 173
-- Data for Name: tbl仕訳明細; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl仕訳明細" VALUES ('0000001', 1, '借方  ', '1110', 300000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000001', 2, '貸方  ', '7100', 300000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000002', 1, '借方  ', '1110', 50000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000002', 2, '貸方  ', '4130', 50000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000003', 1, '借方  ', '2160', 50000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000003', 2, '貸方  ', '1110', 50000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000004', 1, '借方  ', '2140', 150000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000004', 2, '貸方  ', '1110', 150000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000005', 1, '借方  ', '8480', 20800, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000005', 2, '貸方  ', '4120', 20800, '千葉商店', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000006', 1, '借方  ', '1110', 12600, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000006', 2, '貸方  ', '8100', 12600, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000007', 1, '借方  ', '8480', 5000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000007', 2, '貸方  ', '4120', 5000, '千葉商店', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000008', 1, '借方  ', '1140', 41000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000008', 2, '貸方  ', '8100', 41000, '東京ホテル', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000009', 1, '借方  ', '1110', 9800, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000009', 2, '貸方  ', '8100', 9800, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000010', 1, '借方  ', '8470', 4000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000010', 2, '貸方  ', '1110', 4000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000011', 1, '借方  ', '1140', 18200, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000011', 2, '貸方  ', '8100', 18200, '大阪屋', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000012', 1, '借方  ', '8470', 18000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000012', 2, '貸方  ', '1110', 18000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000013', 1, '借方  ', '1110', 11000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000013', 2, '貸方  ', '1140', 11000, '東京ホテル', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000014', 1, '借方  ', '1110', 24100, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000014', 2, '貸方  ', '8100', 24100, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000015', 1, '借方  ', '2150', 100000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000015', 2, '貸方  ', '1110', 100000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000016', 1, '借方  ', '4120', 10000, '千葉商店', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000016', 2, '貸方  ', '1110', 10000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000017', 1, '借方  ', '8800', 500, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000017', 2, '貸方  ', '4130', 500, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000018', 1, '借方  ', '1210', 1000000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000018', 2, '貸方  ', '1110', 1000000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000019', 1, '借方  ', '1210', 600000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000019', 2, '貸方  ', '4120', 600000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000020', 1, '借方  ', '1110', 1250000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000020', 2, '貸方  ', '1210', 1250000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000021', 1, '借方  ', '1140', 300000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000021', 2, '貸方  ', '1210', 300000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000022', 1, '借方  ', '1110', 450000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000022', 2, '貸方  ', '1140', 450000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000023', 1, '借方  ', '4120', 680000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000023', 2, '貸方  ', '1110', 680000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000024', 1, '借方  ', '8320', 51000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000024', 2, '貸方  ', '1110', 51000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000025', 1, '借方  ', '8430', 18000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000025', 2, '貸方  ', '1110', 18000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000026', 1, '借方  ', '8400', 10100, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000026', 2, '貸方  ', '1110', 10100, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000027', 1, '借方  ', '8440', 50000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000027', 2, '貸方  ', '1110', 50000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000028', 1, '借方  ', '8550', 9000, '３ヶ月分', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000028', 2, '貸方  ', '1110', 9000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000029', 1, '借方  ', '8670', 3500, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000029', 2, '貸方  ', '1110', 3500, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000030', 1, '借方  ', '8550', 60000, '２ヶ月分', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000030', 2, '貸方  ', '1110', 60000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000031', 1, '貸方  ', '8100', 1550000, '当月売上高', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000031', 2, '借方  ', '8210', 200000, '月初商品有高', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000031', 3, '借方  ', '8220', 1600000, '当月仕入高', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000031', 4, '貸方  ', '8250', 450000, '期末棚卸より', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000031', 5, '借方  ', '1210', 200000, '販売益（粗利）', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000032', 1, '借方  ', '1420', 36000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000032', 2, '貸方  ', '8550', 6000, '地代', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000032', 3, '貸方  ', '8550', 30000, '家賃', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000033', 1, '借方  ', '1210', 100000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000033', 2, '貸方  ', '4120', 100000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000034', 1, '借方  ', '1110', 20000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000034', 2, '貸方  ', '1210', 20000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000035', 1, '借方  ', '8480', 5000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000035', 2, '貸方  ', '1110', 5000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000036', 1, '借方  ', NULL, 0, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000036', 2, '貸方  ', NULL, 0, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000037', 1, '借方  ', '1110', 0, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000037', 2, '貸方  ', NULL, 0, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000038', 1, '貸方  ', '1110', 0, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000038', 2, '借方  ', NULL, 0, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000039', 1, '借方  ', '8400', 1000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000039', 2, '貸方  ', '1110', 1000, NULL, 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000040', 1, '借方  ', '1110', 12300, '現金回収', 18);
INSERT INTO "tbl仕訳明細" VALUES ('0000040', 2, '貸方  ', '8100', 12300, '手数料売上', 18);
INSERT INTO "tbl仕訳明細" VALUES ('0000040', 3, '借方  ', '1120', 1000, '入力ミス', 16);
INSERT INTO "tbl仕訳明細" VALUES ('0000040', 4, '貸方  ', '8100', 1000, '', 0);
INSERT INTO "tbl仕訳明細" VALUES ('0000072', 1, '貸方  ', '1110', 12300, '', 3);
INSERT INTO "tbl仕訳明細" VALUES ('0000072', 2, '借方  ', '1122', 12300, '', 3);
INSERT INTO "tbl仕訳明細" VALUES ('0000041', 1, '借方  ', '1110', 10000, '現金回収', 3);
INSERT INTO "tbl仕訳明細" VALUES ('0000041', 2, '貸方  ', '8100', 10000, '商品販売売上', 3);


--
-- TOC entry 2170 (class 0 OID 50645)
-- Dependencies: 174
-- Data for Name: tbl仕訳見出; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl仕訳見出" VALUES ('0000001', '2004-07-01', '1200', '資本金元入れ', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000002', '2004-07-02', '1300', '同業者より借入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000003', '2004-07-03', '1100', '椅子、机、ロッカ等備品購入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000004', '2004-07-04', '1100', '洗濯用機械購入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000005', '2004-07-06', NULL, '石鹸等消耗品を掛で購入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000006', '2004-07-10', '2100', '洗濯代金（現金）', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000007', '2004-07-25', NULL, '消耗品掛仕入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000008', '2004-07-18', NULL, '洗濯代金（売掛）', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000009', '2004-07-20', NULL, '洗濯代金（現金）', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000010', '2004-07-25', NULL, '水道料支払い', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000011', '2004-07-26', NULL, '洗濯代金（売掛）', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000012', '2004-07-27', NULL, 'ガス代支払い', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000013', '2004-07-27', NULL, '売掛金回収', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000014', '2004-07-29', NULL, '洗濯代金（現金）', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000015', '2004-07-30', NULL, '自動車現金購入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000016', '2004-07-30', NULL, '買掛金支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000017', '2004-07-31', NULL, '借入金借継ぎ', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000018', '2004-08-01', NULL, '商品現金仕入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000019', '2004-08-03', NULL, '商品掛け仕入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000020', '2004-08-06', NULL, '現金売上', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000021', '2004-08-10', NULL, '掛け売上', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000022', '2004-08-12', NULL, '売掛入金', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000023', '2004-08-16', NULL, '買掛支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000024', '2004-08-20', NULL, '給与支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000025', '2004-08-22', NULL, '販売費支払い', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000026', '2004-08-24', NULL, '通信費精算', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000027', '2004-08-25', NULL, '広告費支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000028', '2004-08-28', NULL, '地代支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000029', '2004-08-30', NULL, '営業雑費支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000030', '2004-08-30', NULL, '家賃支払', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000031', '2004-08-31', NULL, '損益勘定整理', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000032', '2004-08-31', NULL, '前払費用調整', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000033', '2004-09-01', NULL, '掛け仕入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000034', '2004-09-02', NULL, '現金売り', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000035', '2004-09-10', NULL, '備品購入', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000036', '2004-09-12', NULL, '振替伝票', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000037', '2004-09-12', NULL, '入金伝票', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000038', '2004-09-12', NULL, '出金伝票', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000039', '2004-04-14', '1000', '雑費', 0);
INSERT INTO "tbl仕訳見出" VALUES ('0000041', '2013-01-09', '3000', 'hahaha', 5);
INSERT INTO "tbl仕訳見出" VALUES ('0000040', '2013-01-01', '    ', 'ははは', 19);
INSERT INTO "tbl仕訳見出" VALUES ('0000072', '2013-01-11', '1100', '普通預金へ現金を預け入れ', 4);


--
-- TOC entry 2171 (class 0 OID 50649)
-- Dependencies: 175
-- Data for Name: tbl会計部門; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl会計部門" VALUES ('1000', '管理本部', '1', '0000', 0);
INSERT INTO "tbl会計部門" VALUES ('1100', '総務部', '2', '1000', 0);
INSERT INTO "tbl会計部門" VALUES ('1200', '経理部', '2', '1000', 0);
INSERT INTO "tbl会計部門" VALUES ('1300', '財務部', '2', '1000', 0);
INSERT INTO "tbl会計部門" VALUES ('1400', '経営企画室', '2', '1000', 0);
INSERT INTO "tbl会計部門" VALUES ('1500', '情報システム部', '2', '1000', 0);
INSERT INTO "tbl会計部門" VALUES ('2000', '営業本部', '1', '0000', 0);
INSERT INTO "tbl会計部門" VALUES ('2100', '第１営業部', '2', '2000', 0);
INSERT INTO "tbl会計部門" VALUES ('2200', '第２営業部', '2', '2000', 0);
INSERT INTO "tbl会計部門" VALUES ('2300', '開発営業部', '2', '2000', 0);
INSERT INTO "tbl会計部門" VALUES ('2400', '物流資材部', '2', '2000', 0);
INSERT INTO "tbl会計部門" VALUES ('2500', '大阪支社', '2', '2000', 0);
INSERT INTO "tbl会計部門" VALUES ('2600', '北九州支社', '2', '2000', 0);
INSERT INTO "tbl会計部門" VALUES ('3000', '生産本部', '1', '0000', 0);
INSERT INTO "tbl会計部門" VALUES ('3100', '相模原工場', '2', '3000', 0);
INSERT INTO "tbl会計部門" VALUES ('3200', '寝屋川工場', '2', '3000', 0);
INSERT INTO "tbl会計部門" VALUES ('3300', '都城工場', '2', '3000', 0);
INSERT INTO "tbl会計部門" VALUES ('3400', '筑波工場', '2', '3000', 0);
INSERT INTO "tbl会計部門" VALUES ('4000', '企画開発本部', '1', '0000', 0);


--
-- TOC entry 2172 (class 0 OID 50653)
-- Dependencies: 176
-- Data for Name: tbl制御情報; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl制御情報" VALUES ('前月', '200407', 0);
INSERT INTO "tbl制御情報" VALUES ('当月', '200408', 0);
INSERT INTO "tbl制御情報" VALUES ('翌月', '200409', 0);


--
-- TOC entry 2173 (class 0 OID 50657)
-- Dependencies: 177
-- Data for Name: tbl勘定科目; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl勘定科目" VALUES ('1000', '流動資産', '1', NULL, '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1100', '当座資産', '2', '1000', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1110', '現金', '3', '1100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1120', '預金', '3', '1100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1121', '当座預金', '4', '1120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1122', '普通預金', '4', '1120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1123', '通知預金', '4', '1120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1124', '別段預金', '4', '1120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1125', '定期預金', '4', '1120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1126', '定期積立', '4', '1120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1130', '受取手形', '3', '1100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1131', '受取手形', '4', '1130', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1138', '関係会社受取手形', '4', '1130', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1139', '貸倒引当金', '4', '1130', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1140', '売掛金', '3', '1100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1141', '売掛金', '4', '1140', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1148', '関係会社売掛金', '4', '1140', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1149', '貸倒引当金', '4', '1140', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1150', '有価証券', '3', '1100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1160', '自己株式', '3', '1100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1200', '棚卸資産', '2', '1000', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1210', '商品', '3', '1200', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1220', '製品', '3', '1200', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1230', '副産物及び作業くず', '3', '1200', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1240', '半製品', '3', '1200', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1250', '原材料', '3', '1200', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1260', '仕掛品', '3', '1200', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1270', '貯蔵品', '3', '1200', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1400', 'その他の流動資産', '2', '1000', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1410', '前渡金', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1420', '前払費用', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1421', '前払費用', '4', '1420', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1428', '関係会社前払費用', '4', '1420', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1430', '未収収益', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1431', '未収収益', '4', '1430', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1438', '関係会社未収収益', '4', '1430', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1440', '短期貸付金', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1441', '短期貸付金', '4', '1440', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1447', '従業員短期貸付金', '4', '1440', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1448', '関係会社短期貸付金', '4', '1440', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('1450', '未収入金', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1460', '預け金', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1470', '仮払消費税等', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1480', '未収消費税等', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('1490', '貸倒引当金', '3', '1400', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2000', '固定資産', '1', NULL, '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2100', '有形固定資産', '2', '2000', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2110', '建物', '3', '2100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2111', '建物', '4', '2110', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2119', '建物減価償却引当金', '4', '2110', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2120', '建物附属設備', '3', '2100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2121', '建物附属設備', '4', '2120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2129', '建物附属設備減価償却引当金', '4', '2120', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2130', '構築物', '3', '2100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2131', '構築物', '4', '2130', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2139', '構築物減価償却引当金', '4', '2130', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2140', '機械及び装置', '3', '2100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2141', '機械及び装置', '4', '2140', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2149', '機械及び装置減価償却引当金', '4', '2140', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2150', '車両運搬具', '3', '2100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2151', '車両運搬具', '4', '2150', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2159', '車両運搬具減価償却引当金', '4', '2150', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2160', '工具器具備品', '3', '2100', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2210', '土地', '3', '2100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2270', '建設仮勘定', '3', '2100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2300', '無形固定資産', '2', '2000', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2310', '営業権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2320', '特許権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2330', '借地権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2340', '地上権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2350', '商標権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2360', '実用新案権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2370', '意匠権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2380', '鉱業権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2390', '漁業権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2410', '水利権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2420', '電話加入権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2430', '施設利用権', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2440', 'ソフトウェア', '3', '2300', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2600', '投資等', '2', '2000', '1000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('2610', '投資有価証券', '3', '2600', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2611', '投資有価証券', '4', '2610', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2617', '関係会社株式', '4', '2610', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2618', '関係会社社債', '4', '2610', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2620', '出資金', '3', '2600', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2621', '出資金', '4', '2620', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2628', '関係会社出資金', '4', '2620', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2630', '長期貸付金', '3', '2600', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2631', '長期貸付金', '4', '2630', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2637', '従業員長期貸付金', '4', '2630', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2638', '関係会社長期貸付金', '4', '2630', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2639', '貸倒引当金', '4', '2630', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2710', '投資固定資産', '3', '2600', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2711', '投資固定資産', '4', '2710', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2718', '関係会社投資固定資産', '4', '2710', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2719', '減価償却引当金', '4', '2710', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('2810', '長期前払費用', '3', '2600', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3100', '繰延資産', '2', '2000', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3110', '創立費', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3120', '開業費', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3130', '新株発行費', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3140', '社債発行費', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3150', '社債発行差金', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3160', '開発費', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3170', '試験研究費', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('3180', '建設利息', '3', '3100', '1000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4000', '流動負債', '1', NULL, '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4100', '短期債務', '2', '4000', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4110', '支払手形', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4111', '支払手形', '4', '4110', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4118', '関係会社支払手形', '4', '4110', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4120', '買掛金', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4130', '短期借入金', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4140', '未払金', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4150', '未払費用', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4160', '前受金', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4170', '預り金', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4210', '前受収益', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4260', '仮受消費税等', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4270', '未払消費税等', '3', '4100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4300', '短期負債性引当金', '2', '4000', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('4310', '製品保証等引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4320', '売上割戻引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4330', '景品費引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4340', '返品調整引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4350', '賞与引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4360', '納税引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4370', '修繕引当金', '3', '4300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4500', 'その他流動負債', '2', '4000', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('4510', '割賦販売繰延利益', '3', '4500', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('5000', '固定負債', '1', NULL, '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('5100', '長期債務', '2', '5000', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('5110', '社債', '3', '5100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('5120', '転換社債', '3', '5100', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('5130', '長期借入金', '3', '5100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('5131', '長期借入金', '4', '5130', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('5138', '関連会社長期借入金', '4', '5130', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('5140', '長期未払金', '3', '5100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('5150', '長期預り金', '3', '5100', '2000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('5300', '長期負債性引当金', '2', '5000', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('5310', '退職給与引当金', '3', '5300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('5320', '特別修繕引当金', '3', '5300', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('6000', '特定引当金', '1', NULL, '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('6100', '特定引当金', '2', '6000', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('6110', '価格変動準備金', '3', '6100', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('6120', '特別償却準備金', '3', '6100', '2000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('6730', '受取手数料', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7000', '資本', '1', NULL, '3000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('7100', '資本金', '2', '7000', '3000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('7110', '資本金', '3', '7100', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7120', '新株式申込証拠金', '3', '7100', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7130', '新株式払込金', '3', '7100', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7200', '法定準備金', '2', '7000', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7210', '資本準備金', '3', '7200', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7220', '利益準備金', '3', '7200', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7300', 'その他の剰余金', '2', '7000', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7310', 'その他の資本剰余金', '3', '7300', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7320', '任意積立金', '3', '7300', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7321', '減債積立金', '4', '7320', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7322', '中間配当積立金', '4', '7320', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7323', '配当平均積立金', '4', '7320', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7324', '別途積立金', '4', '7320', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('7330', '当期未処分利益', '3', '7300', '3000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8000', '経常損益', '1', NULL, NULL, 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8100', '売上高', '2', '8000', '4000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8110', '売上高', '3', '8100', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8111', '売上高', '4', '8110', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8119', '売上控除高', '4', '8110', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8120', '役務収益', '3', '8100', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8200', '売上原価', '2', '8000', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8210', '期首商品・製品棚卸高', '3', '8200', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8211', '期首商品棚卸高', '4', '8210', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8212', '期首製品棚卸高', '4', '8210', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8220', '当期商品仕入高', '3', '8200', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8221', '当期商品仕入高', '4', '8220', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8229', '当期商品仕入控除高', '4', '8220', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8230', '当期製品製造原価', '3', '8200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8240', '他勘定振替高', '3', '8200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8241', '商品他勘定振替高', '4', '8240', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8242', '製品他勘定振替高', '4', '8240', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8250', '期末商品・製品棚卸高', '3', '8200', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8251', '期末商品棚卸高', '4', '8250', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8252', '期末製品棚卸高', '4', '8250', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8300', '販売費・一般管理費', '2', '8000', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8310', '役員報酬', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8320', '給与手当', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8330', '賞与', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8340', '雑給', '3', '8300', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8350', '賞与引当金繰入額', '3', '8300', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8360', '退職給付費用', '3', '8300', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8370', '法定福利費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8380', '福利厚生費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8390', '旅費交通費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8400', '通信費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8410', '販売手数料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8420', '車両費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8430', '荷造運賃', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8440', '広告宣伝費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8450', '交際費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8460', '会議費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8470', '水道光熱費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8480', '消耗品費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8490', '租税公課', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8500', '図書費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8510', '支払手数料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8520', '諸会費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8530', 'リース料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8540', '支払報酬', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8550', '支払地代家賃', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8560', '業務委託料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8570', '賃借料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8580', '支払保険料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8590', '修繕費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8600', '事務用品費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8610', '販売促進費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8620', '保管料', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8630', '減価償却費（販管）', '3', '8300', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8640', '貸倒引当金繰入額', '3', '8300', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8650', '特許権使用料', '3', '8300', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8660', '教育研修費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8670', '雑費', '3', '8300', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8700', '営業外収益', '2', '8000', '4000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8710', '受取利息及び割引料', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8720', '受取配当金', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8740', '仕入割引', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8750', '投資不動産賃貸料', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8760', '有価証券売却益', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8770', '為替差益', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8790', '雑収入', '3', '8700', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8800', '営業外費用', '2', '8000', '5000', 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('8810', '支払利息及び割引料', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8820', '社債利息', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8830', '創立費償却', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8840', '開業費償却', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8850', '新株発行費償却', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8860', '社債発行費償却', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8870', '社債発行差金償却', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8880', '有価証券評価損', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8890', '有価証券売却損', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8910', '売上割引', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8920', '為替差損', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('8990', '雑損失', '3', '8800', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9000', '特別損益及び未処分利益', '1', NULL, NULL, 'Y', 0);
INSERT INTO "tbl勘定科目" VALUES ('9100', '特別利益', '2', '9000', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9110', '固定資産売却益', '3', '9100', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9120', '投資有価証券売却益', '3', '9100', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9130', '前期損益修正益', '3', '9100', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9190', 'その他特別利益', '3', '9100', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9200', '特別損失', '2', '9000', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9210', '固定資産売却・除却損', '3', '9200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9220', '投資有価証券売却損', '3', '9200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9230', '前期損益修正損', '3', '9200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9240', '災害損失', '3', '9200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9290', 'その他特別損失', '3', '9200', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9300', '特定利益', '2', '9000', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9310', '価格変動準備金戻入', '3', '9300', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9320', '特別償却準備金戻入', '3', '9300', '4000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9500', '特定損失', '2', '9000', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9510', '価格変動準備金繰入', '3', '9500', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9520', '特別償却準備金繰入', '3', '9500', '5000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9800', '法人税及び住民税', '2', '9000', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9810', '法人税', '3', '9800', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9820', '法人税追徴金', '3', '9800', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9830', '住民税', '3', '9800', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9840', '住民税追徴金', '3', '9800', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9900', '当期未処分損益', '2', '9000', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9910', '前期繰越利益', '3', '9900', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9920', '中間配当積立金取崩額', '3', '9900', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9970', '中間配当金', '3', '9900', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9980', '中間配当利益準備金', '3', '9900', '7000', 'N', 0);
INSERT INTO "tbl勘定科目" VALUES ('9990', '当期未処分利益金', '3', '9900', '7000', 'N', 0);


--
-- TOC entry 2174 (class 0 OID 50661)
-- Dependencies: 178
-- Data for Name: tbl期首残高; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl期首残高" VALUES ('200406', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200406', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200407', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '1110', 1200000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '1140', 350000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '1150', 250000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '1210', 200000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '2110', 400000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '2160', 150000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '4120', 300000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '7100', 2250000, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200408', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200409', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200410', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200411', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200412', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200501', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200502', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200503', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200504', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200505', '9000', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '1490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2300', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '2600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4120', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4160', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4170', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4260', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '4270', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '5110', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '5130', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '5140', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '5150', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '7100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8100', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8210', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8220', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8250', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8310', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8320', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8330', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8370', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8380', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8390', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8400', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8410', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8420', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8430', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8440', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8450', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8460', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8470', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8480', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8490', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8500', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8510', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8520', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8530', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8540', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8550', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8560', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8570', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8580', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8590', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8600', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8610', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8620', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8660', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8670', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8700', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '8800', 0, 0);
INSERT INTO "tbl期首残高" VALUES ('200506', '9000', 0, 0);


--
-- TOC entry 2175 (class 0 OID 50665)
-- Dependencies: 179
-- Data for Name: tbl科目分類; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tbl科目分類" VALUES ('1000', '資産', '借方  ', 'Ｂ／Ｓ', 0);
INSERT INTO "tbl科目分類" VALUES ('2000', '負債', '貸方  ', 'Ｂ／Ｓ', 0);
INSERT INTO "tbl科目分類" VALUES ('3000', '資本', '貸方  ', 'Ｂ／Ｓ', 0);
INSERT INTO "tbl科目分類" VALUES ('4000', '収益', '貸方  ', 'Ｐ／Ｌ', 0);
INSERT INTO "tbl科目分類" VALUES ('5000', '費用', '借方  ', 'Ｐ／Ｌ', 0);
INSERT INTO "tbl科目分類" VALUES ('9000', '諸口', '－   ', '－', 0);


--
-- TOC entry 2176 (class 0 OID 50669)
-- Dependencies: 180
-- Data for Name: zt010; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt010 VALUES ('FIRST_MONTH         ', '年度第１月     ', 'NUMBER    ', 0, '4                                                                                                   ', '');
INSERT INTO zt010 VALUES ('LAST_DAY            ', '締め日       ', 'NUMBER    ', 0, '25                                                                                                  ', '');
INSERT INTO zt010 VALUES ('LOGIN_PERMITTED     ', 'ログイン認可フラグ ', 'STRING    ', 1, 'T                                                                                                   ', '');
INSERT INTO zt010 VALUES ('COMP_NAME           ', '会社名       ', 'STRING    ', 3, 'ＸＸＸＸＸＸ社                                                                                             ', '');
INSERT INTO zt010 VALUES ('COMP_LOGO           ', '会社ロゴ      ', 'STRING    ', 0, '<CURRENT>\db\image\Logo.PNG                                                                         ', '');


--
-- TOC entry 2177 (class 0 OID 50681)
-- Dependencies: 181
-- Data for Name: zt020; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt020 VALUES ('11111', '20                            ', 1, '2011-04-01', '9999-12-31', '山本洋子                          ', '11111', 'f1b708bba17f1ce948dc979f4d7092bc', '                                        ');
INSERT INTO zt020 VALUES ('00000', 'ALL                           ', 3, '2000-01-01', '9999-12-31', 'システム管理者                       ', '     ', 'f1b708bba17f1ce948dc979f4d7092bc', '                                        ');


--
-- TOC entry 2178 (class 0 OID 50691)
-- Dependencies: 182
-- Data for Name: zt030; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt030 VALUES ('NRSIWAKE            ', '    ', 76, 'F', 1, 7);
INSERT INTO zt030 VALUES ('NRSESSION           ', '    ', 2, 'F', 2, 7);


--
-- TOC entry 2179 (class 0 OID 50700)
-- Dependencies: 183
-- Data for Name: zt040; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt040 VALUES ('KBFLAG1             ', 'F    ', '対象外                 ', '02', 0);
INSERT INTO zt040 VALUES ('KBFLAG1             ', 'T    ', '対象                  ', '01', 0);
INSERT INTO zt040 VALUES ('KBKOYOU             ', '01   ', '正社員                 ', '01', 0);
INSERT INTO zt040 VALUES ('KBKOYOU             ', '02   ', 'パート                 ', '02', 0);
INSERT INTO zt040 VALUES ('KBCURRENCY          ', 'USD  ', 'USD                 ', '02', 1);
INSERT INTO zt040 VALUES ('KBCURRENCY          ', 'EUR  ', 'EUR                 ', '01', 1);
INSERT INTO zt040 VALUES ('KBSIWAKE            ', '借方   ', '借方                  ', '01', 0);
INSERT INTO zt040 VALUES ('KBSIWAKE            ', '貸方   ', '貸方                  ', '02', 0);


--
-- TOC entry 2180 (class 0 OID 50708)
-- Dependencies: 184
-- Data for Name: zt050; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt050 VALUES ('0000001', '2013-01-16 11:00:03.437', '2013-01-16 11:00:23.812', '00000', 'END', 0, '192.168.1.12                                                          ');


--
-- TOC entry 2181 (class 0 OID 50716)
-- Dependencies: 185
-- Data for Name: zt051; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt051 VALUES ('0000001', 2, '90', 'ZF051     ', 'セッションと関連情報の確認                 ', '2013-01-16 11:00:17.14', '2013-01-16 11:00:19.875', '00', '> select NRSESSION,DTLOGIN,DTLOGOUT,IDUSER,KBSESSIONSTATUS,TXIPADDRESS from ZT050 where NRSESSION="0000001"  (11:00:17.171)
> select TXNAME from ZT020 where IDUSER="00000"  (11:00:17.171)
> select NRSESSION,SQPROGRAM,DTSTART,IDMENU,IDPROGRAM,TXPROGRAM,KBPROGRAMSTATUS,NRSESSION,SQPROGRAM from ZT051 where NRSESSION="0000001" order by NRSESSION,SQPROGRAM  (11:00:17.187)
> Local-commit succeeded.  (11:00:19.875)
', 0);
INSERT INTO zt051 VALUES ('0000001', 1, '90', 'ZF050     ', 'セッション状況の一覧                    ', '2013-01-16 11:00:14.734', '2013-01-16 11:00:20.562', '00', '> select NRSESSION,DTLOGIN,DTLOGOUT,IDUSER,TXIPADDRESS,KBSESSIONSTATUS from ZT050 order by NRSESSION DESC   (11:00:15.609)
> select TXNAME from ZT020 where IDUSER="00000"  (11:00:15.609)
> Local-commit succeeded.  (11:00:20.562)
', 0);


--
-- TOC entry 2182 (class 0 OID 50730)
-- Dependencies: 186
-- Data for Name: zt060; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt060 VALUES ('1997-04-01', 0.05, 0);
INSERT INTO zt060 VALUES ('1988-04-01', 0.03, 0);


--
-- TOC entry 2183 (class 0 OID 50735)
-- Dependencies: 187
-- Data for Name: zt070; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2184 (class 0 OID 50740)
-- Dependencies: 188
-- Data for Name: zt080; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zt080 VALUES ('EUR  ', 2010, 110.000, 110.000, 110.000, 0);
INSERT INTO zt080 VALUES ('EUR  ', 2011, 110.000, 110.000, 110.000, 0);
INSERT INTO zt080 VALUES ('USD  ', 2010, 85.000, 85.000, 85.000, 0);
INSERT INTO zt080 VALUES ('USD  ', 2011, 80.000, 80.000, 80.000, 0);


--
-- TOC entry 2185 (class 0 OID 50749)
-- Dependencies: 189
-- Data for Name: zt081; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2124 (class 2606 OID 50760)
-- Name: at010_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY at010
    ADD CONSTRAINT at010_pk PRIMARY KEY (cdbumon);


--
-- TOC entry 2126 (class 2606 OID 50762)
-- Name: at011_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY at011
    ADD CONSTRAINT at011_pk PRIMARY KEY (cdbumon, dthakkounengetsu);


--
-- TOC entry 2128 (class 2606 OID 50764)
-- Name: at020_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY at020
    ADD CONSTRAINT at020_pk PRIMARY KEY (nrjyugyoin);


--
-- TOC entry 2130 (class 2606 OID 50766)
-- Name: at021_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY at021
    ADD CONSTRAINT at021_pk PRIMARY KEY (nrjyugyoin, dtsyozokunengetsu);


--
-- TOC entry 2132 (class 2606 OID 50768)
-- Name: tbl仕訳明細_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl仕訳明細"
    ADD CONSTRAINT "tbl仕訳明細_pk" PRIMARY KEY ("仕訳no", "行no");


--
-- TOC entry 2134 (class 2606 OID 50770)
-- Name: tbl仕訳見出_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl仕訳見出"
    ADD CONSTRAINT "tbl仕訳見出_pk" PRIMARY KEY ("仕訳no");


--
-- TOC entry 2136 (class 2606 OID 50772)
-- Name: tbl会計部門_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl会計部門"
    ADD CONSTRAINT "tbl会計部門_pk" PRIMARY KEY ("部門c");


--
-- TOC entry 2138 (class 2606 OID 50774)
-- Name: tbl制御情報_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl制御情報"
    ADD CONSTRAINT "tbl制御情報_pk" PRIMARY KEY ("制御キー");


--
-- TOC entry 2140 (class 2606 OID 50776)
-- Name: tbl勘定科目_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl勘定科目"
    ADD CONSTRAINT "tbl勘定科目_pk" PRIMARY KEY ("勘定科目c");


--
-- TOC entry 2142 (class 2606 OID 50778)
-- Name: tbl期首残高_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl期首残高"
    ADD CONSTRAINT "tbl期首残高_pk" PRIMARY KEY ("科目c", "会計年月");


--
-- TOC entry 2144 (class 2606 OID 50780)
-- Name: tbl科目分類_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbl科目分類"
    ADD CONSTRAINT "tbl科目分類_pk" PRIMARY KEY ("科目分類c");


--
-- TOC entry 2146 (class 2606 OID 50782)
-- Name: zt010_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt010
    ADD CONSTRAINT zt010_pk PRIMARY KEY (idvariant);


--
-- TOC entry 2148 (class 2606 OID 50784)
-- Name: zt020_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt020
    ADD CONSTRAINT zt020_pk PRIMARY KEY (iduser);


--
-- TOC entry 2150 (class 2606 OID 50786)
-- Name: zt030_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt030
    ADD CONSTRAINT zt030_pk PRIMARY KEY (idnumber);


--
-- TOC entry 2152 (class 2606 OID 50788)
-- Name: zt040_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt040
    ADD CONSTRAINT zt040_pk PRIMARY KEY (iduserkubun, kbuserkubun);


--
-- TOC entry 2154 (class 2606 OID 50790)
-- Name: zt050_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt050
    ADD CONSTRAINT zt050_pk PRIMARY KEY (nrsession);


--
-- TOC entry 2156 (class 2606 OID 50792)
-- Name: zt051_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt051
    ADD CONSTRAINT zt051_pk PRIMARY KEY (nrsession, sqprogram);


--
-- TOC entry 2158 (class 2606 OID 50794)
-- Name: zt060_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt060
    ADD CONSTRAINT zt060_pk PRIMARY KEY (dtstart);


--
-- TOC entry 2160 (class 2606 OID 50796)
-- Name: zt070_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt070
    ADD CONSTRAINT zt070_pk PRIMARY KEY (dtoff);


--
-- TOC entry 2162 (class 2606 OID 50798)
-- Name: zt080_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt080
    ADD CONSTRAINT zt080_pk PRIMARY KEY (kbcurrency, dtnend);


--
-- TOC entry 2164 (class 2606 OID 50800)
-- Name: zt081_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zt081
    ADD CONSTRAINT zt081_pk PRIMARY KEY (kbcurrency, dtnend, dtmseq);


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-01-16 11:08:16

--
-- PostgreSQL database dump complete
--

