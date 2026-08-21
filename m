Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D947443AAB;
	Fri, 21 Aug 2026 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303054; cv=none; b=E1RCKk2BYgKYc2GKh64AOrRoKcvx10zyS1Ihm6eS5GufR8bHHgFj9mEiI7kpH3Eyzn/7cixj4gbck7wpb3HU5m/fm0jJTiLKVK3F3EOPllRco9IkYMNrq7/hstFBqITVeY+EXxm4Cm1VsBl3waZbpWiqN95ZpWE9Ihw2muwJzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303054; c=relaxed/simple;
	bh=0XNoe8YYLRaiChkh1AeHhGc8IS+4qTNW4ytFG4ucjf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJEe7a8qmNBRTVCQ1rpyEjpooz0CwcL+Fqitzls3p5xWTE0fSpBRCwgs9tRP01C1+PlJ6ZHDkTdZXDsX0kTMWwUgWtaCqI9iXI8E5rY6wQcdogRuEvFp6A9SCcNCsVeNAbnWKaQAUm28BKSOKMQ9LqYV1aW22oaBt5kshYbVbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C869B1F00A3A;
	Fri, 21 Aug 2026 09:03:44 +0000 (UTC)
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
Subject: [PATCH 38/45] clk: uniphier: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:48 +0200
Message-ID: <491e41d759cec667d6bcd742673e1fec70b4bc31.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/uniphier/clk-uniphier-cpugear.c      | 2 +-
 drivers/clk/uniphier/clk-uniphier-fixed-factor.c | 2 +-
 drivers/clk/uniphier/clk-uniphier-fixed-rate.c   | 2 +-
 drivers/clk/uniphier/clk-uniphier-gate.c         | 2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-cpugear.c b/drivers/clk/uniphier/clk-uniphier-cpugear.c
index a2f01a4da1276903..165c6832b722faa9 100644
--- a/drivers/clk/uniphier/clk-uniphier-cpugear.c
+++ b/drivers/clk/uniphier/clk-uniphier-cpugear.c
@@ -79,7 +79,7 @@ struct clk_hw *uniphier_clk_register_cpugear(struct device *dev,
 				const struct uniphier_clk_cpugear_data *data)
 {
 	struct uniphier_clk_cpugear *gear;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	gear = devm_kzalloc(dev, sizeof(*gear), GFP_KERNEL);
diff --git a/drivers/clk/uniphier/clk-uniphier-fixed-factor.c b/drivers/clk/uniphier/clk-uniphier-fixed-factor.c
index a6a37a6bca3ab047..c86683fce20549d9 100644
--- a/drivers/clk/uniphier/clk-uniphier-fixed-factor.c
+++ b/drivers/clk/uniphier/clk-uniphier-fixed-factor.c
@@ -13,8 +13,8 @@ struct clk_hw *uniphier_clk_register_fixed_factor(struct device *dev,
 						  const char *name,
 			const struct uniphier_clk_fixed_factor_data *data)
 {
+	struct clk_init_data init = {};
 	struct clk_fixed_factor *fix;
-	struct clk_init_data init;
 	int ret;
 
 	fix = devm_kzalloc(dev, sizeof(*fix), GFP_KERNEL);
diff --git a/drivers/clk/uniphier/clk-uniphier-fixed-rate.c b/drivers/clk/uniphier/clk-uniphier-fixed-rate.c
index 3bc55ab75314bf8d..63f49d3bab80bae8 100644
--- a/drivers/clk/uniphier/clk-uniphier-fixed-rate.c
+++ b/drivers/clk/uniphier/clk-uniphier-fixed-rate.c
@@ -13,8 +13,8 @@ struct clk_hw *uniphier_clk_register_fixed_rate(struct device *dev,
 						const char *name,
 				const struct uniphier_clk_fixed_rate_data *data)
 {
+	struct clk_init_data init = {};
 	struct clk_fixed_rate *fixed;
-	struct clk_init_data init;
 	int ret;
 
 	/* allocate fixed-rate clock */
diff --git a/drivers/clk/uniphier/clk-uniphier-gate.c b/drivers/clk/uniphier/clk-uniphier-gate.c
index e58093e79dd7dc23..9f49e6bb6b2042f7 100644
--- a/drivers/clk/uniphier/clk-uniphier-gate.c
+++ b/drivers/clk/uniphier/clk-uniphier-gate.c
@@ -61,8 +61,8 @@ struct clk_hw *uniphier_clk_register_gate(struct device *dev,
 					  const char *name,
 				const struct uniphier_clk_gate_data *data)
 {
+	struct clk_init_data init = {};
 	struct uniphier_clk_gate *gate;
-	struct clk_init_data init;
 	int ret;
 
 	gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
diff --git a/drivers/clk/uniphier/clk-uniphier-mux.c b/drivers/clk/uniphier/clk-uniphier-mux.c
index 1998e9d4cfc0224a..a63ad4df8e65ebcf 100644
--- a/drivers/clk/uniphier/clk-uniphier-mux.c
+++ b/drivers/clk/uniphier/clk-uniphier-mux.c
@@ -58,8 +58,8 @@ struct clk_hw *uniphier_clk_register_mux(struct device *dev,
 					 const char *name,
 				const struct uniphier_clk_mux_data *data)
 {
+	struct clk_init_data init = {};
 	struct uniphier_clk_mux *mux;
-	struct clk_init_data init;
 	int ret;
 
 	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
-- 
2.43.0

