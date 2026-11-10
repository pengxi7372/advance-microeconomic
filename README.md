# advance-microeconomic

微观经济学相关资料。包含两部分：一是自编的《高级微观经济学》讲义（LaTeX 源码与 PDF 成品），二是授课与研究所用的参考资料。

## 一、自编讲义（LaTeX 源码 + PDF）

微观经济学理论课程讲义书稿。源码用 LuaLaTeX 编译，中文由 `ctex` 处理，版式参考 Nolan Miller, *Notes on Microeconomic Theory*（SWP/notes3 风格）。

讲义分两棵目录：`pdf/` 放成品，`tex/` 放可编译源码。

### 目录结构

```
.
├── pdf/                                   # 编译好的讲义 PDF（直接阅读）
│   ├── 第1章-从可行集到模型价值.pdf
│   ├── 第2章-偏好、效用与显示偏好.pdf
│   ├── 第3章-从偏好到效用.pdf
│   ├── 第4章-效用函数.pdf
│   ├── 第5章-效用最大化.pdf
│   ├── 第6章-从需求数据到偏好.pdf
│   └── 案例-双产出收益最大化.pdf
├── tex/                                   # LaTeX 源码
│   ├── course_preamble.tex                # 全书共用前言（各讲共用，勿单独编译）
│   ├── ch01-从可行集到模型价值/           # main.tex + preamble.tex + sec*.tex + figs/
│   ├── ch02-偏好、效用与显示偏好/         # main.tex + preamble.tex + parts/
│   ├── ch03-从偏好到效用/
│   ├── ch04-效用函数/
│   ├── ch05-效用最大化/
│   ├── ch06-从需求数据到偏好/             # main.tex + preamble.tex + parts/
│   └── case-双产出收益最大化/
└── course_build.sh                        # 统一编译脚本
```

### 内容概览

| 编号 | 标题 | 核心问题 |
|---|---|---|
| 第 1 章 | 从可行集到模型价值：选择理论的形式化基础与方法论边界 | 方案空间、可行集、选择对应的集合语言；纯选择理论为何可以不预设目标函数 |
| 第 2 章 | 偏好、效用与显示偏好：理性选择理论的形式化基础 | 偏好公理（完备性、传递性）与显示偏好理论（WARP/SARP/GARP） |
| 第 3 章 | 从偏好到效用：效用表示的存在性、构造与性质对应 | 什么样的偏好可被效用函数"数字化"；词典序作为理性但不可表示的基准反例 |
| 第 4 章 | 效用函数：函数形式大全、顶刊前沿、选择方法与政策应用 | 静态/跨期/风险/模糊偏好下的函数形式；行为偏离与随机效用模型；社会福利函数 |
| 第 5 章 | 效用最大化：从可行集到 Slutsky 分解 | Kuhn-Tucker 条件、间接效用与支出函数、包络定理与 Roy 恒等式、Slutsky 方程 |
| 第 6 章 | 从需求数据到偏好：可积性、显示偏好与福利评价 | 逆问题：需求的对称性何时才是实质约束；Pfaff 系统与 Hurwicz–Uzawa 可积性；CD/CES/LES 的显式恢复；WARP/SARP/GARP 与 Afriat 定理；Gorman 加总；CV/EV 与消费者剩余 |
| 案例 | 双产出技术的收益最大化：一个完整可算的数值案例 | 边际转换率、拉格朗日乘子的经济学含义与完整数值求解 |

### 编译

需要 TeX Live（含 LuaLaTeX）与 `ctex` 宏包；字体使用系统字体（macOS 的 Songti SC / TeX Gyre Termes）。

```bash
# 在仓库根目录执行，参数为该讲目录
bash course_build.sh tex/ch01-从可行集到模型价值
bash course_build.sh tex/ch02-偏好、效用与显示偏好
bash course_build.sh tex/ch03-从偏好到效用
bash course_build.sh tex/ch04-效用函数
bash course_build.sh tex/ch05-效用最大化
bash course_build.sh tex/ch06-从需求数据到偏好
bash course_build.sh tex/case-双产出收益最大化
```

脚本执行 LuaLaTeX 两遍（生成目录需要两遍），产物为各讲目录下的 `main.pdf`。

> **注意**：各讲 `preamble.tex` 通过 `\input{../course_preamble}` 引用共用前言，因此 `tex/` 下的目录层级不能改动，否则编译会找不到 `course_preamble.tex`。

### 图件

第 1 章的插图由 TikZ 绘制，源码在 `tex/ch01-从可行集到模型价值/figs/`，已渲染的 PNG 一并提交，无需重新编译即可直接使用。

## 二、参考资料

| 目录 | 说明 |
|---|---|
| `微观Graduate讲义/` | 各校高级微观、博弈论、机制设计课程讲义（Bergstrom、Levin、Rigotti、Kartik 等） |
| `高级微观经济学——彭曦上课用/` | 课堂用 MWG 章节讲稿、习题与教学大纲 |
| `Miller's Notes/` | Nolan Miller, *Notes on Microeconomic Theory* 全九章 |
| `Levin_Stanford_Teaching/` | Jonathan Levin 斯坦福 Econ 136 市场设计课程课件（匹配、拍卖、择校） |
| `尼科尔森-高微/` | 尼科尔森《微观经济理论》分章课件（PPT） |
| 根目录若干 PDF | 金融科技（fintech）主题文献 |
