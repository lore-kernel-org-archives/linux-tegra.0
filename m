Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7D3AE6F5;
	Fri, 21 Aug 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302648; cv=none; b=NXTDrBa/ghIBsr2qpZWbNnvVuIIWfwMnAo+hltPbXlPx5c/06hZ7ms50WmiPZH1Sg+G0ztj2nyaQP39EPYAt53FR26VzV1zymVvQP71Nc6sHKVbmYkWjSBd73Uj1j1tEqUROSTiRBX4PTWxZwLeleb3Erq8OreenvU61OK0vDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302648; c=relaxed/simple;
	bh=14qbOKX2POfHRCCKv8XV9G5vx+HLhR+Dx8EA2U7a0HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFqtP+4anLuJyH4QhkKi5L34rrVaUUkQp3y6gJ77vVPcmSwdyxIQyOfHbFEGFYhLNFOzaGp5R98WEwfSjy3WIcGdtmGlj1vOitvPq+sv2Qu18tHwHcEAHVD79DifqNraPekLRWtb63eJ/KgqQaUxnzjESV1sQmkfZ7+SeRZYA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6C41F000E9;
	Fri, 21 Aug 2026 08:57:08 +0000 (UTC)
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
Subject: [PATCH 12/45] clk: hisilicon: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:22 +0200
Message-ID: <04ef5b163e1ae63ffd6b568d3544c482b43f347f.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/hisilicon/clk-hi3559a.c       | 2 +-
 drivers/clk/hisilicon/clk-hi3620.c        | 2 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c   | 2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c    | 2 +-
 drivers/clk/hisilicon/clk-hix5hd2.c       | 2 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c | 2 +-
 drivers/clk/hisilicon/clkgate-separated.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3559a.c b/drivers/clk/hisilicon/clk-hi3559a.c
index f297fb25c512a322..fea6fb9e98f59a86 100644
--- a/drivers/clk/hisilicon/clk-hi3559a.c
+++ b/drivers/clk/hisilicon/clk-hi3559a.c
@@ -456,8 +456,8 @@ static void hisi_clk_register_pll(struct hi3559av100_pll_clock *clks,
 {
 	void __iomem *base = data->base;
 	struct hi3559av100_clk_pll *p_clk = NULL;
+	struct clk_init_data init = {};
 	struct clk *clk = NULL;
-	struct clk_init_data init;
 	int i;
 
 	p_clk = devm_kcalloc(dev, nums, sizeof(*p_clk), GFP_KERNEL);
diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index 8dcad74e679aa462..a2c4637eaa9880d5 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -410,9 +410,9 @@ static const struct clk_ops clk_mmc_ops = {
 static struct clk *hisi_register_clk_mmc(struct hisi_mmc_clock *mmc_clk,
 			void __iomem *base, struct device_node *np)
 {
+	struct clk_init_data init = {};
 	struct clk_mmc *mclk;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	mclk = kzalloc_obj(*mclk);
 	if (!mclk)
diff --git a/drivers/clk/hisilicon/clk-hi6220-stub.c b/drivers/clk/hisilicon/clk-hi6220-stub.c
index bf99cfafafa0133d..a70544d2bdb9a805 100644
--- a/drivers/clk/hisilicon/clk-hi6220-stub.c
+++ b/drivers/clk/hisilicon/clk-hi6220-stub.c
@@ -195,7 +195,7 @@ static const struct clk_ops hi6220_stub_clk_ops = {
 static int hi6220_stub_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct hi6220_stub_clk *stub_clk;
 	struct clk *clk;
 	struct device_node *np = pdev->dev.of_node;
diff --git a/drivers/clk/hisilicon/clk-hisi-phase.c b/drivers/clk/hisilicon/clk-hisi-phase.c
index ba6afad66a2b0c25..d8e555d9728de9ad 100644
--- a/drivers/clk/hisilicon/clk-hisi-phase.c
+++ b/drivers/clk/hisilicon/clk-hisi-phase.c
@@ -94,8 +94,8 @@ struct clk *clk_register_hisi_phase(struct device *dev,
 		const struct hisi_phase_clock *clks,
 		void __iomem *base, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct clk_hisi_phase *phase;
-	struct clk_init_data init;
 
 	phase = devm_kzalloc(dev, sizeof(struct clk_hisi_phase), GFP_KERNEL);
 	if (!phase)
diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
index 57db6fab43aacd41..4b7ebebfac4be608 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -258,8 +258,8 @@ hix5hd2_clk_register_complex(struct hix5hd2_complex_clock *clks, int nums,
 
 	for (i = 0; i < nums; i++) {
 		struct hix5hd2_clk_complex *p_clk;
+		struct clk_init_data init = {};
 		struct clk *clk;
-		struct clk_init_data init;
 
 		p_clk = kzalloc_obj(*p_clk);
 		if (!p_clk)
diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
index 20a337383a1e1fea..cc53d0a33e3c4e92 100644
--- a/drivers/clk/hisilicon/clkdivider-hi6220.c
+++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
@@ -103,7 +103,7 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 {
 	struct hi6220_clk_divider *div;
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_div_table *table;
 	u32 max_div, min_div;
 	int i;
diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
index 199303157ebd84da..e02d6bb5ada79a3c 100644
--- a/drivers/clk/hisilicon/clkgate-separated.c
+++ b/drivers/clk/hisilicon/clkgate-separated.c
@@ -87,8 +87,8 @@ struct clk *hisi_register_clkgate_sep(struct device *dev, const char *name,
 				      u8 clk_gate_flags, spinlock_t *lock)
 {
 	struct clkgate_separated *sclk;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 
 	sclk = kzalloc_obj(*sclk);
 	if (!sclk)
-- 
2.43.0

