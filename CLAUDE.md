# 兼职在岗打卡系统

## 项目概述
基于 Supabase + 纯静态 HTML/CSS/JS 的打卡系统，用于门店员工扫码签到/签退管理。

## 文件结构
- `index.html` — 员工扫码打卡页面（手机端）
- `admin.html` — 管理后台（PC 端）
- `location.html` — 门店 GPS 坐标采集页（手机端）
- `css/style.css` — 统一样式（CSS 变量设计）
- `js/config.js` — Supabase 配置
- `js/supabase.min.js` — Supabase SDK
- `js/qrcode.min.js` — QR 二维码生成
- `js/html5-qrcode.min.js` — 摄像头扫码
- `js/xlsx.full.min.js` — Excel 解析
- `setup.sql` — 数据库建表脚本

## 数据库（Supabase）
- URL: https://ciaddvqgcvpunemxoqmf.supabase.co
- anonKey 见 js/config.js
- 5 张表：store, roster, check_record, admin_user, app_config

## 核心功能
1. 手机号登录识别身份
2. GPS 定位验证（500米范围）
3. 每日动态二维码（密钥+日期 hash）
4. 到岗签到 + 离岗签退（每次必须独立扫码）
5. 隔天凌晨截止时间自动过期（每个门店可独立设置）
6. 每日打卡次数限制（默认3次）
7. 内置扫码器（签到签退后一键扫码）
8. 管理后台：考勤记录/花名册/门店管理/第三方管理/二维码/Excel批量导入/CSV导出
9. 门店管理员独立账号体系
10. 第三方服务费统计
11. 手动补离岗时间（支持日期+时间）

## 部署方式
- GitHub Pages: https://lingdianwu.github.io/checkin/
- Gitee 镜像: https://gitee.com/jia-xuzhao/checkin.git
- 正在配置：腾讯云 COS + 自定义域名

## 当前待办
- [ ] 域名审核通过后绑定 COS
- [ ] push 到 GitHub（本机需开代理）
- [ ] Gitee Pages 已下线，不考虑

## 本地测试
```
npx http-server . -p 8080 -c-1 --cors
```
手机同 WiFi 访问 http://电脑IP:8080/index.html?store=tianjin

## 管理后台密码
超级管理员：密码：初始密码
门店管理员：在后台门店管理中添加
