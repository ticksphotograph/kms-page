# 内网 KMS 激活（静态站）

一个纯静态的 KMS 激活指引页：三步选好产品 → 复制命令，或直接下载 `.bat` 双击运行。

- 无后端、无数据库、无第三方请求，**不加载任何图片和外部字体**
- 可以直接双击 `index.html` 打开，也可以丢到任意静态托管（GitHub Pages / Nginx / 对象存储）
- 所有路径都是相对路径，放在子目录（如 `https://<user>.github.io/<repo>/`）下也能正常工作

## 文件

| 文件 | 说明 |
| --- | --- |
| `index.html` | 页面 + 样式 + 脚本（单文件，约 90 KB） |
| `config.js` | **唯一的配置入口**：KMS 地址、产品目录、密钥，都在这里改 |
| `favicon.svg` | 站点图标 |
| `404.html` | 兜底页（GitHub Pages 会自动使用仓库根目录的 404.html） |
| `KMS激活工具.bat` | 完整版菜单式工具（页面不引用，可直接分发） |

## 改配置

打开 `config.js`，改完保存、刷新网页即生效，`index.html` 不用动：

- `host`：KMS 服务器地址（不带 `http://`，默认端口不用写）
- `catalog`：产品目录。`kind: 'win'` 走 `slmgr.vbs`，`kind: 'office'` 走 `ospp.vbs`
- 每个产品可以只填 `key`，没填就用模板里的占位符，页面会提示手动替换

## 本地预览

直接双击 `index.html` 即可。想用本地 http 服务预览：

```bash
python -m http.server 8080
# 浏览器打开 http://localhost:8080
```

## 部署到 GitHub Pages

### 方式一：网页点两下（推荐，不用写流水线）

1. GitHub Desktop → **Add** → **Add existing repository** → 选本目录 → **Publish repository**
   （建议勾掉 "Keep this code private"，Pages 需要仓库可被公开读取；见下方注意）
2. 打开仓库网页 → **Settings** → **Pages**
3. **Source** 选 `Deploy from a branch`，**Branch** 选 `main` + `/ (root)`，**Save**
4. 等 1～2 分钟，访问 `https://<用户名>.github.io/<仓库名>/`

以后每次 `git push` 到 `main`，站点会自动重新发布，不需要重新配置。

### 方式二：想用 Actions 控制发布时机

在仓库里加 `.github/workflows/pages.yml`：

```yaml
name: Deploy static site
on:
  push:
    branches: [main]
  workflow_dispatch:
permissions:
  contents: read
  pages: write
  id-token: write
concurrency:
  group: pages
  cancel-in-progress: true
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/upload-pages-artifact@v3
        with:
          path: .
      - id: deployment
        uses: actions/deploy-pages@v4
```

然后在 **Settings → Pages → Source** 选 `GitHub Actions`。

## 注意

- **GitHub Pages 的站点是公开的**：只要知道链接，任何人都能打开这个页面并看到里面的密钥。如果它只该给组织内部用，建议不要用 Pages，改在内网 Nginx 上托管，或至少不要把仓库设为公开、不要把链接外传。
- 页面里的命令只适用于**已获微软批量授权**的设备，连接的是组织自建的 KMS 主机。
- 想在自定义域名下访问：在仓库根目录加一个 `CNAME` 文件，内容是你的域名，再在域名服务商处加 CNAME 解析。
