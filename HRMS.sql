------------------------------------------
-- Export file for user ROOT            --
-- Created by sun on 2014/4/1, 15:26:45 --
------------------------------------------

spool HRMS.log

prompt
prompt Creating table HR_CH_DAILY
prompt ==========================
prompt
create table HR_CH_DAILY
(
  dayid      NUMBER(10) not null,
  monthid    NUMBER(10),
  chday      VARCHAR2(255 CHAR),
  empid      NUMBER(10),
  count      NUMBER(10),
  chindex    NUMBER(10),
  detailinfo VARCHAR2(255 CHAR)
)
;
alter table HR_CH_DAILY
  add primary key (DAYID);

prompt
prompt Creating table HR_CH_DIC
prompt ========================
prompt
create table HR_CH_DIC
(
  itemkey   NUMBER not null,
  itemvalue VARCHAR2(20) not null,
  itemnote  VARCHAR2(20) not null,
  itemflag  VARCHAR2(1) not null
)
;

prompt
prompt Creating table HR_ORGINFO
prompt =========================
prompt
create table HR_ORGINFO
(
  orgid    NUMBER(10) not null,
  orgtype  VARCHAR2(255 CHAR) not null,
  orgname  VARCHAR2(255 CHAR) not null,
  remark   VARCHAR2(255 CHAR),
  valid    NUMBER(1) not null,
  parentid NUMBER(10)
)
;
alter table HR_ORGINFO
  add primary key (ORGID);
alter table HR_ORGINFO
  add constraint FKA227933D8A1FDBA7 foreign key (PARENTID)
  references HR_ORGINFO (ORGID);

prompt
prompt Creating table HR_POSITION
prompt ==========================
prompt
create table HR_POSITION
(
  postid    NUMBER(10) not null,
  postname  VARCHAR2(255 CHAR),
  postintro VARCHAR2(255 CHAR),
  remark    VARCHAR2(255 CHAR),
  valid     NUMBER(1)
)
;
alter table HR_POSITION
  add primary key (POSTID);
alter table HR_POSITION
  add unique (POSTNAME);

prompt
prompt Creating table HR_USER
prompt ======================
prompt
create table HR_USER
(
  empid       NUMBER(10) not null,
  empname     VARCHAR2(255 CHAR),
  emppassword VARCHAR2(255 CHAR),
  postid      NUMBER(10),
  orgid       NUMBER(10),
  valid       NUMBER(1)
)
;
alter table HR_USER
  add primary key (EMPID);
alter table HR_USER
  add constraint FK7210A9E05438079F foreign key (POSTID)
  references HR_POSITION (POSTID);
alter table HR_USER
  add constraint FK7210A9E0DFBB044C foreign key (ORGID)
  references HR_ORGINFO (ORGID);

prompt
prompt Creating table HR_CH_MONTH
prompt ==========================
prompt
create table HR_CH_MONTH
(
  monthid    NUMBER(10) not null,
  empid      NUMBER(10),
  chmonth    VARCHAR2(255 CHAR),
  late       NUMBER(10) default 0,
  early      NUMBER(10) default 0,
  skip       NUMBER(10) default 0,
  excused    NUMBER(10) default 0,
  sick       NUMBER(10) default 0,
  marriage   NUMBER(10) default 0,
  annual     NUMBER(10) default 0,
  funeral    NUMBER(10) default 0,
  maternity  NUMBER(10) default 0,
  workinjury NUMBER(10) default 0,
  business   NUMBER(10) default 0,
  publichol  NUMBER(10) default 0,
  normal     NUMBER(10) default 0,
  holiday    NUMBER(10) default 0,
  col1       NUMBER(10) default 0,
  col2       NUMBER(10) default 0,
  col3       NUMBER(10) default 0,
  col4       NUMBER(10) default 0
)
;
alter table HR_CH_MONTH
  add primary key (MONTHID);
alter table HR_CH_MONTH
  add constraint FKDC6BA99B846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_FUNCTION
prompt ==========================
prompt
create table HR_FUNCTION
(
  funcid      NUMBER(10) not null,
  funcname    VARCHAR2(255 CHAR),
  funcurl     VARCHAR2(255 CHAR),
  param_key   VARCHAR2(255 CHAR),
  param_value VARCHAR2(255 CHAR),
  orgrelied   NUMBER(1),
  scopelevel  NUMBER(10)
)
;
alter table HR_FUNCTION
  add primary key (FUNCID);

prompt
prompt Creating table HR_LEAVEAPPLY
prompt ============================
prompt
create table HR_LEAVEAPPLY
(
  applyid     NUMBER(10) not null,
  empid       NUMBER(10),
  startdate   VARCHAR2(255 CHAR),
  enddate     VARCHAR2(255 CHAR),
  leaveindex  NUMBER(10),
  leavereason VARCHAR2(255 CHAR),
  agreed      NUMBER(10),
  advice      VARCHAR2(255 CHAR),
  approtime   VARCHAR2(255 CHAR)
)
;
alter table HR_LEAVEAPPLY
  add primary key (APPLYID);
alter table HR_LEAVEAPPLY
  add constraint FKE7DADD6C846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_POSITION_SALARY
prompt =================================
prompt
create table HR_POSITION_SALARY
(
  id       NUMBER(10) not null,
  postwage FLOAT default 0,
  glgz     FLOAT default 0,
  txf      FLOAT default 0,
  gwf      FLOAT default 0,
  nzj      FLOAT default 0,
  qtjl     FLOAT default 0,
  zcjt     FLOAT default 0,
  bsj      FLOAT default 0,
  sybx     FLOAT default 0,
  ylbx     FLOAT default 0,
  yb       FLOAT default 0,
  gjj      FLOAT default 0,
  zjbx     FLOAT default 0,
  yljj     FLOAT default 0,
  ccf      FLOAT default 0,
  pujb     FLOAT default 0,
  jqjb     FLOAT default 0,
  cd       FLOAT default 0,
  zt       FLOAT default 0,
  kg       FLOAT default 0,
  sj       FLOAT default 0,
  yl1      FLOAT default 0,
  yl2      FLOAT default 0,
  yl3      FLOAT default 0,
  yl4      FLOAT default 0,
  postid   NUMBER(10) not null
)
;
alter table HR_POSITION_SALARY
  add primary key (ID);
alter table HR_POSITION_SALARY
  add unique (POSTID);
alter table HR_POSITION_SALARY
  add constraint FKEFCFEC6B5438079F foreign key (POSTID)
  references HR_POSITION (POSTID);

prompt
prompt Creating table HR_ROLE
prompt ======================
prompt
create table HR_ROLE
(
  roleid   NUMBER(10) not null,
  rolename VARCHAR2(255 CHAR),
  roleinfo VARCHAR2(255 CHAR)
)
;
alter table HR_ROLE
  add primary key (ROLEID);

prompt
prompt Creating table HR_ROLE_FUNCTION
prompt ===============================
prompt
create table HR_ROLE_FUNCTION
(
  roleid NUMBER(10) not null,
  funcid NUMBER(10) not null
)
;
alter table HR_ROLE_FUNCTION
  add primary key (ROLEID, FUNCID);
alter table HR_ROLE_FUNCTION
  add constraint FK6271830C6426688F foreign key (FUNCID)
  references HR_FUNCTION (FUNCID);
alter table HR_ROLE_FUNCTION
  add constraint FK6271830CAB3DDA5F foreign key (ROLEID)
  references HR_ROLE (ROLEID);

prompt
prompt Creating table HR_SALARY_HISTORY
prompt ================================
prompt
create table HR_SALARY_HISTORY
(
  id       NUMBER(10) not null,
  empid    NUMBER(10) not null,
  sayear   VARCHAR2(255 CHAR),
  samonth  VARCHAR2(255 CHAR),
  postwage FLOAT,
  glgzwage FLOAT,
  txfwage  FLOAT,
  gwfwage  FLOAT,
  nzjwage  FLOAT,
  qtjlwage FLOAT,
  zcjtwage FLOAT,
  bsjwage  FLOAT,
  sybxwage FLOAT,
  ylwage   FLOAT,
  ylbxwage FLOAT,
  gjjwage  FLOAT,
  zjbxwage FLOAT,
  yljjwage FLOAT,
  ccfwage  FLOAT,
  pujbwage FLOAT,
  jqjbwage FLOAT,
  cdwage   FLOAT,
  ztwage   FLOAT,
  kgwage   FLOAT,
  sjwage   FLOAT,
  taxwage  FLOAT,
  ylwage1  FLOAT,
  ylwage2  FLOAT,
  ylwage3  FLOAT,
  ylwage4  FLOAT,
  sjkewage FLOAT,
  status   NUMBER(1)
)
;
alter table HR_SALARY_HISTORY
  add primary key (ID);
alter table HR_SALARY_HISTORY
  add constraint FKE3D35AD4846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_TAX
prompt =====================
prompt
create table HR_TAX
(
  id         NUMBER(10) not null,
  low_limit  NUMBER(10),
  high_limit NUMBER(10),
  tax_rate   FLOAT,
  cal_number FLOAT
)
;
alter table HR_TAX
  add primary key (ID);

