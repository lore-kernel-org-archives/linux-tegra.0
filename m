Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4BB4582D9;
	Fri, 21 Aug 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302885; cv=none; b=BA8tKq/b4t3M+6KJx1ywR4rqXYaV1OoSmWTMRuBNNQao8HJbcQNGTYVRylFYYq3uJrXfkeBa3ycGE/sXRwRFZB/n35fQjaf0g4C66lOURbBwYIJrK9WOV3ThTZBKnNkm91SyLd6RP/7i0QYAq9f/R94ar957i2Xa+fzavMJmHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302885; c=relaxed/simple;
	bh=B6p+OcFdP515S8LjF8ohzfroFcUB/LLJnrQ8WbhYQ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+XrWFlgCVMcUvMzRTMPNtfnpx7V+CATQSlTAeYxPcEw8BrQhfTfpDcMiuCw+oLyX0m2YBakAmcYfdLtdpIIgwvFzDvbS06qPyNQ53NzOkEf5jvmSF3LgNN+pKwURrQkVLQd/htRvfAu0VLTWM0ImfYMkUd8lxLnZT2kPWLGWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D868B1F00A3A;
	Fri, 21 Aug 2026 09:00:58 +0000 (UTC)
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
Subject: [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:37 +0200
Message-ID: <b3473adc50c71aec5bc5f7ce6f5cda1727e26635.1787239813.git.geert+renesas@glider.be>
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
Boot-tested on RZ/Five.
---
 drivers/clk/renesas/rzg2l-cpg.c | 18 +++++++++---------
 drivers/clk/renesas/rzv2h-cpg.c |  8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 88d74858687d4866..50b64eb3eafebe71 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -580,7 +580,7 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 			      struct rzg2l_cpg_priv *priv)
 {
 	struct sd_mux_hw_data *sd_mux_hw_data;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_hw *clk_hw;
 	int ret;
 
@@ -831,9 +831,9 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 			       struct rzg2l_cpg_priv *priv)
 {
 	struct dsi_div_hw_data *clk_hw_data;
+	struct clk_init_data init = {};
 	const struct clk *parent;
 	const char *parent_name;
-	struct clk_init_data init;
 	struct clk_hw *clk_hw;
 	int ret;
 
@@ -916,8 +916,8 @@ static struct clk * __init
 rzg3l_cpg_lvds_div_clk_register(const struct cpg_core_clk *core,
 				struct rzg2l_cpg_priv *priv)
 {
+	struct clk_init_data init = {};
 	struct clk_fixed_factor *ff;
-	struct clk_init_data init;
 	const struct clk *parent;
 	const char *parent_name;
 	int ret;
@@ -1031,9 +1031,9 @@ rzg3l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 			       struct rzg2l_cpg_priv *priv)
 {
 	struct g3l_dsi_div_hw_data *clk_hw_data;
+	struct clk_init_data init = {};
 	const struct clk *parent;
 	const char *parent_name;
-	struct clk_init_data init;
 	struct clk_hw *clk_hw;
 	int ret;
 
@@ -1128,7 +1128,7 @@ rzg2l_cpg_pll5_4_mux_clk_register(const struct cpg_core_clk *core,
 				  struct rzg2l_cpg_priv *priv)
 {
 	struct pll5_mux_hw_data *clk_hw_data;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_hw *clk_hw;
 	int ret;
 
@@ -1255,8 +1255,8 @@ static struct clk * __init
 rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 			  struct rzg2l_cpg_priv *priv)
 {
+	struct clk_init_data init = {};
 	const struct clk *parent;
-	struct clk_init_data init;
 	const char *parent_name;
 	struct sipll5 *sipll5;
 	struct clk_hw *clk_hw;
@@ -1381,9 +1381,9 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 			   struct rzg2l_cpg_priv *priv,
 			   const struct clk_ops *ops)
 {
+	struct clk_init_data init = {};
 	struct device *dev = priv->dev;
 	const struct clk *parent;
-	struct clk_init_data init;
 	const char *parent_name;
 	struct pll_clk *pll_clk;
 	int ret;
@@ -1525,8 +1525,8 @@ static struct clk * __init
 rzg3l_cpg_dsi_mux_clk_register(const struct cpg_core_clk *core,
 			       struct rzg2l_cpg_priv *priv)
 {
+	struct clk_init_data init = {};
 	struct clk_mux *mux_data;
-	struct clk_init_data init;
 	int ret;
 
 	mux_data = devm_kzalloc(priv->dev, sizeof(*mux_data), GFP_KERNEL);
@@ -2265,10 +2265,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 			   const struct rzg2l_cpg_info *info,
 			   struct rzg2l_cpg_priv *priv)
 {
+	struct clk_init_data init = {};
 	struct mod_clock *clock = NULL;
 	struct device *dev = priv->dev;
 	unsigned int id = mod->id;
-	struct clk_init_data init;
 	struct clk *parent, *clk;
 	const char *parent_name;
 	unsigned int i;
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 917fc737f254b916..7003d59ac34b1179 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -338,7 +338,7 @@ rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
 {
 	struct rzv2h_plldsi_div_clk *clk_hw_data;
 	struct clk **clks = priv->clks;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const struct clk *parent;
 	const char *parent_name;
 	struct clk_hw *clk_hw;
@@ -582,7 +582,7 @@ rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
 				   struct rzv2h_cpg_priv *priv)
 {
 	struct rzv2h_plldsi_mux_clk *clk_hw_data;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_hw *clk_hw;
 	struct smuxed smux;
 	int ret;
@@ -711,7 +711,7 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 			   const struct clk_ops *ops)
 {
 	struct device *dev = priv->dev;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const struct clk *parent;
 	const char *parent_name;
 	struct pll_clk *pll_clk;
@@ -1229,7 +1229,7 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 {
 	struct mod_clock *clock = NULL;
 	struct device *dev = priv->dev;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *parent, *clk;
 	const char *parent_name;
 	unsigned int id;
-- 
2.43.0

