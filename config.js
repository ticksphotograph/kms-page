/* ============================================================
   内网 KMS 激活页 · 配置文件
   ------------------------------------------------------------
   ★ 所有内容都在这个文件里，index.html 不用动。
   ★ 改完保存，刷新网页即生效。
   ★ 本文件必须和 index.html 放在同一个目录。

   怎么新增一个产品？
     找到对应的 versions 块，在 products 数组里加一行：
       { id: 'xxx', name: '显示名', desc: '副标题', key: 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX' },
     id 随便起但不要和别的重复，key 就是这个版本的密钥。

   怎么新增一个版本（比如 Windows 10 LTSC 2021）？
     在 versions 数组里加一块：
       { id: 'ltsc2021', name: 'LTSC 2021', file: 'WindowsLTSC', products: [ ... ] },
     file 是下载的 bat 文件名前缀，建议简短。

   怎么新增一个大类（比如 Office 2024）？
     在 catalog 里加一块，kind 用 'office'（走 ospp 命令）或 'win'（走 slmgr 命令）。
   ============================================================ */

/* ------------------------------------------------------------
   Office 的 ospp.vbs 必须在 Office16 目录里执行，但安装路径有 4 种可能
   （64/32 位 × 即点即用 root\Office16 / MSI 版 Office16）。
   下面按顺序判断哪个目录里真的有 ospp.vbs，再切过去，
   比写死一条路径可靠——找不到的那几条会被 if exist 直接跳过。
   这段被 index.html 的 Office 命令模板复用，改一处就够。
   ------------------------------------------------------------ */
var OFFICE_DIRS = [
  'C:\\Program Files\\Microsoft Office\\root\\Office16',
  'C:\\Program Files (x86)\\Microsoft Office\\root\\Office16',
  'C:\\Program Files\\Microsoft Office\\Office16',
  'C:\\Program Files (x86)\\Microsoft Office\\Office16'
];
var OFFICE_CD = OFFICE_DIRS.map(function (d) {
  return 'if exist "' + d + '\\ospp.vbs" pushd "' + d + '"';
}).join('\n');