prompt
prompt Creating table HR_TRANSFER
prompt ==========================
prompt
create table HR_TRANSFER
(
  id      NUMBER(10) not null,
  empid   NUMBER(10),
  dldept  VARCHAR2(255 CHAR),
  dlpost  VARCHAR2(255 CHAR),
  drdept  VARCHAR2(255 CHAR),
  drpost  VARCHAR2(255 CHAR),
  oprtime VARCHAR2(255 CHAR),
  reason  VARCHAR2(255 CHAR)
)
;
alter table HR_TRANSFER
  add primary key (ID);
alter table HR_TRANSFER
  add constraint FKA03C5B80846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_USERDETAIL
prompt ============================
prompt
create table HR_USERDETAIL
(
  empid          NUMBER(10) not null,
  empsex         VARCHAR2(255 CHAR),
  birthday       VARCHAR2(255 CHAR),
  createtime     VARCHAR2(255 CHAR),
  height         NUMBER(10),
  weight         NUMBER(10),
  maritalstatus  VARCHAR2(255 CHAR),
  nativeplace    VARCHAR2(255 CHAR),
  householdplace VARCHAR2(255 CHAR),
  mobilphone     VARCHAR2(255 CHAR),
  homephone      VARCHAR2(255 CHAR),
  email          VARCHAR2(255 CHAR),
  workyears      NUMBER(10),
  photo          BLOB,
  idno           VARCHAR2(255 CHAR),
  credit         VARCHAR2(255 CHAR),
  lastname       VARCHAR2(255 CHAR),
  firstname      VARCHAR2(255 CHAR),
  postcode       VARCHAR2(255 CHAR)
)
;
alter table HR_USERDETAIL
  add primary key (EMPID);
alter table HR_USERDETAIL
  add constraint FK649ECE31846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_USEREDUCATION
prompt ===============================
prompt
create table HR_USEREDUCATION
(
  id      NUMBER(10) not null,
  admdate VARCHAR2(255 CHAR),
  gradate VARCHAR2(255 CHAR),
  school  VARCHAR2(255 CHAR),
  major   VARCHAR2(255 CHAR),
  years   VARCHAR2(255 CHAR),
  degree  VARCHAR2(255 CHAR),
  remark  VARCHAR2(255 CHAR),
  empid   NUMBER(10)
)
;
alter table HR_USEREDUCATION
  add primary key (ID);
alter table HR_USEREDUCATION
  add constraint FKB0A3E9A8846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_USERFAMILY
prompt ============================
prompt
create table HR_USERFAMILY
(
  id       NUMBER(10) not null,
  name     VARCHAR2(255 CHAR),
  relation VARCHAR2(255 CHAR),
  unit     VARCHAR2(255 CHAR),
  remark   VARCHAR2(255 CHAR),
  empid    NUMBER(10)
)
;
alter table HR_USERFAMILY
  add primary key (ID);
alter table HR_USERFAMILY
  add constraint FK67CD1144846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_USERSKILL
prompt ===========================
prompt
create table HR_USERSKILL
(
  id      NUMBER(10) not null,
  item    VARCHAR2(255 CHAR),
  details VARCHAR2(255 CHAR),
  empid   NUMBER(10)
)
;
alter table HR_USERSKILL
  add primary key (ID);
alter table HR_USERSKILL
  add constraint FK3DE35451846175E9 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_USER_FUNCTION
prompt ===============================
prompt
create table HR_USER_FUNCTION
(
  empid  NUMBER(10) not null,
  funcid NUMBER(10) not null
)
;
alter table HR_USER_FUNCTION
  add primary key (EMPID, FUNCID);
alter table HR_USER_FUNCTION
  add constraint FK776F7B776426688F foreign key (FUNCID)
  references HR_FUNCTION (FUNCID);
alter table HR_USER_FUNCTION
  add constraint FK776F7B77E82A8186 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating table HR_USER_ROLE
prompt ===========================
prompt
create table HR_USER_ROLE
(
  empid  NUMBER(10) not null,
  roleid NUMBER(10) not null
)
;
alter table HR_USER_ROLE
  add primary key (EMPID, ROLEID);
alter table HR_USER_ROLE
  add constraint FK3E8FB375AB3DDA5F foreign key (ROLEID)
  references HR_ROLE (ROLEID);
alter table HR_USER_ROLE
  add constraint FK3E8FB375E82A8186 foreign key (EMPID)
  references HR_USER (EMPID);

prompt
prompt Creating sequence SEQ_APPLYID
prompt =============================
prompt
create sequence SEQ_APPLYID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CH_DAILY
prompt ==============================
prompt
create sequence SEQ_CH_DAILY
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CH_MONTH
prompt ==============================
prompt
create sequence SEQ_CH_MONTH
minvalue 1
maxvalue 999999999999999999999999999
start with 50281
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEPTINFO
prompt ==============================
prompt
create sequence SEQ_DEPTINFO
minvalue 1
maxvalue 999999999999999999999999999
start with 201
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_FUNCTION
prompt ==============================
prompt
create sequence SEQ_FUNCTION
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_POSITION
prompt ==============================
prompt
create sequence SEQ_POSITION
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_POSITION_SALARY
prompt =====================================
prompt
create sequence SEQ_POSITION_SALARY
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE
prompt ==========================
prompt
create sequence SEQ_ROLE
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SALARY_HISTORY
prompt ====================================
prompt
create sequence SEQ_SALARY_HISTORY
minvalue 1
maxvalue 999999999999999999999999999
start with 5241
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TAX
prompt =========================
prompt
create sequence SEQ_TAX
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TRANSFER
prompt ==============================
prompt
create sequence SEQ_TRANSFER
minvalue 1
maxvalue 999999999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USER
prompt ==========================
prompt
create sequence SEQ_USER
minvalue 1
maxvalue 999999999999999999999999999
start with 10011049
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USEREDUCATION
prompt ===================================
prompt
create sequence SEQ_USEREDUCATION
minvalue 1
maxvalue 999999999999999999999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERFAMILY
prompt ================================
prompt
create sequence SEQ_USERFAMILY
minvalue 1
maxvalue 999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERSKILL
prompt ===============================
prompt
create sequence SEQ_USERSKILL
minvalue 1
maxvalue 999999999999999999999999999
start with 40241
increment by 1
cache 20;

prompt
prompt Creating procedure PRO_CH_MONTH
prompt ===============================
prompt
create or replace procedure pro_ch_month is
  Cursor c_job is select empid from Hr_User;
emp number;
begin
  for emp in c_job LOOP
    insert into hr_ch_month(monthid,chmonth,empid) values(SEQ_CH_MONTH.NEXTVAL,to_char(sysdate,'yyyy-mm'),emp.empid);
    commit;
  end LOOP;
end pro_ch_month;
/

variable job  NUMBER;
 begin 
    sys.dbms_job.submit(:job,'PRO_CH_MONTH;',sysdate,'TRUNC(LAST_DAY(SYSDATE))+1');
 commit;
 end;
/

prompt
prompt Creating trigger TG_DAY_DELETE
prompt ==============================
prompt
create or replace trigger tg_day_delete
  after delete on hr_ch_daily
  for each row
declare
  itemnote hr_ch_dic.itemnote%type;
  -- local variables here
begin
  select itemnote into itemnote from HR_CH_DIC where itemkey = :old.chindex;
  case itemnote
    when 'LATE' then
      update hr_ch_month
         set LATE = LATE - :old.count
       where monthid = :old.monthid;
    when 'EARLY' then
      update hr_ch_month
         set EARLY = EARLY - :old.count
       where monthid = :old.monthid;
    when 'SKIP' then
      update hr_ch_month
         set SKIP = SKIP - :old.count
       where monthid = :old.monthid;
    when 'EXCUSED' then
      update hr_ch_month
         set EXCUSED = EXCUSED - :old.count
       where monthid = :old.monthid;
    when 'SICK' then
      update hr_ch_month
         set SICK = SICK - :old.count
       where monthid = :old.monthid;
    when 'MARRIAGE' then
      update hr_ch_month
         set MARRIAGE = MARRIAGE - :old.count
       where monthid = :old.monthid;
    when 'ANNUAL' then
      update hr_ch_month
         set ANNUAL = ANNUAL - :old.count
       where monthid = :old.monthid;
    when 'FUNERAL' then
      update hr_ch_month
         set FUNERAL = FUNERAL - :old.count
       where monthid = :old.monthid;
    when 'MATERNITY' then
      update hr_ch_month
         set MATERNITY = MATERNITY - :old.count
       where monthid = :old.monthid;
    when 'WORKINJURY' then
      update hr_ch_month
         set WORKINJURY = WORKINJURY - :old.count
       where monthid = :old.monthid;
    when 'BUSINESS' then
      update hr_ch_month
         set BUSINESS = BUSINESS - :old.count
       where monthid = :old.monthid;
    when 'PUBLICHOL' then
      update hr_ch_month
         set PUBLICHOL = PUBLICHOL - :old.count
       where monthid = :old.monthid;
    when 'NORMAL' then
      update hr_ch_month
         set NORMAL = NORMAL - :old.count
       where monthid = :old.monthid;
    when 'HOLIDAY' then
      update hr_ch_month
         set HOLIDAY = HOLIDAY - :old.count
       where monthid = :old.monthid;
    when 'COL1' then
      update hr_ch_month
         set COL1 = COL1 - :old.count
       where monthid = :old.monthid;
    when 'COL2' then
      update hr_ch_month
         set COL2 = COL2 - :old.count
       where monthid = :old.monthid;
    when 'COL3' then
      update hr_ch_month
         set COL3 = COL3 - :old.count
       where monthid = :old.monthid;
    when 'COL4' then
      update hr_ch_month
         set COL4 = COL4 - :old.count
       where monthid = :old.monthid;
  end case;
 end;
