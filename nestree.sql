BEGIN;
CREATE DATABASE IF NOT EXISTS nestree;

-- Table  'nestree'.'emp' // ユーザー
CREATE TABLE IF NOT EXISTS nestree.emp(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    status TINYINT(1) NOT NULL,
    datetime_created DATETIME NOT NULL,
    datetime_updated DATETIME NOT NULL,
    del_flg TINYINT(1) NOT NULL,
    PRIMARY KEY (id),
    INDEX idx_id (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ユーザー';

-- Table  'nestree'.'emp_details' // ユーザー詳細
CREATE TABLE IF NOT EXISTS nestree.emp_details(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    first_name_kanji VARCHAR(8) NOT NULL DEFAULT '',
    first_name_romaji VARCHAR(16) NOT NULL DEFAULT '',
    family_name_kanji VARCHAR(8) NOT NULL DEFAULT '',
    family_name_romaji VARCHAR(16) NOT NULL DEFAULT '',
    gender TINYINT(1) NOT NULL,
    birthday DATE NOT NULL,
    nationality VARCHAR(16) NOT NULL DEFAULT '',
    final_education VARCHAR(16) NOT NULL,
    hometown VARCHAR(16) DEFAULT '',
    address VARCHAR(255) DEFAULT '',
    mail VARCHAR(255) DEFAULT '',
    phone VARCHAR(11) DEFAULT '',
    phone_emergency VARCHAR(11) DEFAULT '',
    line_account VARCHAR(255) NOT NULL DEFAULT '',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    KEY idx_emp_id (emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ユーザー詳細';

-- Table  'nestree'.'bank' // 口座情報
CREATE TABLE IF NOT EXISTS nestree.bank(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    name VARCHAR(16) NOT NULL DEFAULT '',
    branch_code VARCHAR(3) NOT NULL DEFAULT '',
    branch_name VARCHAR(16) NOT NULL DEFAULT '',
    account_name VARCHAR(16) NOT NULL DEFAULT '',
    account_type VARCHAR(16) NOT NULL DEFAULT '',
    account_number VARCHAR(7) NOT NULL DEFAULT '',
    column_reserved TEXT,
    detetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX idx_emp_id (emp_id)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='口座情報';

-- Table  'nestree'.'emp_info' // 社内情報
CREATE TABLE IF NOT EXISTS nestree.emp_info(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    type_emp TINYINT(1) NOT NULL,
    type_dep TINYINT(1) NOT NULL,
    type_work TINYINT(1) NOT NULL,
    date_hired DATE NOT NULL,
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX idx_emp_id (emp_id)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='社内情報';

-- Table  'nestree'.'news' // ニュース
CREATE TABLE IF NOT EXISTS nestree.news(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    all_id INT NOT NULL,
    emp_id INT NOT NULL,
    new TINYINT(1) NOT NULL,
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX idx_emp_id (emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ニュース';

-- Table  'nestree'.'news_all' // ニュース一覧
CREATE TABLE IF NOT EXISTS nestree.news_all(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    type TINYINT(1) NOT NULL,
    title VARCHAR(64) NOT NULL DEFAULT '',
    content VARCHAR(255) NOT NULL DEFAULT '',
    pic_data VARCHAR(255) NOT NULL DEFAULT '',
    date_added DATE NOT NULL,
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ニュース一覧';

-- Table  'nestree'.'daily_report' // 日報
CREATE TABLE IF NOT EXISTS nestree.daily_report(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    content VARCHAR(255) NOT NULL DEFAULT '',
    status TINYINT NOT NULL DEFAULT 0,
    work_hour INT NOT NULL,
    work_start DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    work_end DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    break_time INT NOT NULL,
    datetime_added DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id, datetime_added) USING BTREE,
    INDEX idx_emp_id (emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='日報';

-- 日報テーブルパーティション化 //月ごと
ALTER TABLE nestree.daily_report
    Partition BY RANGE (YEAR(datetime_added)*100 + MONTH(datetime_added))
    (
    Partition p202001 VALUES LESS THAN (202002),
    Partition p202002 VALUES LESS THAN (202003),
    Partition p202003 VALUES LESS THAN (202004),
    Partition p202004 VALUES LESS THAN (202005),
    Partition p202005 VALUES LESS THAN (202006),
    Partition p202006 VALUES LESS THAN (202007),
    Partition p202007 VALUES LESS THAN (202008),
    Partition p202008 VALUES LESS THAN (202009),
    Partition p202009 VALUES LESS THAN (202010),
    Partition p202010 VALUES LESS THAN (202011),
    Partition p202011 VALUES LESS THAN (202012),
    Partition p202012 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202102),
    Partition p202102 VALUES LESS THAN (202103),
    Partition p202103 VALUES LESS THAN (202104),
    Partition p202104 VALUES LESS THAN (202105),
    Partition p202105 VALUES LESS THAN (202106),
    Partition p202106 VALUES LESS THAN (202107),
    Partition p202107 VALUES LESS THAN (202108),
    Partition p202108 VALUES LESS THAN (202109),
    Partition p202109 VALUES LESS THAN (202110),
    Partition p202110 VALUES LESS THAN (202111),
    Partition p202111 VALUES LESS THAN (202112),
    Partition p202112 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202202),
    Partition p202202 VALUES LESS THAN (202203),
    Partition p202203 VALUES LESS THAN (202204),
    Partition p202204 VALUES LESS THAN (202205),
    Partition p202205 VALUES LESS THAN (202206),
    Partition p202206 VALUES LESS THAN (202207),
    Partition p202207 VALUES LESS THAN (202208),
    Partition p202208 VALUES LESS THAN (202209),
    Partition p202209 VALUES LESS THAN (202210),
    Partition p202210 VALUES LESS THAN (202211),
    Partition p202211 VALUES LESS THAN (202212),
    Partition p202212 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202302),
    Partition p202302 VALUES LESS THAN (202303),
    Partition p202303 VALUES LESS THAN (202304),
    Partition p202304 VALUES LESS THAN (202305),
    Partition p202305 VALUES LESS THAN (202306),
    Partition p202306 VALUES LESS THAN (202307),
    Partition p202307 VALUES LESS THAN (202308),
    Partition p202308 VALUES LESS THAN (202309),
    Partition p202309 VALUES LESS THAN (202310),
    Partition p202310 VALUES LESS THAN (202311),
    Partition p202311 VALUES LESS THAN (202312),
    Partition p202312 VALUES LESS THAN (202401),
    Partition p202401 VALUES LESS THAN (202501),
    Partition p202402 VALUES LESS THAN (202502),
    Partition p202403 VALUES LESS THAN (202503),
    Partition p202404 VALUES LESS THAN (202504),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

-- Table  'nestree'.'monthly_report' // 月報
CREATE TABLE IF NOT EXISTS nestree.monthly_report(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    approved TINYINT(1) DEFAULT FALSE,
    month_period DATE,
    hour_total INT NOT NULL,
    hour_extra INT NOT NULL,
    hour_fixed INT NOT NULL,
    text TEXT,
    timesheet VARCHAR(255) NOT NULL DEFAULT '',
    date_added DATE NOT NULL,
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id, date_added),
    INDEX idx_emp_id(emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='月報';

-- 月報テーブルパーティション化 //年ごと
ALTER TABLE nestree.monthly_report
    Partition BY RANGE (YEAR(date_added)*100 + MONTH(date_added))
    (
    Partition p201701 VALUES LESS THAN (201801),
    Partition p201801 VALUES LESS THAN (201901),
    Partition p201901 VALUES LESS THAN (202001),
    Partition p202001 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202401),
    Partition p202401 VALUES LESS THAN (202501),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

-- Table  'nestree'.'expense_report' // 経費申請
CREATE TABLE IF NOT EXISTS nestree.expense_report(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    approved TINYINT(1) DEFAULT FALSE,
    type TINYINT(1) NOT NULL,
    price INT NOT NULL,
    content VARCHAR(128) DEFAULT '',
    file_data VARCHAR(255) DEFAULT '',
    monthly DATE NOT NULL,
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id, monthly),
    INDEX idx_emp_id(emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='経費申請';

-- 経費申請テーブルパーティション化 //年ごと
ALTER TABLE nestree.expense_report
    Partition BY RANGE (YEAR(monthly)*100 + MONTH(monthly))
    (
    Partition p201701 VALUES LESS THAN (201801),
    Partition p201801 VALUES LESS THAN (201901),
    Partition p201901 VALUES LESS THAN (202001),
    Partition p202001 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202401),
    Partition p202401 VALUES LESS THAN (202501),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

-- Table  'nestree'.'skillup' // スキルアップ
CREATE TABLE IF NOT EXISTS nestree.skillup(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(64) NOT NULL DEFAULT '',
    memo VARCHAR(64) NOT NULL DEFAULT '',
    data_file VARCHAR(255) NOT NULL DEFAULT '',
    date_uploaded DATE NOT NULL,
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='スキルアップ';

-- Table  'nestree'.'share_info' // 資料共有
CREATE TABLE IF NOT EXISTS nestree.share_info(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(64) NOT NULL DEFAULT '',
    memo VARCHAR(64) NOT NULL DEFAULT '',
    data_file VARCHAR(255) NOT NULL DEFAULT '',
    date_uploaded DATE NOT NULL,
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='資料共有';

-- Table  'nestree'.'salary' // 給与明細
CREATE TABLE IF NOT EXISTS nestree.salary(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    approved TINYINT(1) NOT NULL DEFAULT FALSE,
    type TINYINT(1) NOT NULL,
    monthly DATE NOT NULL,
    transfer_day DATE NOT NULL,
    data_file VARCHAR(255) DEFAULT '',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    PRIMARY KEY (id, monthly),
    INDEX idx_emp_id(emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='給与明細';

-- 給与明細テーブルパーティション化 //年ごと
ALTER TABLE nestree.salary
    Partition BY RANGE (YEAR(monthly)*100 + MONTH(monthly))
    (
    Partition p201701 VALUES LESS THAN (201801),
    Partition p201801 VALUES LESS THAN (201901),
    Partition p201901 VALUES LESS THAN (202001),
    Partition p202001 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202401),
    Partition p202401 VALUES LESS THAN (202501),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

-- Table  'nestree'.'safety_check' // 安全確認
CREATE TABLE IF NOT EXISTS nestree.safety_check(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    emergency_type TINYINT(1) NOT NULL DEFAULT FALSE,
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    INDEX idx_emp_id(emp_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='安全確認';

-- Table  'nestree'.'point' // ポイント
CREATE TABLE IF NOT EXISTS nestree.point(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    type INT NOT NULL,
    increased INT NOT NULL,
    decreased INT NOT NULL,
    date_added DATETIME NOT NULL,
    datetime_update DATETIME NOT NULL,
    del_flg TINYINT NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id, date_added) USING BTREE,
    INDEX idx_emp_id (emp_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ポイント';

-- ポイント履歴テーブルパーティション化 //月ごと
ALTER TABLE nestree.point
    Partition BY RANGE (YEAR(date_added)*100 + MONTH(date_added))
    (
    Partition p202001 VALUES LESS THAN (202002),
    Partition p202002 VALUES LESS THAN (202003),
    Partition p202003 VALUES LESS THAN (202004),
    Partition p202004 VALUES LESS THAN (202005),
    Partition p202005 VALUES LESS THAN (202006),
    Partition p202006 VALUES LESS THAN (202007),
    Partition p202007 VALUES LESS THAN (202008),
    Partition p202008 VALUES LESS THAN (202009),
    Partition p202009 VALUES LESS THAN (202010),
    Partition p202010 VALUES LESS THAN (202011),
    Partition p202011 VALUES LESS THAN (202012),
    Partition p202012 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202102),
    Partition p202102 VALUES LESS THAN (202103),
    Partition p202103 VALUES LESS THAN (202104),
    Partition p202104 VALUES LESS THAN (202105),
    Partition p202105 VALUES LESS THAN (202106),
    Partition p202106 VALUES LESS THAN (202107),
    Partition p202107 VALUES LESS THAN (202108),
    Partition p202108 VALUES LESS THAN (202109),
    Partition p202109 VALUES LESS THAN (202110),
    Partition p202110 VALUES LESS THAN (202111),
    Partition p202111 VALUES LESS THAN (202112),
    Partition p202112 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202202),
    Partition p202202 VALUES LESS THAN (202203),
    Partition p202203 VALUES LESS THAN (202204),
    Partition p202204 VALUES LESS THAN (202205),
    Partition p202205 VALUES LESS THAN (202206),
    Partition p202206 VALUES LESS THAN (202207),
    Partition p202207 VALUES LESS THAN (202208),
    Partition p202208 VALUES LESS THAN (202209),
    Partition p202209 VALUES LESS THAN (202210),
    Partition p202210 VALUES LESS THAN (202211),
    Partition p202211 VALUES LESS THAN (202212),
    Partition p202212 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202302),
    Partition p202302 VALUES LESS THAN (202303),
    Partition p202303 VALUES LESS THAN (202304),
    Partition p202304 VALUES LESS THAN (202305),
    Partition p202305 VALUES LESS THAN (202306),
    Partition p202306 VALUES LESS THAN (202307),
    Partition p202307 VALUES LESS THAN (202308),
    Partition p202308 VALUES LESS THAN (202309),
    Partition p202309 VALUES LESS THAN (202310),
    Partition p202310 VALUES LESS THAN (202311),
    Partition p202311 VALUES LESS THAN (202312),
    Partition p202312 VALUES LESS THAN (202401),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

-- Table  'nestree'.'rate' // 倍率
CREATE TABLE IF NOT EXISTS nestree.rate(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    type INT NOT NULL,
    rate FLOAT NOT NULL,
    date_added DATETIME NOT NULL,
    datetime_update DATETIME NOT NULL,
    del_flg TINYINT NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id, date_added) USING BTREE,
    INDEX idx_emp_id (emp_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='倍率';

-- 倍率テーブルパーティション化 //年ごと
ALTER TABLE nestree.rate
    Partition BY RANGE (YEAR(date_added)*100 + MONTH(date_added))
    (
    Partition p201701 VALUES LESS THAN (201801),
    Partition p201801 VALUES LESS THAN (201901),
    Partition p201901 VALUES LESS THAN (202001),
    Partition p202001 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202401),
    Partition p202401 VALUES LESS THAN (202501),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

-- Table  'nestree'.'session' // セッションID
CREATE TABLE IF NOT EXISTS nestree.session(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    session_id VARCHAR(255) NOT NULL DEFAULT '',
    note VARCHAR(255) NOT NULL DEFAULT '',
    datetime_expired DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64),
    del_flg TINYINT NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='セッションID';

-- Table  'nestree'.'onetime' // ワンタイムキー認証
CREATE TABLE IF NOT EXISTS nestree.onetime(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    status TINYINT(1) NOT NULL,
    token VARCHAR(64) NOT NULL,
    mail VARCHAR(64) NOT NULL,
    text TEXT,
    datetime_expired DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    del_flg TINYINT NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ワンタイムキー認証';

-- Table  'nestree'.'admin' // 管理者ユーザー
CREATE TABLE IF NOT EXISTS nestree.admin(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    login_name VARCHAR(64) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    status TINYINT(1) NOT NULL,
    password VARCHAR(64) NOT NULL DEFAULT '',
    show_name VARCHAR(64) NOT NULL DEFAULT '',
    mail VARCHAR(64) NOT NULL DEFAULT '',
    role INT NOT NULL,
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    note VARCHAR(255) DEFAULT '',
    del_flg TINYINT NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='管理者ユーザー';

-- Table  'nestree'.'evaluation' // 360評価
CREATE TABLE IF NOT EXISTS nestree.evaluation(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    external_id INT NOT NULL,
    internal_id INT NOT NULL,
    mencare_id INT NOT NULL,
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX evaluation_idx1 (emp_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='360評価';

-- Table  'nestree'.'evaluation_external' // 社外評価
CREATE TABLE IF NOT EXISTS nestree.evaluation_external(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    project_id INT NOT NULL DEFAULT '',
    text TEXT NOT NULL,
    data_file VARCHAR(255) DEFAULT '',
    score INT NOT NULL,
    memo VARCHAR(64) NOT NULL DEFAULT '',
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX evaluation_external_idx1 (emp_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='360評価';

-- Table  'nestree'.'evaluation_internal' // 社内評価
CREATE TABLE IF NOT EXISTS nestree.evaluation_internal(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    manager_id INT NOT NULL,
    text TEXT NOT NULL,
    data_file VARCHAR(255) DEFAULT '',
    score INT NOT NULL,
    memo VARCHAR(64) NOT NULL DEFAULT '',
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX evaluation_internal_idx1 (emp_id) USING BTREE
    INDEX evaluation_internal_idx2 (manager_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='社内評価';

-- Table  'nestree'.'evaluation_mencare' // メンケア
CREATE TABLE IF NOT EXISTS nestree.evaluation_mencare(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    mentor_id INT NOT NULL,
    motivation INT NOT NULL,
    motivation_comment VARCHAR(255) DEFAULT '',
    responsibility INT NOT NULL,
    responsibility_comment VARCHAR(255) DEFAULT '',
    communication INT NOT NULL,
    communication_comment VARCHAR(255) DEFAULT '',
    score INT NOT NULL,
    memo VARCHAR(64) NOT NULL DEFAULT '',
    datetime_created DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    datetime_updated DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
    uuid VARCHAR(64) NOT NULL DEFAULT '',
    del_flg TINYINT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    INDEX evaluation_mencare_idx1 (emp_id) USING BTREE
    INDEX evaluation_mencare_idx2 (mentor_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='メンケア';
