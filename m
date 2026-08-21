Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06533448CE6;
	Fri, 21 Aug 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302756; cv=none; b=eTjwBOd1DtPKufMLlDRGdA1z5NqgnCVUb+Sh9JXorU2xG+OpKb1rp3qmlAohDsSrtgoSatHR+G0c6oGW3fYEUwsYFamwjz86dDsuCN437lL1DFhcc/p+44cjGOSpvylji6kjOPCbq3dErJlrVH0oJKm3kMA5PUiK2/eyhHU53Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302756; c=relaxed/simple;
	bh=5VEghHVcDMM/o2V6qoh39j5dMcKHwVygyEeZ4iC5sr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foVw7WNAl4ZNGiKzhaMjSdfUtgHEEDRdv7hoCb7bbbcW8BAirO5aeSsl54auAQKrbOjiofbg5ROje2GPB9G6jyDPlHGLv7y8ePXH/9+KOsRnzoOMT5zrbl6O9sEu+eU9K6ztusL5186/mZyxullhbfRRltgt9vznGaIKKHOzDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C821F00A3E;
	Fri, 21 Aug 2026 08:58:56 +0000 (UTC)
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
Subject: [PATCH 19/45] clk: mmp: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:29 +0200
Message-ID: <c794be8edca2c373b12e925b101f7e298012e5d6.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/mmp/clk-apbc.c | 2 +-
 drivers/clk/mmp/clk-apmu.c | 2 +-
 drivers/clk/mmp/clk-frac.c | 2 +-
 drivers/clk/mmp/clk-gate.c | 2 +-
 drivers/clk/mmp/clk-mix.c  | 2 +-
 drivers/clk/mmp/clk-pll.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mmp/clk-apbc.c b/drivers/clk/mmp/clk-apbc.c
index 84532ce8fd09431c..338ccd8fe99ca644 100644
--- a/drivers/clk/mmp/clk-apbc.c
+++ b/drivers/clk/mmp/clk-apbc.c
@@ -120,9 +120,9 @@ struct clk *mmp_clk_register_apbc(const char *name, const char *parent_name,
 		void __iomem *base, unsigned int delay,
 		unsigned int apbc_flags, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct clk_apbc *apbc;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	apbc = kzalloc_obj(*apbc);
 	if (!apbc)
diff --git a/drivers/clk/mmp/clk-apmu.c b/drivers/clk/mmp/clk-apmu.c
index 30bbac1deca14289..887854d8f5b1d645 100644
--- a/drivers/clk/mmp/clk-apmu.c
+++ b/drivers/clk/mmp/clk-apmu.c
@@ -65,9 +65,9 @@ static const struct clk_ops clk_apmu_ops = {
 struct clk *mmp_clk_register_apmu(const char *name, const char *parent_name,
 		void __iomem *base, u32 enable_mask, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct clk_apmu *apmu;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	apmu = kzalloc_obj(*apmu);
 	if (!apmu)
diff --git a/drivers/clk/mmp/clk-frac.c b/drivers/clk/mmp/clk-frac.c
index 13bfc4c99f3ae5b9..5774354563aa672d 100644
--- a/drivers/clk/mmp/clk-frac.c
+++ b/drivers/clk/mmp/clk-frac.c
@@ -171,8 +171,8 @@ struct clk *mmp_clk_register_factor(const char *name, const char *parent_name,
 		struct mmp_clk_factor_masks *masks,
 		struct u32_fract *ftbl, unsigned int ftbl_cnt, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct mmp_clk_factor *factor;
-	struct clk_init_data init;
 	struct clk *clk;
 
 	if (!masks) {
diff --git a/drivers/clk/mmp/clk-gate.c b/drivers/clk/mmp/clk-gate.c
index cc2f841ae9d96316..e8dad4ed0125ef7a 100644
--- a/drivers/clk/mmp/clk-gate.c
+++ b/drivers/clk/mmp/clk-gate.c
@@ -94,9 +94,9 @@ struct clk *mmp_clk_register_gate(struct device *dev, const char *name,
 		void __iomem *reg, u32 mask, u32 val_enable, u32 val_disable,
 		unsigned int gate_flags, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct mmp_clk_gate *gate;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	/* allocate the gate */
 	gate = kzalloc_obj(*gate);
diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index b1c9899c71afba0c..2f3d1cb6f836c6c6 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -444,9 +444,9 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 					struct mmp_clk_mix_config *config,
 					spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct mmp_clk_mix *mix;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	mix = kzalloc_obj(*mix);
 	if (!mix)
diff --git a/drivers/clk/mmp/clk-pll.c b/drivers/clk/mmp/clk-pll.c
index 430f5e3c8540e863..e0ea29b5bb66cf98 100644
--- a/drivers/clk/mmp/clk-pll.c
+++ b/drivers/clk/mmp/clk-pll.c
@@ -104,9 +104,9 @@ static struct clk *mmp_clk_register_pll(char *name,
 			unsigned long input_rate,
 			void __iomem *postdiv_reg, u8 postdiv_shift)
 {
+	struct clk_init_data init = {};
 	struct mmp_clk_pll *pll;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	pll = kzalloc_obj(*pll);
 	if (!pll)
-- 
2.43.0