/

prompt
prompt Creating trigger TG_DAY_INSERT
prompt ==============================
prompt
create or replace trigger tg_day_insert
  after insert on hr_ch_daily
  for each row
declare
itemnote hr_ch_dic.itemnote%type;
begin

   select itemnote into itemnote from HR_CH_DIC where itemkey = :new.chindex;
  case itemnote
    when 'LATE' then
      update hr_ch_month
         set LATE = LATE + :new.count
       where monthid = :new.monthid;
    when 'EARLY' then
      update hr_ch_month
         set EARLY = EARLY + :new.count
       where monthid = :new.monthid;
    when 'SKIP' then
      update hr_ch_month
         set SKIP = SKIP + :new.count
       where monthid = :new.monthid;
    when 'EXCUSED' then
      update hr_ch_month
         set EXCUSED = EXCUSED + :new.count
       where monthid = :new.monthid;
    when 'SICK' then
      update hr_ch_month
         set SICK = SICK + :new.count
       where monthid = :new.monthid;
    when 'MARRIAGE' then
      update hr_ch_month
         set MARRIAGE = MARRIAGE + :new.count
       where monthid = :new.monthid;
    when 'ANNUAL' then
      update hr_ch_month
         set ANNUAL = ANNUAL + :new.count
       where monthid = :new.monthid;
    when 'FUNERAL' then
      update hr_ch_month
         set FUNERAL = FUNERAL + :new.count
       where monthid = :new.monthid;
    when 'MATERNITY' then
      update hr_ch_month
         set MATERNITY = MATERNITY + :new.count
       where monthid = :new.monthid;
    when 'WORKINJURY' then
      update hr_ch_month
         set WORKINJURY = WORKINJURY + :new.count
       where monthid = :new.monthid;
    when 'BUSINESS' then
      update hr_ch_month
         set BUSINESS = BUSINESS + :new.count
       where monthid = :new.monthid;
    when 'PUBLICHOL' then
      update hr_ch_month
         set PUBLICHOL = PUBLICHOL + :new.count
       where monthid = :new.monthid;
    when 'NORMAL' then
      update hr_ch_month
         set NORMAL = NORMAL + :new.count
       where monthid = :new.monthid;
    when 'HOLIDAY' then
      update hr_ch_month
         set HOLIDAY = HOLIDAY + :new.count
       where monthid = :new.monthid;
    when 'COL1' then
      update hr_ch_month
         set COL1 = COL1 + :new.count
       where monthid = :new.monthid;

    when 'COL2' then
      update hr_ch_month
         set COL2 = COL2 + :new.count
       where monthid = :new.monthid;

    when 'COL3' then
      update hr_ch_month
         set COL3 = COL3 + :new.count
       where monthid = :new.monthid;

    when 'COL4' then
      update hr_ch_month
         set COL4 = COL4 + :new.count
       where monthid = :new.monthid;

  end case;

end tg_day_insert;
/

prompt
prompt Creating trigger TG_DAY_UPDATE
prompt ==============================
prompt
create or replace trigger tg_day_update
  after update on hr_ch_daily
  for each row
declare
itemnote hr_ch_dic.itemnote%type;
begin
  select itemnote into itemnote from HR_CH_DIC where itemkey = :old.chindex;
  case itemnote
    when 'LATE' then
      update hr_ch_month
         set LATE = LATE - :old.count
       where monthid = :old.monthid;
    when 'EARLY' then
      update hr_ch_month
         set EARLY = EARLY - :old.count
       where monthid = :old.monthid;
    when 'SKIP' then
      update hr_ch_month
         set SKIP = SKIP - :old.count
       where monthid = :old.monthid;
    when 'EXCUSED' then
      update hr_ch_month
         set EXCUSED = EXCUSED - :old.count
       where monthid = :old.monthid;
    when 'SICK' then
      update hr_ch_month
         set SICK = SICK - :old.count
       where monthid = :old.monthid;
    when 'MARRIAGE' then
      update hr_ch_month
         set MARRIAGE = MARRIAGE - :old.count
       where monthid = :old.monthid;
    when 'ANNUAL' then
      update hr_ch_month
         set ANNUAL = ANNUAL - :old.count
       where monthid = :old.monthid;
    when 'FUNERAL' then
      update hr_ch_month
         set FUNERAL = FUNERAL - :old.count
       where monthid = :old.monthid;
    when 'MATERNITY' then
      update hr_ch_month
         set MATERNITY = MATERNITY - :old.count
       where monthid = :old.monthid;
    when 'WORKINJURY' then
      update hr_ch_month
         set WORKINJURY = WORKINJURY - :old.count
       where monthid = :old.monthid;
    when 'BUSINESS' then
      update hr_ch_month
         set BUSINESS = BUSINESS - :old.count
       where monthid = :old.monthid;
    when 'PUBLICHOL' then
      update hr_ch_month
         set PUBLICHOL = PUBLICHOL - :old.count
       where monthid = :old.monthid;
    when 'NORMAL' then
      update hr_ch_month
         set NORMAL = NORMAL - :old.count
       where monthid = :old.monthid;
    when 'HOLIDAY' then
      update hr_ch_month
         set HOLIDAY = HOLIDAY - :old.count
       where monthid = :old.monthid;
    when 'COL1' then
      update hr_ch_month
         set COL1 = COL1 - :old.count
       where monthid = :old.monthid;
    when 'COL2' then
      update hr_ch_month
         set COL2 = COL2 - :old.count
       where monthid = :old.monthid;
    when 'COL3' then
      update hr_ch_month
         set COL3 = COL3 - :old.count
       where monthid = :old.monthid;
    when 'COL4' then
      update hr_ch_month
         set COL4 = COL4 - :old.count
       where monthid = :old.monthid;
  end case;

select itemnote into itemnote from HR_CH_DIC where itemkey = :new.chindex;
  case itemnote
    when 'LATE' then
      update hr_ch_month
         set LATE = LATE + :new.count
       where monthid = :old.monthid;
    when 'EARLY' then
      update hr_ch_month
         set EARLY = EARLY + :new.count
       where monthid = :old.monthid;
    when 'SKIP' then
      update hr_ch_month
         set SKIP = SKIP + :new.count
       where monthid = :old.monthid;
    when 'EXCUSED' then
      update hr_ch_month
         set EXCUSED = EXCUSED + :new.count
       where monthid = :old.monthid;
    when 'SICK' then
      update hr_ch_month
         set SICK = SICK + :new.count
       where monthid = :old.monthid;
    when 'MARRIAGE' then
      update hr_ch_month
         set MARRIAGE = MARRIAGE + :new.count
       where monthid = :old.monthid;
    when 'ANNUAL' then
      update hr_ch_month
         set ANNUAL = ANNUAL + :new.count
       where monthid = :old.monthid;
    when 'FUNERAL' then
      update hr_ch_month
         set FUNERAL = FUNERAL + :new.count
       where monthid = :old.monthid;
    when 'MATERNITY' then
      update hr_ch_month
         set MATERNITY = MATERNITY + :new.count
       where monthid = :old.monthid;
    when 'WORKINJURY' then
      update hr_ch_month
         set WORKINJURY = WORKINJURY + :new.count
       where monthid = :old.monthid;
    when 'BUSINESS' then
      update hr_ch_month
         set BUSINESS = BUSINESS + :new.count
       where monthid = :old.monthid;
    when 'PUBLICHOL' then
      update hr_ch_month
         set PUBLICHOL = PUBLICHOL + :new.count
       where monthid = :old.monthid;
    when 'NORMAL' then
      update hr_ch_month
         set NORMAL = NORMAL + :new.count
       where monthid = :old.monthid;
    when 'HOLIDAY' then
      update hr_ch_month
         set HOLIDAY = HOLIDAY + :new.count
       where monthid = :old.monthid;
    when 'COL1' then
      update hr_ch_month
         set COL1 = COL1 + :new.count
       where monthid = :old.monthid;

    when 'COL2' then
      update hr_ch_month
         set COL2 = COL2 + :new.count
       where monthid = :old.monthid;

    when 'COL3' then
      update hr_ch_month
         set COL3 = COL3 + :new.count
       where monthid = :old.monthid;

    when 'COL4' then
      update hr_ch_month
         set COL4 = COL4 + :new.count
       where monthid = :old.monthid;

  end case;

