Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2EF44BC92;
	Fri, 21 Aug 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303040; cv=none; b=sa37WO8oye0kPNSUX7WeZqnqCBUdWreRQm6T9Bgeo0HV2Ui60zapUq/iCLXl7s01jpdTcd6EPmVxH2wD1dHFUGEYmZvaTDC5gohGwDs2xrLCxuPhFHtnu7sMbFmHJl7TdX1H/OmscmfxtIroSA/tfEtz+ci9Zfo8qdPxnGPUww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303040; c=relaxed/simple;
	bh=h8Ri8mkKo9dGAcjlbUz8O/8rc1h0uDP5AzQLHb0xSgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMHTL7hq3MUxINTJekhNDdVhEihQKTLWPASTwtimLYPCmnEo8EdzUcsVlwWhXIH2yU/qPBA/TdR7RvPgtQG1eGB7Z43wKM8GWYJR+9o+Ve+qLbgWa0lxFhvlsjlJvE7TlpH4Ww4YLpnvAYZRNmuKmLJvItRbbVrH1imy0PEvjf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E5A1F000E9;
	Fri, 21 Aug 2026 09:03:29 +0000 (UTC)
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
Subject: [PATCH 37/45] clk: tegra: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:47 +0200
Message-ID: <1cc7367a121a748dc126f54e1df70a5acebe5914.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/tegra/clk-audio-sync.c       | 2 +-
 drivers/clk/tegra/clk-divider.c          | 2 +-
 drivers/clk/tegra/clk-periph-fixed.c     | 2 +-
 drivers/clk/tegra/clk-periph-gate.c      | 2 +-
 drivers/clk/tegra/clk-periph.c           | 2 +-
 drivers/clk/tegra/clk-pll-out.c          | 2 +-
 drivers/clk/tegra/clk-pll.c              | 2 +-
 drivers/clk/tegra/clk-sdmmc-mux.c        | 2 +-
 drivers/clk/tegra/clk-super.c            | 4 ++--
 drivers/clk/tegra/clk-tegra-super-cclk.c | 2 +-
 drivers/clk/tegra/clk-tegra124-emc.c     | 2 +-
 drivers/clk/tegra/clk-tegra20-emc.c      | 2 +-
 drivers/clk/tegra/clk-tegra210-emc.c     | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
