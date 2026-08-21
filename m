Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033533AE6F5;
	Fri, 21 Aug 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302477; cv=none; b=GbeKFWvtTSO29VpACxGiHQO7oqO7SbXfYDIUaUnjiPT3jW6Vu95Hsi/LK4em/bRwMRGeAfyONojEgv+bNzOejEaSC1cJYQyvu+xkfQ6KSGIUJ/DPJWYWL/Dv8xGEneyhOk6RzeiyPIOHrAwFq9BEk6PPwZAjkMNHbLaoHzxN48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302477; c=relaxed/simple;
	bh=uv9NAhUELaCrHm4TyUUfw9jLoYul/ZrMHyB98EttRFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QskDLW6hED7VK4zEpZyNiz2jHpQRAizkAK93FhrNu66htfVJ33ly4sgJzLcr75TLX9ynm0ypPgQFex5h8LA30qga8fML4r6wdXrjIdexnDcDzHLZ2sbdOQvt1h5EXCwi+P8gdAgCUTSTqHCHbfkiuU8W6xS03X0JKEicwfLEnEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57EA1F00A3A;
	Fri, 21 Aug 2026 08:54:20 +0000 (UTC)
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
Subject: [PATCH 01/45] clk: aspeed: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:11 +0200
Message-ID: <029b50dbb60753ef1e27045fc379802930c4085e.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/aspeed/clk-aspeed.c  | 2 +-
 drivers/clk/aspeed/clk-ast2600.c | 2 +-
 drivers/clk/aspeed/clk-ast2700.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/aspeed/clk-aspeed.c b/drivers/clk/aspeed/clk-aspeed.c
index 38a5766a435ca27f..d32a3e9f300a2d74 100644
--- a/drivers/clk/aspeed/clk-aspeed.c
+++ b/drivers/clk/aspeed/clk-aspeed.c
@@ -349,8 +349,8 @@ static struct clk_hw *aspeed_clk_hw_register_gate(struct device *dev,
 		struct regmap *map, u8 clock_idx, u8 reset_idx,
 		u8 clk_gate_flags, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct aspeed_clk_gate *gate;
-	struct clk_init_data init;
 	struct clk_hw *hw;
 	int ret;
 
diff --git a/drivers/clk/aspeed/clk-ast2600.c b/drivers/clk/aspeed/clk-ast2600.c
index 70061c961b69eccc..cc3d26602b16eba7 100644
--- a/drivers/clk/aspeed/clk-ast2600.c
+++ b/drivers/clk/aspeed/clk-ast2600.c
@@ -425,8 +425,8 @@ static struct clk_hw *aspeed_g6_clk_hw_register_gate(struct device *dev,
 		struct regmap *map, u8 clock_idx, u8 reset_idx,
 		u8 clk_gate_flags, spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct aspeed_clk_gate *gate;
-	struct clk_init_data init;
 	struct clk_hw *hw;
 	int ret;
 
diff --git a/drivers/clk/aspeed/clk-ast2700.c b/drivers/clk/aspeed/clk-ast2700.c
index 536600fcd0244e59..495b7fa3395b2106 100644
--- a/drivers/clk/aspeed/clk-ast2700.c
+++ b/drivers/clk/aspeed/clk-ast2700.c
@@ -824,7 +824,7 @@ static struct clk_hw *ast2700_clk_hw_register_gate(struct device *dev, const cha
 						   void __iomem *reg, u8 clock_idx,
 						   unsigned long flags, spinlock_t *lock)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_gate *gate;
 	struct clk_hw *hw;
 	int ret = -EINVAL;
-- 
2.43.0