end tg_day_update;
/

prompt
prompt Creating trigger TG_POSITION_DELETE
prompt ===================================
prompt
create or replace trigger tg_position_delete
  after update of valid on  hr_position
  for each row
declare
  -- local variables here
begin
   case :old.valid
     when 1 then
      update hr_user set valid = 0 where postid =:old.postid;
      end case;
end tg_position_delete;
/

prompt
prompt Creating trigger TG_POSITION_INSERT
prompt ===================================
prompt
create or replace trigger TG_POSITION_INSERT
  after  insert on  hr_position
  for each row
declare
  -- local variables here
begin
  insert into hr_position_salary(id,postid) values(SEQ_POSITION_SALARY.NEXTVAL,:new.postid);

end TG_POSITION_INSERT;
/

spool off

prompt PL/SQL Developer import file
prompt Created on 2014��4��1�� by sun
set feedback off
set define off
prompt Disabling triggers for HR_CH_DAILY...
alter table HR_CH_DAILY disable all triggers;
prompt Disabling triggers for HR_CH_DIC...
alter table HR_CH_DIC disable all triggers;
prompt Disabling triggers for HR_ORGINFO...
alter table HR_ORGINFO disable all triggers;
prompt Disabling triggers for HR_POSITION...
alter table HR_POSITION disable all triggers;
prompt Disabling triggers for HR_USER...
alter table HR_USER disable all triggers;
prompt Disabling triggers for HR_CH_MONTH...
alter table HR_CH_MONTH disable all triggers;
prompt Disabling triggers for HR_FUNCTION...
alter table HR_FUNCTION disable all triggers;
prompt Disabling triggers for HR_LEAVEAPPLY...
alter table HR_LEAVEAPPLY disable all triggers;
prompt Disabling triggers for HR_POSITION_SALARY...
alter table HR_POSITION_SALARY disable all triggers;
prompt Disabling triggers for HR_ROLE...
alter table HR_ROLE disable all triggers;
prompt Disabling triggers for HR_ROLE_FUNCTION...
alter table HR_ROLE_FUNCTION disable all triggers;
prompt Disabling triggers for HR_SALARY_HISTORY...
alter table HR_SALARY_HISTORY disable all triggers;
prompt Disabling triggers for HR_TAX...
alter table HR_TAX disable all triggers;
prompt Disabling triggers for HR_TRANSFER...
alter table HR_TRANSFER disable all triggers;
prompt Disabling triggers for HR_USEREDUCATION...
alter table HR_USEREDUCATION disable all triggers;
prompt Disabling triggers for HR_USERFAMILY...
alter table HR_USERFAMILY disable all triggers;
prompt Disabling triggers for HR_USERSKILL...
alter table HR_USERSKILL disable all triggers;
prompt Disabling triggers for HR_USER_FUNCTION...
alter table HR_USER_FUNCTION disable all triggers;
prompt Disabling triggers for HR_USER_ROLE...
alter table HR_USER_ROLE disable all triggers;
prompt Disabling foreign key constraints for HR_ORGINFO...
alter table HR_ORGINFO disable constraint FKA227933D8A1FDBA7;
prompt Disabling foreign key constraints for HR_USER...
alter table HR_USER disable constraint FK7210A9E05438079F;
alter table HR_USER disable constraint FK7210A9E0DFBB044C;
prompt Disabling foreign key constraints for HR_CH_MONTH...
alter table HR_CH_MONTH disable constraint FKDC6BA99B846175E9;
prompt Disabling foreign key constraints for HR_LEAVEAPPLY...
alter table HR_LEAVEAPPLY disable constraint FKE7DADD6C846175E9;
prompt Disabling foreign key constraints for HR_POSITION_SALARY...
alter table HR_POSITION_SALARY disable constraint FKEFCFEC6B5438079F;
prompt Disabling foreign key constraints for HR_ROLE_FUNCTION...
alter table HR_ROLE_FUNCTION disable constraint FK6271830C6426688F;
alter table HR_ROLE_FUNCTION disable constraint FK6271830CAB3DDA5F;
prompt Disabling foreign key constraints for HR_SALARY_HISTORY...
alter table HR_SALARY_HISTORY disable constraint FKE3D35AD4846175E9;
prompt Disabling foreign key constraints for HR_TRANSFER...
alter table HR_TRANSFER disable constraint FKA03C5B80846175E9;
prompt Disabling foreign key constraints for HR_USEREDUCATION...
alter table HR_USEREDUCATION disable constraint FKB0A3E9A8846175E9;
prompt Disabling foreign key constraints for HR_USERFAMILY...
alter table HR_USERFAMILY disable constraint FK67CD1144846175E9;
prompt Disabling foreign key constraints for HR_USERSKILL...
alter table HR_USERSKILL disable constraint FK3DE35451846175E9;
prompt Disabling foreign key constraints for HR_USER_FUNCTION...
alter table HR_USER_FUNCTION disable constraint FK776F7B776426688F;
alter table HR_USER_FUNCTION disable constraint FK776F7B77E82A8186;
prompt Disabling foreign key constraints for HR_USER_ROLE...
alter table HR_USER_ROLE disable constraint FK3E8FB375AB3DDA5F;
alter table HR_USER_ROLE disable constraint FK3E8FB375E82A8186;
prompt Loading HR_CH_DAILY...
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (41, 50083, '2014-03-18', 10011003, 1, 1, '�ٵ�');
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (42, 50083, '2014-03-18', 10011003, 1, 2, '����');
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (75, 50082, '2014-03-10', 10011002, 1, 1, '�ٵ�');
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (76, 50082, '2014-03-20', 10011002, 1, 4, '���»ؼ�');
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (77, 50082, '2014-03-17', 10011002, 1, 2, null);
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (78, 50082, '2014-03-18', 10011002, 1, 2, null);
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (79, 50082, '2014-03-12', 10011002, 1, 2, '����');
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (80, 50082, '2014-03-03', 10011002, 1, 4, null);
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (81, 50082, '2014-03-09', 10011002, 1, 13, null);
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (73, 50082, '2014-03-17', 10011002, 1, 3, null);
insert into HR_CH_DAILY (dayid, monthid, chday, empid, count, chindex, detailinfo)
values (74, 50082, '2014-03-17', 10011002, 1, 3, null);
commit;
prompt 11 records loaded
prompt Loading HR_CH_DIC...
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (1, '�ٵ�', 'LATE', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (2, '����', 'EARLY', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (3, '����', 'SKIP', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (4, '�¼�', 'EXCUSED', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (5, '����', 'SICK', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (6, '���', 'MARRIAGE', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (7, '���ݼ�', 'ANNUAL', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (8, 'ɥ��', 'FUNERAL', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (9, '����', 'MATERNITY', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (10, '����', 'WORKINJURY', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (11, '����', 'BUSINESS', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (12, '����', 'PUBLICHOL', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (13, '��ͨ�Ӱ�', 'NORMAL', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (14, '���ռӰ�', 'HOLIDAY', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (15, 'Ԥ��1', 'COL1', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (16, 'Ԥ��2', 'COL2', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (17, 'Ԥ��3', 'COL3', '1');
insert into HR_CH_DIC (itemkey, itemvalue, itemnote, itemflag)
values (18, 'Ԥ��4', 'COL4', '1');
commit;
prompt 18 records loaded
prompt Loading HR_ORGINFO...
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (121, 'com', 'ĳ�ֹ�˾', '�����ӹ�˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (122, 'dept', '�ƻ���', null, 0, 101);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (123, 'dept', '�²���', ' ', 0, 101);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (185, 'dept', '����1', '����1', 0, 184);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (188, 'com', '��һ�ֹ�˾', null, 1, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (189, 'dept', '����1', null, 0, 188);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (190, 'dept', '����2', null, 0, 188);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (191, 'dept', '�²���', ' ', 1, 188);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (101, 'com', 'ı�·ֹ�˾', null, 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (102, 'dept', '���²�', null, 0, 101);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (152, 'com', '��һ�ֹ�˾', '��һ�ֹ�˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (153, 'dept', '����1', '����1', 0, 152);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (154, 'dept', '����2', '����2', 0, 152);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (155, 'dept', '�²���', '�²���', 0, 152);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (125, 'dept', '�²���', ' ', 0, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (124, 'com', '�ڶ��ֹ�˾', '�ڶ��ֹ�˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (141, 'dept', '�²���', '�²���', 0, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (142, 'dept', '�²���', null, 1, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (143, 'com', '��һ�ֹ�˾', '��һ�ֹ�˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (144, 'dept', '����1', '����1', 0, 143);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (145, 'dept', '����2', '����2', 0, 143);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (146, 'dept', '�²���', ' �ɲ���1�Ͳ���2�ϲ�����', 0, 143);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (147, 'com', '�ڶ��ֹ�˾', null, 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (148, 'dept', '����1', null, 0, 147);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (149, 'dept', '����2', null, 0, 147);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (150, 'dept', '�²���', ' ', 0, 147);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (151, 'com', 'ĳ��˾', 'ĳ��˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (161, 'com', '��һ�ֹ�˾', '��һ�ֹ�˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (162, 'dept', '����1', '����1', 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (163, 'dept', '����2', '����2', 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (164, 'dept', '�²���', '�²���', 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (167, 'dept', '�²���', null, 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (181, 'dept', '����1', null, 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (182, 'dept', '����2', null, 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (183, 'dept', '�²���', null, 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (184, 'com', '��һ�ֹ�˾', '��һ�ֹ�˾', 0, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (186, 'dept', '����2', '����2', 0, 184);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (187, 'dept', '�²���', '�ɲ���1�Ͳ���2�ϲ�', 0, 184);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (165, 'dept', '����1', null, 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (166, 'dept', '����2', null, 0, 161);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100102, 'dept', '������Դ��', null, 1, 1001);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100103, 'dept', '�ƻ�����', null, 1, 1001);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100104, 'dept', '��������', null, 1, 1001);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100105, 'dept', '�о��뷢չ����', null, 1, 1001);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100201, 'dept', '�칫��', null, 1, 1002);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (1000, 'com', 'ĳȼ�����̰�װ���޹�˾', null, 1, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (1001, 'com', 'ĳȼ�����޹�˾', null, 1, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (1002, 'com', 'ĳ��Դ���޹�˾', null, 1, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (1003, 'com', 'ĳ��Ȼ�����޹�˾', null, 1, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (1004, 'com', 'ĳҺ�������޹�˾', null, 1, null);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100101, 'dept', '�칫��', null, 1, 1001);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100202, 'dept', '������Դ��', null, 1, 1002);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100203, 'dept', '�ƻ�����', null, 1, 1002);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100204, 'dept', '��������', null, 1, 1002);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100205, 'dept', '�о��뷢չ����', null, 1, 1002);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100301, 'dept', '�칫��', null, 1, 1003);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100302, 'dept', '������Դ��', null, 1, 1003);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100303, 'dept', '�ƻ�����', null, 1, 1003);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100304, 'dept', '��������', null, 1, 1003);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100305, 'dept', '�о��뷢չ����', null, 1, 1003);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100401, 'dept', '�칫��', null, 1, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100402, 'dept', '������Դ��', null, 1, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100403, 'dept', '�ƻ�����', null, 0, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100404, 'dept', '��������', null, 0, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100405, 'dept', '�о��뷢չ����', null, 1, 1004);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100001, 'dept', '�칫��', null, 1, 1000);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100002, 'dept', '������Դ��', null, 1, 1000);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100003, 'dept', '�ƻ�����', null, 1, 1000);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100004, 'dept', '��������', null, 1, 1000);
insert into HR_ORGINFO (orgid, orgtype, orgname, remark, valid, parentid)
values (100005, 'dept', '�о��뷢չ����', null, 1, 1000);
commit;
prompt 70 records loaded
prompt Loading HR_POSITION...
insert into HR_POSITION (postid, postname, postintro, remark, valid)
values (1234, '�ܾ���', '����˾����', null, 1);
insert into HR_POSITION (postid, postname, postintro, remark, valid)
values (1235, '���ž���', '�����Ź���', null, 1);
insert into HR_POSITION (postid, postname, postintro, remark, valid)
values (1236, '��ͨԱ��', null, null, 1);
insert into HR_POSITION (postid, postname, postintro, remark, valid)
values (1237, '��Ŀ����', '������Ŀ', null, 1);
insert into HR_POSITION (postid, postname, postintro, remark, valid)
values (1238, '���ܾ���', 'Э���ܾ���', null, 1);
commit;
prompt 5 records loaded
prompt Loading HR_USER...
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011002, '��־��', '123456', 1234, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011003, '������', '123456', 1236, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011004, '���h��', '123456', 1236, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011005, '˾����', '123456', 1236, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011006, '���Ƚ�', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011007, '��ʯ��', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011008, '�ź���', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011009, '�ű�', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011010, '��ƽ��', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011011, '��Т��', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011012, '�ž���', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011013, '���', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011014, '��ٻ��', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011015, '������', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011016, '����', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011017, '�ܻ�Ƽ', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011018, '��ʿ��', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011019, '������', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011020, '������', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011021, '��Ⱥ', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011022, '�����', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011023, '������', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021002, '���ĺ�', '123456', 1237, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021003, '���Ƚ�', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021004, '��ʯ��', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021005, '�ź���', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021006, '�ű�', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021007, '��ƽ��', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021008, '��Т��', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021009, '�ž���', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021010, '���', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021011, '��ٻ��', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021012, '������', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021013, '����', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021014, '�ܻ�Ƽ', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021015, '��ʿ��', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021016, '������', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021017, '������', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021018, '��Ⱥ', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021019, '�����', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10021020, '������', '123456', 1235, 100002, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031002, '���ĺ�', '123456', 1237, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031003, '���Ƚ�', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031004, '��ʯ��', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031005, '�ź���', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031006, '�ű�', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031007, '��ƽ��', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031008, '��Т��', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031009, '�ž���', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031010, '���', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031011, '��ٻ��', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031012, '������', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031013, '����', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031014, '�ܻ�Ƽ', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031015, '��ʿ��', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031016, '������', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031017, '������', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031018, '��Ⱥ', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031019, '�����', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031020, '������', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10031021, '�𰲿�', '123456', 1235, 100003, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041002, '��һ��', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041003, '�����', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041004, '���Ƚ�', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041005, '��ʯ��', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041006, '�ź���', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041007, '�ű�', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041008, '��ƽ��', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041009, '��Т��', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041010, '�ž���', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041011, '���', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041012, '��ٻ��', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041013, '������', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041014, '����', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041015, '�ܻ�Ƽ', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041016, '��ʿ��', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041017, '������', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041018, '������', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041019, '��Ⱥ', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041020, '�����', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10041021, '������', '123456', 1235, 100004, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051002, '���Ƚ�', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051003, '��ʯ��', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051004, '�ź���', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051005, '�ű�', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051006, '��ƽ��', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051007, '��Т��', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051008, '�ž���', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051009, '���', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051010, '��ٻ��', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051011, '������', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051012, '����', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051013, '�ܻ�Ƽ', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051014, '��ʿ��', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051015, '������', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051016, '������', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051017, '��Ⱥ', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051018, '�����', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10051019, '������', '123456', 1235, 100005, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011025, '����', '123456', 1236, 100001, 0);
commit;
prompt 100 records committed...
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011024, '����', '123456', 1236, 100001, 0);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011026, '����', '123456', 1237, 100001, 0);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10011029, '����', '123456', 1235, 100001, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10142, '����', '123456', 1236, 100001, 0);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10121, '���Ӳ�', '123456', 1234, 102, 1);
insert into HR_USER (empid, empname, emppassword, postid, orgid, valid)
values (10141, '����', '123456', 1234, 100002, 0);
commit;
prompt 106 records loaded
prompt Loading HR_CH_MONTH...
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50081, 10121, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50082, 10011002, '2014-03', 1, 3, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50083, 10011003, '2014-03', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50084, 10011004, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50085, 10011005, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50086, 10011006, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50087, 10011007, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50088, 10011008, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50089, 10011009, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50090, 10011010, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50091, 10011011, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50092, 10011012, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50093, 10011013, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50094, 10011014, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50095, 10011015, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50096, 10011016, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50097, 10011017, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50098, 10011018, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50099, 10011019, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50100, 10011020, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50101, 10011021, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50102, 10011022, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50103, 10011023, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50104, 10021002, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50105, 10021003, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50106, 10021004, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50107, 10021005, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50108, 10021006, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50109, 10021007, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50110, 10021008, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50111, 10021009, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50112, 10021010, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50113, 10021011, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50114, 10021012, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50115, 10021013, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50116, 10021014, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50117, 10021015, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50118, 10021016, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50119, 10021017, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50120, 10021018, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50121, 10021019, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50122, 10021020, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50123, 10031002, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50124, 10031003, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50125, 10031004, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50126, 10031005, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50127, 10031006, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50128, 10031007, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50129, 10031008, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50130, 10031009, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50131, 10031010, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50132, 10031011, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50133, 10031012, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50134, 10031013, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50135, 10031014, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50136, 10031015, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50137, 10031016, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50138, 10031017, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50139, 10031018, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50140, 10031019, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50141, 10031020, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50142, 10031021, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50143, 10041002, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50144, 10041003, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50145, 10041004, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50146, 10041005, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50147, 10041006, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50148, 10041007, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50149, 10041008, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50150, 10041009, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50151, 10041010, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50152, 10041011, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50153, 10041012, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50154, 10041013, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50155, 10041014, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50156, 10041015, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50157, 10041016, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50158, 10041017, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50159, 10041018, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50160, 10041019, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50161, 10041020, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50162, 10041021, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50163, 10051002, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50164, 10051003, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50165, 10051004, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50166, 10051005, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50167, 10051006, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50168, 10051007, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50169, 10051008, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50170, 10051009, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50171, 10051010, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50172, 10051011, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50173, 10051012, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50174, 10051013, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50175, 10051014, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50176, 10051015, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50177, 10051016, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50178, 10051017, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50179, 10051018, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50180, 10051019, '2014-03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
commit;
prompt 100 records committed...
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50181, 10121, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50182, 10011002, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50183, 10011003, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50184, 10011004, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50185, 10011005, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50186, 10011006, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50187, 10011007, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50188, 10011008, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50189, 10011009, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50190, 10011010, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50191, 10011011, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50192, 10011012, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50193, 10011013, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50194, 10011014, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50195, 10011015, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50196, 10011016, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50197, 10011017, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50198, 10011018, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50199, 10011019, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50200, 10011020, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50201, 10011021, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50202, 10011022, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50203, 10011023, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50204, 10021002, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50205, 10021003, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50206, 10021004, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50207, 10021005, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50208, 10021006, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50209, 10021007, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50210, 10021008, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50211, 10021009, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50212, 10021010, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50213, 10021011, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50214, 10021012, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50215, 10021013, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50216, 10021014, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50217, 10021015, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50218, 10021016, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50219, 10021017, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50220, 10021018, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50221, 10021019, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50222, 10021020, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50223, 10031002, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50224, 10031003, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50225, 10031004, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50226, 10031005, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50227, 10031006, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50228, 10031007, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50229, 10031008, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50230, 10031009, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50231, 10031010, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50232, 10031011, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50233, 10031012, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50234, 10031013, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50235, 10031014, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50236, 10031015, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50237, 10031016, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50238, 10031017, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50239, 10031018, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50240, 10031019, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50241, 10031020, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50242, 10031021, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50243, 10041002, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50244, 10041003, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50245, 10041004, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50246, 10041005, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50247, 10041006, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50248, 10041007, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50249, 10041008, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50250, 10041009, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50251, 10041010, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50252, 10041011, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50253, 10041012, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50254, 10041013, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50255, 10041014, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50256, 10041015, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50257, 10041016, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50258, 10041017, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50259, 10041018, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50260, 10041019, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50261, 10041020, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50262, 10041021, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50263, 10051002, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50264, 10051003, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50265, 10051004, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50266, 10051005, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50267, 10051006, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50268, 10051007, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50269, 10051008, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50270, 10051009, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50271, 10051010, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50272, 10051011, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50273, 10051012, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50274, 10051013, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50275, 10051014, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50276, 10051015, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50277, 10051016, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50278, 10051017, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50279, 10051018, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert into HR_CH_MONTH (monthid, empid, chmonth, late, early, skip, excused, sick, marriage, annual, funeral, maternity, workinjury, business, publichol, normal, holiday, col1, col2, col3, col4)
values (50280, 10051019, '2014-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
commit;
prompt 200 records loaded
prompt Loading HR_FUNCTION...
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (1, '��˾����', 'OrgManager', 'orgtype', 'com', 0, null);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (2, '���Ź���', 'OrgManager', 'orgtype', 'dept', 0, null);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (3, '��λ����', 'OrgManager', 'orgtype', 'post', 0, null);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (4, '�鿴������Ա����Ϣ', 'ShowUser', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (5, '�鿴����˾Ա����Ϣ', 'ShowUser', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (6, '�鿴���й�˾Ա����Ϣ', 'ShowUser', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (7, '��ӱ�����Ա��', 'AddUser', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (8, '��ӱ���˾Ա��', 'AddUser', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (9, '������й�˾Ա��', 'AddUser', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (10, '�޸ı�����Ա��', 'EditUser', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (11, '�޸ı���˾Ա��', 'EditUser', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (12, '�޸����й�˾Ա��', 'EditUser', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (13, '������Ա������', 'MoveUser', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (14, '��˾��Ա������', 'MoveUser', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (15, '��˾��Ա������', 'MoveUser', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (16, '�鿴�޸ı�����Ա��������Ϣ', 'ShowCheckIn', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (17, '�鿴�޸ı���˾Ա��������Ϣ', 'ShowCheckIn', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (18, '�鿴�޸����й�˾Ա��������Ϣ', 'ShowCheckIn', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (19, '�鿴����������Ա�������Ϣ', 'ShowAllLeaveApply', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (20, '�鿴��������˾Ա�������Ϣ', 'ShowAllLeaveApply', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (21, '�鿴�������й�˾Ա�������Ϣ', 'ShowAllLeaveApply', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (22, '�鿴������Ա��н����Ϣ', 'ShowAllSalary', null, null, 1, 1);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (23, '�鿴����˾Ա��н����Ϣ', 'ShowAllSalary', null, null, 1, 2);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (24, '�鿴���й�˾Ա��н����Ϣ', 'ShowAllSalary', null, null, 1, 3);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (25, 'н���������', 'SalaryParamSet', null, null, 0, null);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (26, '��ɫ����', 'RoleAdmin', null, null, 0, null);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (27, '��ɫ����', 'RoleAllot', null, null, 0, null);
insert into HR_FUNCTION (funcid, funcname, funcurl, param_key, param_value, orgrelied, scopelevel)
values (28, 'Ȩ�޷���', 'PowerAllot', null, null, 0, null);
commit;
prompt 28 records loaded
prompt Loading HR_LEAVEAPPLY...
insert into HR_LEAVEAPPLY (applyid, empid, startdate, enddate, leaveindex, leavereason, agreed, advice, approtime)
values (4, 10011008, '2014-2-18', '2014-2-25', 6, 'ϲ����Ե', 1, null, '2014-03-19');
insert into HR_LEAVEAPPLY (applyid, empid, startdate, enddate, leaveindex, leavereason, agreed, advice, approtime)
values (1, 10011003, '2014-3-15', '2014-3-18', 5, '��ð', 1, null, '2014-03-19');
insert into HR_LEAVEAPPLY (applyid, empid, startdate, enddate, leaveindex, leavereason, agreed, advice, approtime)
values (2, 10011004, '2014-3-10', '2014-3-20', 11, '��������ѧϰ', 2, null, '2014-03-19');
insert into HR_LEAVEAPPLY (applyid, empid, startdate, enddate, leaveindex, leavereason, agreed, advice, approtime)
values (3, 10011005, '2014-3-14', '2014-3-18', 4, '�ؼ�̽������ĸ��', 1, null, null);
commit;
prompt 4 records loaded
prompt Loading HR_POSITION_SALARY...
insert into HR_POSITION_SALARY (id, postwage, glgz, txf, gwf, nzj, qtjl, zcjt, bsj, sybx, ylbx, yb, gjj, zjbx, yljj, ccf, pujb, jqjb, cd, zt, kg, sj, yl1, yl2, yl3, yl4, postid)
values (25, 10000, 1000, 100, 0, 0, 0, 200, -100, -100, -200, -200, -100, -100, -100, 0, 80, 180, -50, -50, -300, -50, 0, 0, 0, 0, 1234);
insert into HR_POSITION_SALARY (id, postwage, glgz, txf, gwf, nzj, qtjl, zcjt, bsj, sybx, ylbx, yb, gjj, zjbx, yljj, ccf, pujb, jqjb, cd, zt, kg, sj, yl1, yl2, yl3, yl4, postid)
values (26, 8000, 600, 100, 0, 0, 0, 100, -50, -100, -100, -100, -100, -50, -50, 0, 50, 100, -40, -40, -200, -50, 0, 0, 0, 0, 1235);
insert into HR_POSITION_SALARY (id, postwage, glgz, txf, gwf, nzj, qtjl, zcjt, bsj, sybx, ylbx, yb, gjj, zjbx, yljj, ccf, pujb, jqjb, cd, zt, kg, sj, yl1, yl2, yl3, yl4, postid)
values (27, 3000, 300, 20, 0, 0, 0, 30, -50, -50, -30, -30, -20, -10, -10, 0, 20, 60, -20, -10, -100, -20, 0, 0, 0, 0, 1236);
insert into HR_POSITION_SALARY (id, postwage, glgz, txf, gwf, nzj, qtjl, zcjt, bsj, sybx, ylbx, yb, gjj, zjbx, yljj, ccf, pujb, jqjb, cd, zt, kg, sj, yl1, yl2, yl3, yl4, postid)
values (28, 7000, 400, 50, 0, 0, 0, 50, -50, -100, -100, -100, -50, -50, -50, 0, 40, 80, -40, -40, -200, -50, 0, 0, 0, 0, 1237);
insert into HR_POSITION_SALARY (id, postwage, glgz, txf, gwf, nzj, qtjl, zcjt, bsj, sybx, ylbx, yb, gjj, zjbx, yljj, ccf, pujb, jqjb, cd, zt, kg, sj, yl1, yl2, yl3, yl4, postid)
values (29, 9000, 500, 50, 0, 0, 0, 100, -50, -100, -100, -100, -50, -50, -50, 0, 40, 100, -40, -40, -200, -50, 0, 0, 0, 0, 1238);
commit;
prompt 5 records loaded
prompt Loading HR_ROLE...
insert into HR_ROLE (roleid, rolename, roleinfo)
values (1, '��߹���Ա', '����ʹ��ϵͳ���й���');
insert into HR_ROLE (roleid, rolename, roleinfo)
values (2, '��˾����Ա', '���ԶԱ���˾���й���');
insert into HR_ROLE (roleid, rolename, roleinfo)
values (3, '���Ź���Ա', '���ԶԱ����Ž��й���');
insert into HR_ROLE (roleid, rolename, roleinfo)
values (21, '������Ϣά��', ' ');
insert into HR_ROLE (roleid, rolename, roleinfo)
values (41, '��������Ա', ' ');
insert into HR_ROLE (roleid, rolename, roleinfo)
values (42, '��������Ա', ' ');
insert into HR_ROLE (roleid, rolename, roleinfo)
values (43, '��������Ա', null);
insert into HR_ROLE (roleid, rolename, roleinfo)
values (44, '��������Ա', ' ');
commit;
prompt 8 records loaded
prompt Loading HR_ROLE_FUNCTION...
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 1);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 2);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 3);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 4);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 5);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 6);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 7);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 8);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 9);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 10);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 11);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 12);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 13);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 14);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 15);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 16);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 17);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 18);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 19);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 20);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 21);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 22);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 23);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 24);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 25);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 26);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 27);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (1, 28);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 5);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 8);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 11);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 14);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 17);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 20);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 23);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 26);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 27);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (2, 28);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 4);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 7);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 10);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 13);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 16);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 19);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (3, 22);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (21, 4);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (21, 10);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (21, 13);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (41, 1);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (41, 2);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (41, 3);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (42, 1);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (42, 2);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (42, 3);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (43, 1);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (43, 2);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (43, 3);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (44, 1);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (44, 2);
insert into HR_ROLE_FUNCTION (roleid, funcid)
values (44, 3);
commit;
prompt 60 records loaded
prompt Loading HR_SALARY_HISTORY...
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5145, 10011006, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5146, 10011007, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5147, 10011008, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5148, 10011009, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5149, 10011010, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5150, 10011011, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5151, 10011012, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5152, 10011013, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5153, 10011014, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5154, 10011015, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5155, 10011016, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5156, 10011017, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5157, 10011018, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5158, 10011019, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5159, 10011020, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5160, 10011021, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5161, 10011022, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5162, 10011023, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5163, 10021002, '2014', '03', 7000, 400, 50, 0, 0, 0, 50, 0, -100, -100, -100, -50, -50, -50, 0, 0, 0, 0, 0, 0, 0, 465, 0, 0, 0, 0, 6585, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5164, 10021003, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 1);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5165, 10021004, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5166, 10021005, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5167, 10021006, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5168, 10021007, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5169, 10021008, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5170, 10021009, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5171, 10021010, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5172, 10021011, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5173, 10021012, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5174, 10021013, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5175, 10021014, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5176, 10021015, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5177, 10021016, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5178, 10021017, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5179, 10021018, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5180, 10021019, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5181, 10021020, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5182, 10031002, '2014', '03', 7000, 400, 50, 0, 0, 0, 50, 0, -100, -100, -100, -50, -50, -50, 0, 0, 0, 0, 0, 0, 0, 465, 0, 0, 0, 0, 6585, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5183, 10031003, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5184, 10031004, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5185, 10031005, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5186, 10031006, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5187, 10031007, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5188, 10031008, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5189, 10031009, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5190, 10031010, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5191, 10031011, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5192, 10031012, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5193, 10031013, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5194, 10031014, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5195, 10031015, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5196, 10031016, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5197, 10031017, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5198, 10031018, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5199, 10031019, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5200, 10031020, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5201, 10031021, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5202, 10041002, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5203, 10041003, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5210, 10041010, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5211, 10041011, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5212, 10041012, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5213, 10041013, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5235, 10051015, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5236, 10051016, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5237, 10051017, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5238, 10051018, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5239, 10051019, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5240, 10121, '2014', '03', 10000, 1000, 100, 0, 0, 0, 200, 0, -100, -200, -200, -100, -100, -100, 0, 0, 0, 0, 0, 0, 0, 805, 0, 0, 0, 0, 9695, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5141, 10011002, '2014', '03', 10000, 1000, 100, 0, 0, 0, 200, 0, -100, -200, -200, -100, -100, -100, 0, 0, 0, 0, 0, 0, 0, 805, 0, 0, 0, 0, 9695, 1);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5142, 10011003, '2014', '03', 3000, 300, 20, 0, 0, 0, 30, 0, -50, -30, -30, -20, -10, -10, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, 3110, 1);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5143, 10011004, '2014', '03', 3000, 300, 20, 0, 0, 0, 30, 0, -50, -30, -30, -20, -10, -10, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, 3110, 1);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5144, 10011005, '2014', '03', 3000, 300, 20, 0, 0, 0, 30, 0, -50, -30, -30, -20, -10, -10, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, 3110, 1);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5204, 10041004, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5205, 10041005, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5206, 10041006, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5207, 10041007, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5208, 10041008, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5209, 10041009, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5214, 10041014, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5215, 10041015, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5216, 10041016, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5217, 10041017, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5218, 10041018, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5219, 10041019, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5220, 10041020, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5221, 10041021, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5222, 10051002, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5223, 10051003, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5224, 10051004, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5225, 10051005, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5226, 10051006, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5227, 10051007, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5228, 10051008, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5229, 10051009, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5230, 10051010, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5231, 10051011, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5232, 10051012, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5233, 10051013, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
insert into HR_SALARY_HISTORY (id, empid, sayear, samonth, postwage, glgzwage, txfwage, gwfwage, nzjwage, qtjlwage, zcjtwage, bsjwage, sybxwage, ylwage, ylbxwage, gjjwage, zjbxwage, yljjwage, ccfwage, pujbwage, jqjbwage, cdwage, ztwage, kgwage, sjwage, taxwage, ylwage1, ylwage2, ylwage3, ylwage4, sjkewage, status)
values (5234, 10051014, '2014', '03', 8000, 500, 100, 0, 0, 0, 100, 0, -100, -100, -100, -100, -50, -50, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 7745, 0);
commit;
prompt 100 records loaded
prompt Loading HR_TAX...
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (1, 0, 1500, 3, 0);
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (2, 1500, 4500, 10, 105);
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (3, 4500, 9000, 20, 555);
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (4, 9000, 35000, 25, 1005);
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (5, 35000, 55000, 30, 2755);
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (6, 55000, 80000, 35, 5505);
insert into HR_TAX (id, low_limit, high_limit, tax_rate, cal_number)
values (7, 80000, 999999, 45, 13505);
commit;
prompt 7 records loaded
prompt Loading HR_TRANSFER...
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (105, 10011003, '�칫��', '��ͨԱ��', '�ƻ�����', '��ͨԱ��', '2014-03-19', null);
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (109, 10141, '�칫��', '��ͨԱ��', '������Դ��', '�ܾ���', '2014-03-19', null);
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (107, 10011002, '������Դ��', '�ܾ���', '�칫��', '�ܾ���', '2014-03-19', null);
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (108, 10011003, '�ƻ�����', '��ͨԱ��', '�칫��', '��ͨԱ��', '2014-03-19', null);
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (122, 10142, '�칫��', '��ͨԱ��', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (123, 10011024, '�칫��', '��ͨԱ��', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (124, 10011025, '�칫��', '��ͨԱ��', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (125, 10011026, '�칫��', '��Ŀ����', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (106, 10011002, '�칫��', '�ܾ���', '������Դ��', '�ܾ���', '2014-03-19', null);
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (121, 10141, '������Դ��', '�ܾ���', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (103, 10011006, '�칫��', '���ž���', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (104, 10011003, '�칫��', '��ͨԱ��', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (101, 10011005, '�칫��', '��ͨԱ��', null, null, '2014-03-19', '���');
insert into HR_TRANSFER (id, empid, dldept, dlpost, drdept, drpost, oprtime, reason)
values (102, 10011003, '�칫��', '��ͨԱ��', null, null, '2014-03-19', '���');
commit;
prompt 14 records loaded
prompt Loading HR_USEREDUCATION...
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (61, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (62, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (63, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (64, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (65, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (66, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (67, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (68, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (81, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (82, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (83, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (84, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (93, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (94, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (95, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (96, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (97, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (98, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (99, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (100, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (45, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (46, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (47, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (48, '1994-09-01', '1998-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (49, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (50, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (51, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (41, '0080-09-01', null, null, null, null, null, null, null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (42, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (43, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (44, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (52, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (53, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (54, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (55, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (56, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (85, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (86, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (87, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (88, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (89, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (90, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (91, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (92, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', null);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (101, '1985-09-01', '1991-06-01', '��ͷ��Сѧ', '��', '6', 'Сѧ', '����λ��У����ѧ�������ƺ�', 10011002);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (102, '1991-09-01', '1994-06-01', 'һ������ѧ', '��', '3', '����', 'ѧϰ�ɼ�����', 10011002);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (103, '1994-09-01', '1997-06-01', '��������', '���', '3', '����', '�ɼ�����', 10011002);
insert into HR_USEREDUCATION (id, admdate, gradate, school, major, years, degree, remark, empid)
values (104, '1997-09-01', '2001-06-01', '��ʦ��ѧ��', '��ľ����', '4', 'ѧʿ', '��ö�ι��Ҽ�����', 10011002);
commit;
prompt 48 records loaded
prompt Loading HR_USERFAMILY...
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (121, '����', 'ĸ��', '����', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (101, '����', 'ĸ��', '����', '��', null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (102, '����', '����', 'ѧУ', '��', null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (103, '����', 'ĸ��', '����', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (104, '����', '����', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (122, '����', '����', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (161, '����', 'ĸ��', 'ѧУ', null, 10011024);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (128, '����', 'ĸ��', '����', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (129, '����', '���', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (130, '����', '����', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (131, '����', 'ĸ��', '����', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (132, '����', '���', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (133, '����', '����', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (141, '����', 'ĸ��', '����', null, 10011002);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (142, '����', '���', 'ѧУ', null, 10011002);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (143, '����', '����', 'ѧУ', null, 10011002);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (123, '����', 'ĸ��', '����', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (124, '����', '����', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (125, '����', '���', 'ѧУ', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (126, '����', 'ĸ��', '����', null, null);
insert into HR_USERFAMILY (id, name, relation, unit, remark, empid)
values (127, '����', '����', 'ѧУ', null, null);
commit;
prompt 21 records loaded
prompt Loading HR_USERSKILL...
insert into HR_USERSKILL (id, item, details, empid)
values (40223, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40225, 'Ӣ��˼�', '397', 10011029);
insert into HR_USERSKILL (id, item, details, empid)
values (40121, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40122, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40123, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40124, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40125, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40126, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40127, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40128, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40129, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40130, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40131, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40132, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40133, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40134, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40135, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40136, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40137, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40138, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40139, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40140, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40165, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40166, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40167, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40168, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40169, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40170, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40172, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40173, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40174, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40175, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40161, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40162, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40163, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40164, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40141, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40142, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40143, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40144, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40145, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40146, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40147, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40148, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40176, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40177, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40178, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40179, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40180, 'Ӣ��˼�', '397', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40181, 'Ӣ������', '450', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40182, 'Ӣ���ļ�', '500', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40183, '������ȼ�����', '����', null);
insert into HR_USERSKILL (id, item, details, empid)
values (40171, 'Ӣ��˼�', '397', 10141);
insert into HR_USERSKILL (id, item, details, empid)
values (40221, 'Ӣ������', '450', 10011024);
insert into HR_USERSKILL (id, item, details, empid)
values (40222, 'Ӣ��˼�', '397', 10011024);
insert into HR_USERSKILL (id, item, details, empid)
values (40201, 'Ӣ������', '450', 10011002);
insert into HR_USERSKILL (id, item, details, empid)
values (40202, 'Ӣ���ļ�', '500', 10011002);
insert into HR_USERSKILL (id, item, details, empid)
values (40203, '������ȼ�����', '����', 10011002);
insert into HR_USERSKILL (id, item, details, empid)
values (40224, 'Ӣ��˼�', '397', 10011026);
commit;
prompt 59 records loaded
prompt Loading HR_USER_FUNCTION...
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 1);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 2);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 3);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 4);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 5);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 6);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 7);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 8);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 9);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 10);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 11);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 12);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 13);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 14);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 15);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 16);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 17);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 18);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 19);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 20);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 21);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 22);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 23);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 24);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 25);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 26);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 27);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011002, 28);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 1);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 2);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 3);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 4);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 5);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 6);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 7);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 8);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 9);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 10);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 11);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011005, 12);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011006, 27);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011006, 28);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011024, 26);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011024, 27);
insert into HR_USER_FUNCTION (empid, funcid)
values (10011024, 28);
commit;
prompt 45 records loaded
prompt Loading HR_USER_ROLE...
insert into HR_USER_ROLE (empid, roleid)
values (10011002, 1);
insert into HR_USER_ROLE (empid, roleid)
values (10011002, 2);
insert into HR_USER_ROLE (empid, roleid)
values (10011002, 3);
insert into HR_USER_ROLE (empid, roleid)
values (10011003, 2);
insert into HR_USER_ROLE (empid, roleid)
values (10011004, 3);
insert into HR_USER_ROLE (empid, roleid)
values (10011005, 3);
insert into HR_USER_ROLE (empid, roleid)
values (10011006, 3);
insert into HR_USER_ROLE (empid, roleid)
values (10011023, 3);
insert into HR_USER_ROLE (empid, roleid)
values (10011024, 3);
insert into HR_USER_ROLE (empid, roleid)
values (10011026, 2);
insert into HR_USER_ROLE (empid, roleid)
values (10011029, 3);
commit;
prompt 11 records loaded
prompt Enabling foreign key constraints for HR_ORGINFO...
alter table HR_ORGINFO enable constraint FKA227933D8A1FDBA7;
prompt Enabling foreign key constraints for HR_USER...
alter table HR_USER enable constraint FK7210A9E05438079F;
alter table HR_USER enable constraint FK7210A9E0DFBB044C;
prompt Enabling foreign key constraints for HR_CH_MONTH...
alter table HR_CH_MONTH enable constraint FKDC6BA99B846175E9;
prompt Enabling foreign key constraints for HR_LEAVEAPPLY...
alter table HR_LEAVEAPPLY enable constraint FKE7DADD6C846175E9;
prompt Enabling foreign key constraints for HR_POSITION_SALARY...
alter table HR_POSITION_SALARY enable constraint FKEFCFEC6B5438079F;
prompt Enabling foreign key constraints for HR_ROLE_FUNCTION...
alter table HR_ROLE_FUNCTION enable constraint FK6271830C6426688F;
alter table HR_ROLE_FUNCTION enable constraint FK6271830CAB3DDA5F;
prompt Enabling foreign key constraints for HR_SALARY_HISTORY...
alter table HR_SALARY_HISTORY enable constraint FKE3D35AD4846175E9;
prompt Enabling foreign key constraints for HR_TRANSFER...
alter table HR_TRANSFER enable constraint FKA03C5B80846175E9;
prompt Enabling foreign key constraints for HR_USEREDUCATION...
alter table HR_USEREDUCATION enable constraint FKB0A3E9A8846175E9;
prompt Enabling foreign key constraints for HR_USERFAMILY...
alter table HR_USERFAMILY enable constraint FK67CD1144846175E9;
prompt Enabling foreign key constraints for HR_USERSKILL...
alter table HR_USERSKILL enable constraint FK3DE35451846175E9;
prompt Enabling foreign key constraints for HR_USER_FUNCTION...
alter table HR_USER_FUNCTION enable constraint FK776F7B776426688F;
alter table HR_USER_FUNCTION enable constraint FK776F7B77E82A8186;
prompt Enabling foreign key constraints for HR_USER_ROLE...
alter table HR_USER_ROLE enable constraint FK3E8FB375AB3DDA5F;
alter table HR_USER_ROLE enable constraint FK3E8FB375E82A8186;
prompt Enabling triggers for HR_CH_DAILY...
alter table HR_CH_DAILY enable all triggers;
prompt Enabling triggers for HR_CH_DIC...
alter table HR_CH_DIC enable all triggers;
prompt Enabling triggers for HR_ORGINFO...
alter table HR_ORGINFO enable all triggers;
prompt Enabling triggers for HR_POSITION...
alter table HR_POSITION enable all triggers;
prompt Enabling triggers for HR_USER...
alter table HR_USER enable all triggers;
prompt Enabling triggers for HR_CH_MONTH...
alter table HR_CH_MONTH enable all triggers;
prompt Enabling triggers for HR_FUNCTION...
alter table HR_FUNCTION enable all triggers;
prompt Enabling triggers for HR_LEAVEAPPLY...
alter table HR_LEAVEAPPLY enable all triggers;
prompt Enabling triggers for HR_POSITION_SALARY...
alter table HR_POSITION_SALARY enable all triggers;
prompt Enabling triggers for HR_ROLE...
alter table HR_ROLE enable all triggers;
prompt Enabling triggers for HR_ROLE_FUNCTION...
alter table HR_ROLE_FUNCTION enable all triggers;
prompt Enabling triggers for HR_SALARY_HISTORY...
alter table HR_SALARY_HISTORY enable all triggers;
prompt Enabling triggers for HR_TAX...
alter table HR_TAX enable all triggers;
prompt Enabling triggers for HR_TRANSFER...
alter table HR_TRANSFER enable all triggers;
prompt Enabling triggers for HR_USEREDUCATION...
alter table HR_USEREDUCATION enable all triggers;
prompt Enabling triggers for HR_USERFAMILY...
alter table HR_USERFAMILY enable all triggers;
prompt Enabling triggers for HR_USERSKILL...
alter table HR_USERSKILL enable all triggers;
prompt Enabling triggers for HR_USER_FUNCTION...
alter table HR_USER_FUNCTION enable all triggers;
prompt Enabling triggers for HR_USER_ROLE...
alter table HR_USER_ROLE enable all triggers;
set feedback on
set define on
prompt Done.

