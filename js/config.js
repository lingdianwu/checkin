// ============================================
// Supabase 配置
// ============================================
var SUPABASE_CONFIG = {
  url: 'https://ciaddvqgcvpunemxoqmf.supabase.co',
  anonKey: 'sb_publishable_l2RM-Kf61YzSI65npYcnWg_ITK5Yf1U'
};

var db = supabase.createClient(
  SUPABASE_CONFIG.url,
  SUPABASE_CONFIG.anonKey
);
