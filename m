Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6E3CF680;
	Fri, 21 Aug 2026 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302963; cv=none; b=ik5XYX0jnDe0QQZ9VWjiUToxJWTw+O3e7O3hfZiCNVkqJ+AMfESmeeqiN4MoD3qU0B4AL7r+fguJTGAuYhbQ++sY2e8wBgp56KG0GZmLkaOpXsURJuJxshS+gosh4EFqlRjb4jVfVe15ZquTopujp9rZnlLnchppPU8sonqi1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302963; c=relaxed/simple;
	bh=hkuwbAfuTx68NodqaDMZbswYScgLXtNCq4mND9danAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwVxF/omxCiumIOSxk8ZjxsOgNC+GIXSUi3mdoPrkr+HdeWUAKua4UYvNL3HWlLuSrC1qoT9YsxLC+9pYcTg7z/cmlRWUHDsZQCjn3QFFXTFLOwsoQY+Jt8yjOgyy+xMMb62xxVaP2EW+kYepsTDhvLReu+RyX3mWw3bfSamDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7315D1F000E9;
	Fri, 21 Aug 2026 09:02:14 +0000 (UTC)
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
Subject: [PATCH 32/45] clk: socfpga: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:42 +0200
Message-ID: <2d38d78f8d59583e29778bebc65eaab911d8a120.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/socfpga/clk-gate-a10.c   | 2 +-
 drivers/clk/socfpga/clk-gate-s10.c   | 6 +++---
 drivers/clk/socfpga/clk-gate.c       | 2 +-
 drivers/clk/socfpga/clk-periph-a10.c | 2 +-
 drivers/clk/socfpga/clk-periph-s10.c | 8 ++++----
 drivers/clk/socfpga/clk-periph.c     | 2 +-
 drivers/clk/socfpga/clk-pll-a10.c    | 2 +-
 drivers/clk/socfpga/clk-pll-s10.c    | 8 ++++----
 drivers/clk/socfpga/clk-pll.c        | 2 +-
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index dd8d1713aaff7639..ba12179061b3fe9d 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -49,7 +49,7 @@ static void __init __socfpga_gate_init(struct device_node *node,
 	struct socfpga_gate_clk *socfpga_clk;
 	const char *clk_name = node->name;
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int rc;
 
 	socfpga_clk = kzalloc_obj(*socfpga_clk);
diff --git a/drivers/clk/socfpga/clk-gate-s10.c b/drivers/clk/socfpga/clk-gate-s10.c
index 24f56a9edc44e528..4b23909c58106599 100644
--- a/drivers/clk/socfpga/clk-gate-s10.c
+++ b/drivers/clk/socfpga/clk-gate-s10.c
@@ -128,7 +128,7 @@ struct clk_hw *s10_register_gate(const struct stratix10_gate_clock *clks, void _
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_gate_clk *socfpga_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name = clks->parent_name;
 	int ret;
 
@@ -186,7 +186,7 @@ struct clk_hw *agilex_register_gate(const struct stratix10_gate_clock *clks, voi
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_gate_clk *socfpga_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name = clks->parent_name;
 	int ret;
 
@@ -244,7 +244,7 @@ struct clk_hw *agilex5_register_gate(const struct agilex5_gate_clock *clks, void
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_gate_clk *socfpga_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	socfpga_clk = kzalloc_obj(*socfpga_clk);
diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index ced8e09884068a26..d0f9fa44ad182520 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -143,7 +143,7 @@ void __init socfpga_gate_init(struct device_node *node)
 	struct socfpga_gate_clk *socfpga_clk;
 	const char *clk_name = node->name;
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_ops *ops;
 	int rc;
 
diff --git a/drivers/clk/socfpga/clk-periph-a10.c b/drivers/clk/socfpga/clk-periph-a10.c
index 4eb5787f0dea3f8e..8aefc58ba4ec3944 100644
--- a/drivers/clk/socfpga/clk-periph-a10.c
+++ b/drivers/clk/socfpga/clk-periph-a10.c
@@ -65,7 +65,7 @@ static void __init __socfpga_periph_init(struct device_node *node,
 	struct socfpga_periph_clk *periph_clk;
 	const char *clk_name = node->name;
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int rc;
 	u32 fixed_div;
 	u32 div_reg[3];
diff --git a/drivers/clk/socfpga/clk-periph-s10.c b/drivers/clk/socfpga/clk-periph-s10.c
index 5195b9476da16977..dc923d0d87869743 100644
--- a/drivers/clk/socfpga/clk-periph-s10.c
+++ b/drivers/clk/socfpga/clk-periph-s10.c
@@ -103,7 +103,7 @@ struct clk_hw *s10_register_periph(const struct stratix10_perip_c_clock *clks,
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_periph_clk *periph_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	const char *parent_name = clks->parent_name;
 	int ret;
@@ -139,7 +139,7 @@ struct clk_hw *n5x_register_periph(const struct n5x_perip_c_clock *clks,
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_periph_clk *periph_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	const char *parent_name = clks->parent_name;
 	int ret;
@@ -174,7 +174,7 @@ struct clk_hw *s10_register_cnt_periph(const struct stratix10_perip_cnt_clock *c
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_periph_clk *periph_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	const char *parent_name = clks->parent_name;
 	int ret;
@@ -220,7 +220,7 @@ struct clk_hw *agilex5_register_cnt_periph(const struct agilex5_perip_cnt_clock
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_periph_clk *periph_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	int ret;
 
diff --git a/drivers/clk/socfpga/clk-periph.c b/drivers/clk/socfpga/clk-periph.c
index 3821db6777e75413..8fa3d8e20042d731 100644
--- a/drivers/clk/socfpga/clk-periph.c
+++ b/drivers/clk/socfpga/clk-periph.c
@@ -55,7 +55,7 @@ static void __init __socfpga_periph_init(struct device_node *node,
 	struct socfpga_periph_clk *periph_clk;
 	const char *clk_name = node->name;
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int rc;
 	u32 fixed_div;
 	u32 div_reg[3];
diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index c56f276e8d51e00f..63b8b75045aead8d 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -71,7 +71,7 @@ static void __init __socfpga_pll_init(struct device_node *node,
 	struct socfpga_pll *pll_clk;
 	const char *clk_name = node->name;
 	const char *parent_name[SOCFGPA_MAX_PARENTS];
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct device_node *clkmgr_np;
 	int rc;
 	int i = 0;
diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index ee236e87da33c020..1dca54b48375b168 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -192,7 +192,7 @@ struct clk_hw *s10_register_pll(const struct stratix10_pll_clock *clks,
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_pll *pll_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	int ret;
 
@@ -232,7 +232,7 @@ struct clk_hw *agilex_register_pll(const struct stratix10_pll_clock *clks,
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_pll *pll_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	int ret;
 
@@ -271,7 +271,7 @@ struct clk_hw *n5x_register_pll(const struct stratix10_pll_clock *clks,
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_pll *pll_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	int ret;
 
@@ -310,7 +310,7 @@ struct clk_hw *agilex5_register_pll(const struct agilex5_pll_clock *clks,
 {
 	struct clk_hw *hw_clk;
 	struct socfpga_pll *pll_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *name = clks->name;
 	int ret;
 
diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index f85adb16d414040f..aa13cc9d6db115fe 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -78,7 +78,7 @@ static void __init __socfpga_pll_init(struct device_node *node,
 	struct socfpga_pll *pll_clk;
 	const char *clk_name = node->name;
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct device_node *clkmgr_np;
 	int rc;
 
-- 
2.43.0

