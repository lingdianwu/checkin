-- ============================================
-- Supabase 建表脚本
-- 在 Supabase 控制台 → SQL Editor 中粘贴执行
-- ============================================

-- 1. 门店表
CREATE TABLE IF NOT EXISTS store (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  store_id TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  lat FLOAT,
  lng FLOAT,
  daily_code TEXT,
  daily_code_time TIMESTAMPTZ
);

-- 2. 花名册表
CREATE TABLE IF NOT EXISTS roster (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  store_id TEXT NOT NULL,
  name TEXT NOT NULL,
  phone TEXT
);

-- 3. 打卡记录表
CREATE TABLE IF NOT EXISTS check_record (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  store_id TEXT NOT NULL,
  name TEXT NOT NULL,
  check_in TIMESTAMPTZ NOT NULL,
  check_out TIMESTAMPTZ,
  date TEXT NOT NULL
);

-- 4. 应用配置表
CREATE TABLE IF NOT EXISTS app_config (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admin_password TEXT NOT NULL,
  daily_secret TEXT
);

-- ============================================
-- 启动 RLS（行级安全）并开放权限
-- 本系统为内部使用，开放全部操作权限
-- ============================================
ALTER TABLE store ENABLE ROW LEVEL SECURITY;
ALTER TABLE roster ENABLE ROW LEVEL SECURITY;
ALTER TABLE check_record ENABLE ROW LEVEL SECURITY;
ALTER TABLE app_config ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_all" ON store FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON roster FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON check_record FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON app_config FOR ALL USING (true) WITH CHECK (true);

-- ============================================
-- 初始门店数据（根据实际情况修改）
-- ============================================
INSERT INTO store (store_id, name) VALUES
  ('tianjin', '天津门店'),
  ('nanjing', '南京门店'),
  ('xian', '西安门店');