index 0bbfcf46bedd521e..0fb4377c80bf2a04 100644
--- a/drivers/clk/tegra/clk-audio-sync.c
+++ b/drivers/clk/tegra/clk-audio-sync.c
@@ -47,7 +47,7 @@ struct clk *tegra_clk_register_sync_source(const char *name,
 					   unsigned long max_rate)
 {
 	struct tegra_clk_sync_source *sync;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *clk;
 
 	sync = kzalloc_obj(*sync);
diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 27f43c3da1563e92..2dc7713433451754 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -145,8 +145,8 @@ struct clk *tegra_clk_register_divider(const char *name,
 		u8 frac_width, spinlock_t *lock)
 {
 	struct tegra_clk_frac_div *divider;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 
 	divider = kzalloc_obj(*divider);
 	if (!divider) {
diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/clk-periph-fixed.c
index bb33e32cad4a1732..9ea9d41f47963168 100644
--- a/drivers/clk/tegra/clk-periph-fixed.c
+++ b/drivers/clk/tegra/clk-periph-fixed.c
@@ -77,7 +77,7 @@ struct clk *tegra_clk_register_periph_fixed(const char *name,
 {
 	const struct tegra_clk_periph_regs *regs;
 	struct tegra_clk_periph_fixed *fixed;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *clk;
 
 	regs = get_reg_bank(num);
diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index fa39d64875154efe..d821e1b9f77e6ba3 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -139,7 +139,7 @@ struct clk *tegra_clk_register_periph_gate(const char *name,
 {
 	struct tegra_clk_periph_gate *gate;
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const struct tegra_clk_periph_regs *pregs;
 
 	pregs = get_reg_bank(clk_num);
diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 6ebeaa7cb65648e7..7af832d9af9b011f 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -166,7 +166,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 			unsigned long flags)
 {
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const struct tegra_clk_periph_regs *bank;
 	bool div = !(periph->gate.flags & TEGRA_PERIPH_NO_DIV);
 
diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
index 2299545fc386f87b..285b0af811fb1903 100644
--- a/drivers/clk/tegra/clk-pll-out.c
+++ b/drivers/clk/tegra/clk-pll-out.c
@@ -90,8 +90,8 @@ struct clk *tegra_clk_register_pll_out(const char *name,
 		spinlock_t *lock)
 {
 	struct tegra_clk_pll_out *pll_out;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 
 	pll_out = kzalloc_obj(*pll_out);
 	if (!pll_out)
diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index adfb74f111ef1afd..fc3abe86414ddd11 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1903,7 +1903,7 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
 		const char *name, const char *parent_name, unsigned long flags,
 		const struct clk_ops *ops)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 
 	init.name = name;
 	init.ops = ops;
diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c b/drivers/clk/tegra/clk-sdmmc-mux.c
index 14b5439a100a0cef..74fe06fa546abf47 100644
--- a/drivers/clk/tegra/clk-sdmmc-mux.c
+++ b/drivers/clk/tegra/clk-sdmmc-mux.c
@@ -236,7 +236,7 @@ struct clk *tegra_clk_register_sdmmc_mux_div(const char *name,
 	unsigned long flags, void *lock)
 {
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const struct tegra_clk_periph_regs *bank;
 	struct tegra_sdmmc_mux *sdmmc_mux;
 
diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 370445e3d5acc34e..7aa3c3774445d32c 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -204,8 +204,8 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 		u8 width, u8 pllx_index, u8 div2_index, spinlock_t *lock)
 {
 	struct tegra_clk_super_mux *super;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 
 	super = kzalloc_obj(*super);
 	if (!super)
@@ -240,8 +240,8 @@ struct clk *tegra_clk_register_super_clk(const char *name,
 		spinlock_t *lock)
 {
 	struct tegra_clk_super_mux *super;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 
 	super = kzalloc_obj(*super);
 	if (!super)
diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
index e7aeb67606b11390..1047a1104ec1f5d7 100644
--- a/drivers/clk/tegra/clk-tegra-super-cclk.c
+++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
@@ -135,8 +135,8 @@ struct clk *tegra_clk_register_super_cclk(const char *name,
 		spinlock_t *lock)
 {
 	struct tegra_clk_super_mux *super;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 	u32 val;
 
 	if (WARN_ON(cclk_super))
diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 94ac24ea1e6adc37..0fc74808fe39b2f7 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -485,8 +485,8 @@ static const struct clk_ops tegra_clk_emc_ops = {
 struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np,
 				      spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct tegra_clk_emc *tegra;
-	struct clk_init_data init;
 	struct device_node *node;
 	u32 node_ram_code;
 	struct clk *clk;
diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
index 44465726a8a67005..5cd026e8f305a35a 100644
--- a/drivers/clk/tegra/clk-tegra20-emc.c
+++ b/drivers/clk/tegra/clk-tegra20-emc.c
@@ -245,8 +245,8 @@ bool tegra20_clk_emc_driver_available(struct clk_hw *emc_hw)
 
 struct clk *tegra20_clk_register_emc(void __iomem *ioaddr, bool low_jitter)
 {
+	struct clk_init_data init = {};
 	struct tegra_clk_emc *emc;
-	struct clk_init_data init;
 	struct clk *clk;
 
 	emc = kzalloc_obj(*emc);
diff --git a/drivers/clk/tegra/clk-tegra210-emc.c b/drivers/clk/tegra/clk-tegra210-emc.c
index 9f140d94bef75560..2e559d95d40e7d50 100644
--- a/drivers/clk/tegra/clk-tegra210-emc.c
+++ b/drivers/clk/tegra/clk-tegra210-emc.c
@@ -274,8 +274,8 @@ static const struct clk_ops tegra210_clk_emc_ops = {
 struct clk *tegra210_clk_register_emc(struct device_node *np,
 				      void __iomem *regs)
 {
+	struct clk_init_data init = {};
 	struct tegra210_clk_emc *emc;
-	struct clk_init_data init;
 	struct clk *clk;
 
 	emc = kzalloc_obj(*emc);
-- 
2.43.0

