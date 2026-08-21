Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BDF44212E;
	Fri, 21 Aug 2026 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302664; cv=none; b=RJd0wZdioSGuyTTAxITtot+v0NbmIirtG0JtfGO0DUDqrq8bH2CmE4nb779whxIENlomYSxyKo3fqvmAw3aoUXVxQLQfenm06ddbsdWWzz7K/xlcxHX9Pc7COoJCB2/XauUUZBZZJkVLFY1UGizjMPKxoPowmd0xKXgmk5Zv9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302664; c=relaxed/simple;
	bh=MIUkGPGlOb4phfOZBTDAJ4/bs8pBc6qyq24ZSH+Vd5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmtIf20cFRE02oTijOlqoWzulJt4pGd+9tAD47YweQTptByDnCjdwO0xg5TGi4AsraVn3/W39UeDcsIlXT4cZ4mdig7DyUDBIPG0uYPwCy617uHQjyOqugYV1QntQ4THqM7GdOkTKvVT4mQOaHvbxzygdgvJ03KkgoXRdA8AHvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13A71F00A3A;
	Fri, 21 Aug 2026 08:57:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	arm-scmi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:23 +0200
Message-ID: <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
References: <cover.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/clk/imx/clk-busy.c           | 4 ++--
 drivers/clk/imx/clk-cpu.c            | 2 +-
 drivers/clk/imx/clk-divider-gate.c   | 2 +-
 drivers/clk/imx/clk-fixup-div.c      | 2 +-
 drivers/clk/imx/clk-fixup-mux.c      | 2 +-
 drivers/clk/imx/clk-frac-pll.c       | 2 +-
 drivers/clk/imx/clk-fracn-gppll.c    | 2 +-
 drivers/clk/imx/clk-gate-93.c        | 2 +-
 drivers/clk/imx/clk-gate-exclusive.c | 2 +-
 drivers/clk/imx/clk-gate2.c          | 2 +-
 drivers/clk/imx/clk-lpcg-scu.c       | 2 +-
 drivers/clk/imx/clk-pfd.c            | 2 +-
 drivers/clk/imx/clk-pfdv2.c          | 2 +-
 drivers/clk/imx/clk-pll14xx.c        | 2 +-
 drivers/clk/imx/clk-pllv1.c          | 2 +-
 drivers/clk/imx/clk-pllv2.c          | 2 +-
 drivers/clk/imx/clk-pllv3.c          | 2 +-
 drivers/clk/imx/clk-pllv4.c          | 2 +-
 drivers/clk/imx/clk-scu.c            | 4 ++--
 drivers/clk/imx/clk-sscg-pll.c       | 2 +-
 20 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index b8b6e7c7e1fe35c5..75a2bf29e42fc6d8 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -78,8 +78,8 @@ struct clk_hw *imx_clk_hw_busy_divider(const char *name, const char *parent_name
 				 void __iomem *busy_reg, u8 busy_shift)
 {
 	struct clk_busy_divider *busy;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	busy = kzalloc_obj(*busy);
@@ -157,9 +157,9 @@ struct clk_hw *imx_clk_hw_busy_mux(const char *name, void __iomem *reg, u8 shift
 			     u8 width, void __iomem *busy_reg, u8 busy_shift,
 			     const char * const *parent_names, int num_parents)
 {
+	struct clk_init_data init = {};
 	struct clk_busy_mux *busy;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	busy = kzalloc_obj(*busy);
diff --git a/drivers/clk/imx/clk-cpu.c b/drivers/clk/imx/clk-cpu.c
index f53dbaacddcc9f85..b4d9722eb17e63ec 100644
--- a/drivers/clk/imx/clk-cpu.c
+++ b/drivers/clk/imx/clk-cpu.c
@@ -76,9 +76,9 @@ struct clk_hw *imx_clk_hw_cpu(const char *name, const char *parent_name,
 		struct clk *div, struct clk *mux, struct clk *pll,
 		struct clk *step)
 {
+	struct clk_init_data init = {};
 	struct clk_cpu *cpu;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	cpu = kzalloc_obj(*cpu);
diff --git a/drivers/clk/imx/clk-divider-gate.c b/drivers/clk/imx/clk-divider-gate.c
index 957d132c4607dc5f..a1b7c109069c3bb3 100644
--- a/drivers/clk/imx/clk-divider-gate.c
+++ b/drivers/clk/imx/clk-divider-gate.c
@@ -179,8 +179,8 @@ struct clk_hw *imx_clk_hw_divider_gate(const char *name, const char *parent_name
 				    const struct clk_div_table *table,
 				    spinlock_t *lock)
 {
-	struct clk_init_data init;
 	struct clk_divider_gate *div_gate;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
 	u32 val;
 	int ret;
diff --git a/drivers/clk/imx/clk-fixup-div.c b/drivers/clk/imx/clk-fixup-div.c
index 3866319af54ef8b6..a6f68317cd2e523c 100644
--- a/drivers/clk/imx/clk-fixup-div.c
+++ b/drivers/clk/imx/clk-fixup-div.c
@@ -90,8 +90,8 @@ struct clk_hw *imx_clk_hw_fixup_divider(const char *name, const char *parent,
 				  void (*fixup)(u32 *val))
 {
 	struct clk_fixup_div *fixup_div;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (!fixup)
diff --git a/drivers/clk/imx/clk-fixup-mux.c b/drivers/clk/imx/clk-fixup-mux.c
index 7188cdad79d3c82d..f43648f7fb45a92e 100644
--- a/drivers/clk/imx/clk-fixup-mux.c
+++ b/drivers/clk/imx/clk-fixup-mux.c
@@ -70,8 +70,8 @@ struct clk_hw *imx_clk_hw_fixup_mux(const char *name, void __iomem *reg,
 			      int num_parents, void (*fixup)(u32 *val))
 {
 	struct clk_fixup_mux *fixup_mux;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (!fixup)
diff --git a/drivers/clk/imx/clk-frac-pll.c b/drivers/clk/imx/clk-frac-pll.c
index cd4e26bac19c48bc..d6c59634c0c02813 100644
--- a/drivers/clk/imx/clk-frac-pll.c
+++ b/drivers/clk/imx/clk-frac-pll.c
@@ -208,7 +208,7 @@ struct clk_hw *imx_clk_hw_frac_pll(const char *name,
 				   const char *parent_name,
 				   void __iomem *base)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_frac_pll *pll;
 	struct clk_hw *hw;
 	int ret;
diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 4048c16c0578b8f5..32bb3e9a8d6ec2b0 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -363,9 +363,9 @@ static struct clk_hw *_imx_clk_fracn_gppll(const char *name, const char *parent_
 					   const struct imx_fracn_gppll_clk *pll_clk,
 					   u32 pll_flags)
 {
+	struct clk_init_data init = {};
 	struct clk_fracn_gppll *pll;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	pll = kzalloc_obj(*pll);
diff --git a/drivers/clk/imx/clk-gate-93.c b/drivers/clk/imx/clk-gate-93.c
index 7acbcfec9610b359..7208138d615dfbd8 100644
--- a/drivers/clk/imx/clk-gate-93.c
+++ b/drivers/clk/imx/clk-gate-93.c
@@ -158,9 +158,9 @@ struct clk_hw *imx93_clk_gate(struct device *dev, const char *name, const char *
 			      unsigned long flags, void __iomem *reg, u32 bit_idx, u32 val,
 			      u32 mask, u32 domain_id, unsigned int *share_count)
 {
+	struct clk_init_data init = {};
 	struct imx93_clk_gate *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 	u32 authen;
 
diff --git a/drivers/clk/imx/clk-gate-exclusive.c b/drivers/clk/imx/clk-gate-exclusive.c
index 504cfeef28a08b78..cf873e490362a239 100644
--- a/drivers/clk/imx/clk-gate-exclusive.c
+++ b/drivers/clk/imx/clk-gate-exclusive.c
@@ -59,9 +59,9 @@ struct clk_hw *imx_clk_hw_gate_exclusive(const char *name, const char *parent,
 	 void __iomem *reg, u8 shift, u32 exclusive_mask)
 {
 	struct clk_gate_exclusive *exgate;
+	struct clk_init_data init = {};
 	struct clk_gate *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (exclusive_mask == 0)
diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index f07cf82dd9c9a27d..c8b6323571eec93d 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -139,9 +139,9 @@ struct clk_hw *clk_hw_register_gate2(struct device *dev, const char *name,
 		u8 clk_gate2_flags, spinlock_t *lock,
 		unsigned int *share_count)
 {
+	struct clk_init_data init = {};
 	struct clk_gate2 *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	gate = kzalloc_obj(struct clk_gate2);
diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index 03bbfbe9bff3d38d..da110a823fd5bafa 100644
--- a/drivers/clk/imx/clk-lpcg-scu.c
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -114,8 +114,8 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
 				  const char *parent_name, unsigned long flags,
 				  void __iomem *reg, u8 bit_idx, bool hw_gate)
 {
+	struct clk_init_data init = {};
 	struct clk_lpcg_scu *clk;
-	struct clk_init_data init;
 	struct clk_hw *hw;
 	int ret;
 
diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index e7a5d80c50083b39..e56bb27e57cc9242 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -127,9 +127,9 @@ static const struct clk_ops clk_pfd_ops = {
 struct clk_hw *imx_clk_hw_pfd(const char *name, const char *parent_name,
 			void __iomem *reg, u8 idx)
 {
+	struct clk_init_data init = {};
 	struct clk_pfd *pfd;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	pfd = kzalloc_obj(*pfd);
diff --git a/drivers/clk/imx/clk-pfdv2.c b/drivers/clk/imx/clk-pfdv2.c
index 0f92b92e2229fd97..43ba79e47eac564a 100644
--- a/drivers/clk/imx/clk-pfdv2.c
+++ b/drivers/clk/imx/clk-pfdv2.c
@@ -203,7 +203,7 @@ static const struct clk_ops clk_pfdv2_ops = {
 struct clk_hw *imx_clk_hw_pfdv2(enum imx_pfdv2_type type, const char *name,
 			     const char *parent_name, void __iomem *reg, u8 idx)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_pfdv2 *pfd;
 	struct clk_hw *hw;
 	int ret;
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f570059b7..2f9e36f9e2409ac3 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -515,9 +515,9 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 				const char *parent_name, void __iomem *base,
 				const struct imx_pll14xx_clk *pll_clk)
 {
+	struct clk_init_data init = {};
 	struct clk_pll14xx *pll;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 	u32 val;
 
diff --git a/drivers/clk/imx/clk-pllv1.c b/drivers/clk/imx/clk-pllv1.c
index da5531e57da2a782..ee60c7660ef49041 100644
--- a/drivers/clk/imx/clk-pllv1.c
+++ b/drivers/clk/imx/clk-pllv1.c
@@ -114,9 +114,9 @@ static const struct clk_ops clk_pllv1_ops = {
 struct clk_hw *imx_clk_hw_pllv1(enum imx_pllv1_type type, const char *name,
 		const char *parent, void __iomem *base)
 {
+	struct clk_init_data init = {};
 	struct clk_pllv1 *pll;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	pll = kmalloc_obj(*pll);
diff --git a/drivers/clk/imx/clk-pllv2.c b/drivers/clk/imx/clk-pllv2.c
index 43396388030e30e5..aacc3d84e797c2e8 100644
--- a/drivers/clk/imx/clk-pllv2.c
+++ b/drivers/clk/imx/clk-pllv2.c
@@ -249,9 +249,9 @@ static const struct clk_ops clk_pllv2_ops = {
 struct clk_hw *imx_clk_hw_pllv2(const char *name, const char *parent,
 		void __iomem *base)
 {
+	struct clk_init_data init = {};
 	struct clk_pllv2 *pll;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	pll = kzalloc_obj(*pll);
diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index a0ad6f4aae8fa5cc..714d9c723e167d3b 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -422,8 +422,8 @@ struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 {
 	struct clk_pllv3 *pll;
 	const struct clk_ops *ops;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	pll = kzalloc_obj(*pll);
diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
index 8fa2f7111ce9b220..6dc9640d2f19b893 100644
--- a/drivers/clk/imx/clk-pllv4.c
+++ b/drivers/clk/imx/clk-pllv4.c
@@ -246,9 +246,9 @@ static const struct clk_ops clk_pllv4_ops = {
 struct clk_hw *imx_clk_hw_pllv4(enum imx_pllv4_type type, const char *name,
 		 const char *parent_name, void __iomem *base)
 {
+	struct clk_init_data init = {};
 	struct clk_pllv4 *pll;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	pll = kzalloc_obj(*pll);
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 44220e9c5c2a2331..0d034e206c6bc806 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -445,7 +445,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 			     const char * const *parents, int num_parents,
 			     u32 rsrc_id, u8 clk_type)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_scu *clk;
 	struct clk_hw *hw;
 	int ret;
@@ -839,9 +839,9 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 				 bool invert)
 {
 	struct imx_scu_clk_node *clk_node;
+	struct clk_init_data init = {};
 	struct clk_gpr_scu *clk;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (rsrc_id >= IMX_SC_R_LAST || gpr_id >= IMX_SC_C_LAST)
diff --git a/drivers/clk/imx/clk-sscg-pll.c b/drivers/clk/imx/clk-sscg-pll.c
index 7f104ecfa80fee49..f6286ec11e0c07d9 100644
--- a/drivers/clk/imx/clk-sscg-pll.c
+++ b/drivers/clk/imx/clk-sscg-pll.c
@@ -504,8 +504,8 @@ struct clk_hw *imx_clk_hw_sscg_pll(const char *name,
 				void __iomem *base,
 				unsigned long flags)
 {
+	struct clk_init_data init = {};
 	struct clk_sscg_pll *pll;
-	struct clk_init_data init;
 	struct clk_hw *hw;
 	int ret;
 
-- 
2.43.0