window.KMS_CONFIG = {

  /* ------------------------------------------------------------
     ① KMS 服务器地址
     填主机名或 IP，不要带 http:// 和结尾斜杠。
     端口是默认 1688 就不用写；改过端口才写成 'kms.org.cn:1689'。
     ------------------------------------------------------------ */
  host: 'kms.org.cn',


  /* ------------------------------------------------------------
     ② 产品目录
     kind: 'win' 走 slmgr.vbs 命令，'office' 走 ospp.vbs 命令。
     ------------------------------------------------------------ */
  catalog: [

    /* ======================= Windows ======================= */
    {
      id: 'windows',
      name: 'Windows',
      kind: 'win',
      versions: [

        {
          id: 'win-client',
          name: 'Windows 11 / 10',
          file: 'Windows',
          products: [
            { id: 'win-pro',              name: '专业版',       desc: 'Pro，最常见',           key: 'W269N-WFGWX-YVC9B-4J6C9-T83GX' },
            { id: 'win-pro-n',            name: '专业版 N',     desc: '不含媒体功能',          key: 'MH37W-N47XK-V7XM9-C7227-GCQG9' },
            { id: 'win-proworkstation',   name: '专业工作站版', desc: 'Pro for Workstations',  key: 'NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J' },
            { id: 'win-proworkstation-n', name: '专业工作站版 N', desc: '不含媒体功能',        key: '9FNHH-K3HBT-3W4TD-6383H-6XYWF' },
            { id: 'win-proedu',           name: '专业教育版',   desc: 'Pro Education',         key: '6TP4R-GNPTD-KYYHQ-7B7DP-J447Y' },
            { id: 'win-proedu-n',         name: '专业教育版 N', desc: '不含媒体功能',          key: 'YVWGF-BXNMC-HTQYQ-CPQ99-66QFC' },
            { id: 'win-edu',              name: '教育版',       desc: 'Education',             key: 'NW6C2-QMPVW-D7KKK-3GKT6-VCFB2' },
            { id: 'win-edu-n',            name: '教育版 N',     desc: '不含媒体功能',          key: '2WH4N-8QGBV-H22JP-CT43Q-MDWWJ' },
            { id: 'win-ent',              name: '企业版',       desc: 'Enterprise',            key: 'NPPR9-FWDCX-D2C8J-H872K-2YT43' },
            { id: 'win-ent-n',            name: '企业版 N',     desc: '不含媒体功能',          key: 'DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4' },
          ]
        },

        {
          id: 'win-ltsc',
          name: 'Windows 10 LTSC / LTSB',
          file: 'WindowsLTSC',
          products: [
            { id: 'ltsc2019', name: 'Enterprise LTSC 2019', desc: '长期服务版', key: 'M7XTQ-FN8P6-TTKYV-9D4CC-J462D' },
            { id: 'ltsb2016', name: 'Enterprise LTSB 2016', desc: '长期服务版', key: 'DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ' },
            { id: 'ltsb2015', name: 'Enterprise LTSB 2015', desc: '长期服务版', key: 'WNMTR-4C88C-JK8YV-HQ7T2-76DF9' },
          ]
        },

        {
          id: 'server',
          name: 'Windows Server',
          file: 'WindowsServer',
          products: [
            { id: 'srv2025-std',   name: 'Server 2025 标准版',            desc: 'Standard',      key: 'TVRH6-WHNXV-R9WG3-9XRFY-MY832' },
            { id: 'srv2025-dc',    name: 'Server 2025 数据中心版',        desc: 'Datacenter',    key: 'D764K-2NDRG-47T6Q-P8T8W-YP6DF' },
            { id: 'srv2025-azure', name: 'Server 2025 Datacenter Azure', desc: 'Azure Edition', key: 'XGN3F-F394H-FD2MY-PP6FD-8MCRC' },
            { id: 'srv2022-std',   name: 'Server 2022 标准版',            desc: 'Standard',      key: 'VDYBN-27WPP-V4HQT-9VMD4-VMK7H' },
            { id: 'srv2022-dc',    name: 'Server 2022 数据中心版',        desc: 'Datacenter',    key: 'WX4NM-KYWYW-QJJR4-XV3QB-6VM33' },
            { id: 'srv2019-std',   name: 'Server 2019 标准版',            desc: 'Standard',      key: 'N69G4-B89J2-4G8F4-WWYCC-J464C' },
            { id: 'srv2019-dc',    name: 'Server 2019 数据中心版',        desc: 'Datacenter',    key: 'WMDGN-G9PQG-XVVXX-R3X43-63DFG' },
          ]
        },

        {
          id: 'win-check',
          name: '激活状态与排查',
          file: 'Windows',
          products: [
            {
              id: 'win-dlv', name: '查看详细激活信息', desc: '版本、KMS 主机、剩余时间',
              tpl: 'cscript //nologo C:\\Windows\\System32\\slmgr.vbs /skms {h}\ncscript //nologo C:\\Windows\\System32\\slmgr.vbs /ato\ncscript //nologo C:\\Windows\\System32\\slmgr.vbs /dlv',
              note: '看输出里的「许可证状态」和「剩余时间」，能看到 KMS 主机名说明连上了。'
            },
            {
              id: 'win-ckms', name: '清除 KMS 设置后重激活', desc: '换了 KMS 主机时用',
              tpl: 'cscript //nologo C:\\Windows\\System32\\slmgr.vbs /ckms\ncscript //nologo C:\\Windows\\System32\\slmgr.vbs /skms {h}\ncscript //nologo C:\\Windows\\System32\\slmgr.vbs /ato\ncscript //nologo C:\\Windows\\System32\\slmgr.vbs /xpr',
              note: '/ckms 只是清掉本机记录的 KMS 主机名，不会卸载密钥，可以放心执行。'
            }
          ]
        }

      ]
    },

    /* ======================= Office ======================= */
    {
      id: 'office',
      name: 'Office',
      kind: 'office',
      versions: [
        {
          id: 'office2024',
          name: 'Office LTSC 2024',
          file: 'Office2024',
          products: [
            { id: 'o2024-proplus',   name: 'Office LTSC 专业增强版', desc: '最常用', key: 'XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB' },
            { id: 'o2024-proj-pro',  name: 'Project 专业版',         desc: 'Project', key: 'FQQ23-N4YCY-73HQ3-FM9WC-76HF4' },
            { id: 'o2024-visio-pro', name: 'Visio 专业版',           desc: 'Visio',   key: 'B7TN8-FJ8V3-7QYCP-HQPMV-YY89G' },
            { id: 'o2024-access',    name: 'Access',                 desc: 'Access',  key: '82FTR-NCHR7-W3944-MGRHM-JMCWD' },
          ]
        },

        {
          id: 'office2021',
          name: 'Office LTSC 2021',
          file: 'Office2021',
          products: [
            { id: 'o2021-proplus',   name: 'Office LTSC 专业增强版',   desc: '最常用', key: 'FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH' },
            { id: 'o2021-proj-pro',  name: 'Project 专业版',   desc: 'Project', key: 'FTNWT-C6WBT-8HMGF-K9PRX-QV9H8' },
            { id: 'o2021-visio-pro', name: 'Visio 专业版', desc: 'Visio',  key: 'KNH8D-FGHT4-T8RK3-CTDYJ-K2HT4' },
          ]
        },

        {
          id: 'office2019',
          name: 'Office 2019',
          file: 'Office2019',
          products: [
            { id: 'o2019-proplus',   name: 'Office 专业增强版',   desc: '最常用', key: 'NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP' },
            { id: 'o2019-proj-pro',  name: 'Project 专业版',       desc: 'Project', key: 'B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B' },
            { id: 'o2019-visio-pro', name: 'Visio 专业版',         desc: 'Visio',   key: '9BGNQ-K37YR-RQHF2-38RQ3-7VCBB' },
          ]
        },

        {
          id: 'office2016',
          name: 'Office 2016',
          file: 'Office2016',
          products: [
            { id: 'o2016-proplus',   name: 'Office 专业增强版', desc: '最常用', key: 'XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99' },
            { id: 'o2016-proj-pro',  name: 'Project 专业版',     desc: 'Project', key: 'YG9NW-3K39V-2T3HJ-93F3Q-G83KT' },
            { id: 'o2016-visio-pro', name: 'Visio 专业版',       desc: 'Visio',   key: 'PD3PC-RHNGV-FXJ29-8JK7D-RJRJK' },
            { id: 'o2016-excel',     name: 'Excel 2016',           desc: '单组件',  key: '9C2PK-NWTVB-JMPW8-BFT28-7FTBF' },
            { id: 'o2016-outlook',   name: 'Outlook 2016',         desc: '单组件',  key: 'R69KK-NTPKF-7M3Q4-QYBHW-6MT9B' },
          ]
        },

        {
          id: 'off-check',
          name: 'Office 状态与排查',
          file: 'Office',
          products: [
            {
              id: 'off-status', name: '查看激活状态', desc: 'LICENSE STATUS 那一行',
              tpl: OFFICE_CD + '\ncscript //nologo ospp.vbs /dstatus',
              note: '输出里找 LICENSE STATUS: ---LICENSED--- 表示已激活。'
            },
            {
              id: 'off-uninstall', name: '清除 Office 的 KMS 设置', desc: '换主机前先清',
              tpl: OFFICE_CD + '\ncscript //nologo ospp.vbs /remhst\ncscript //nologo ospp.vbs /sethst:{h}\ncscript //nologo ospp.vbs /act',
              note: ''
            }
          ]
        }

      ]
    }

  ]
};
