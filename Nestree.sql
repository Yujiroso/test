CREATE DATABASE IF NOT EXISTS 'nestree';

--Table  'nestree'.'emp' // ユーザー
CREATE TABLE IF NOT EXISTS 'nestree'.'emp'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ユーザー';

--Table  'nestree'.'emp_details' // ユーザー詳細
CREATE TABLE IF NOT EXISTS 'nestree'.'emp_details'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ユーザー詳細';

--Table  'nestree'.'bank' // 口座情報
CREATE TABLE IF NOT EXISTS 'nestree'.'bank'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='口座情報';

--変更予定
--Table  'nestree'.'emp_info' // 社内情報
CREATE TABLE IF NOT EXISTS 'nestree'.'emp_info'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='社内情報';

--Table  'nestree'.'news' // ニュース
CREATE TABLE IF NOT EXISTS 'nestree'.'news'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ニュース';

--Table  'nestree'.'news_details' // ニュース詳細
CREATE TABLE IF NOT EXISTS 'nestree'.'news_details'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ニュース詳細';

--Table  'nestree'.'daily_report' // 日報
CREATE TABLE IF NOT EXISTS 'nestree'.'deily_report'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='日報';

--Table  'nestree'.'monthly_report' // 月報
CREATE TABLE IF NOT EXISTS 'nestree'.'monthly_report'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='月報';

--Table  'nestree'.'skillup' // スキルアップ
CREATE TABLE IF NOT EXISTS 'nestree'.'skillup'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='スキルアップ';

--Table  'nestree'.'timesheet' // 勤怠
CREATE TABLE IF NOT EXISTS 'nestree'.'timesheet'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='勤怠';

--Table  'nestree'.'share_info' // 資料共有
CREATE TABLE IF NOT EXISTS 'nestree'.'share_info'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='資料共有';

--Table  'nestree'.'salary' // 給与明細
CREATE TABLE IF NOT EXISTS 'nestree'.'salary'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='給与明細';

--Table  'nestree'.'safety_check' // 安全確認
CREATE TABLE IF NOT EXISTS 'nestree'.'safety_check'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='安全確認';

--Table  'nestree'.'point_his' // ポイント履歴
CREATE TABLE IF NOT EXISTS 'nestree'.'point_his'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ポイント履歴';

--Table  'nestree'.'magnification_his' // 倍率変更履歴
CREATE TABLE IF NOT EXISTS 'nestree'.'magnification_his'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='倍率変更履歴';

--Table  'nestree'.'session' // セッションID
CREATE TABLE IF NOT EXISTS 'nestree'.'session'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='セッションID';

--Table  'nestree'.'onetime' // ワンタイムキー認証
CREATE TABLE IF NOT EXISTS 'nestree'.'onetime'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ワンタイムキー認証';

--Table  'nestree'.'admin' // 管理者ユーザー
CREATE TABLE IF NOT EXISTS 'nestree'.'admin'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='管理者ユーザー';
