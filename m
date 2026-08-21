Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0164499B6;
	Fri, 21 Aug 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302795; cv=none; b=B8FD3a5SmeM/miG0k98hlbw5z6FUF6pzpUI3aQvjjguaMPPnIOCyMPeRa7h1DeZyGU4w2sFWOD3n1lL6hh150l8XtSuyBzW3EP36rZvK53qZTX9njDwip6g1WJP1K7IUflXn1QORTWuP7iWZR8+R5Yk3MbsB6gpAxmNxW40F8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302795; c=relaxed/simple;
	bh=A7m7H1x/Xe6taMVB1SI8InH3sCQzArNKhp5r/8NFhuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bzkm+DrPJeVynjDCthxeH5YiFom1k4xCZxF/I6kiIx19mKL7b5+tG6/tzcW9m0umL+/AFK6pWX+F8wE6s4tpmG7EEyHMeYZmJvtQiehYpAb3rx9QCY2O2WA0WRSD+YFbGj5RWTnBIW22xpexK+JRew1IZ+ze4xNoPiuNd+REBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679A61F00A3A;
	Fri, 21 Aug 2026 08:59:28 +0000 (UTC)
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
Subject: [PATCH 21/45] clk: mxs: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:31 +0200
Message-ID: <b6aed754c64c4709646cac9cafaf57825af67c6a.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/mxs/clk-div.c  | 2 +-
 drivers/clk/mxs/clk-frac.c | 2 +-
 drivers/clk/mxs/clk-pll.c  | 2 +-
 drivers/clk/mxs/clk-ref.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mxs/clk-div.c b/drivers/clk/mxs/clk-div.c
index fe7224162b3cc0fa..d4ee785c651190f0 100644
--- a/drivers/clk/mxs/clk-div.c
+++ b/drivers/clk/mxs/clk-div.c
@@ -70,9 +70,9 @@ static const struct clk_ops clk_div_ops = {
 struct clk *mxs_clk_div(const char *name, const char *parent_name,
 			void __iomem *reg, u8 shift, u8 width, u8 busy)
 {
+	struct clk_init_data init = {};
 	struct clk_div *div;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	div = kzalloc_obj(*div);
 	if (!div)
diff --git a/drivers/clk/mxs/clk-frac.c b/drivers/clk/mxs/clk-frac.c
index 52eb82fde322dcc4..e317710ab503a84a 100644
--- a/drivers/clk/mxs/clk-frac.c
+++ b/drivers/clk/mxs/clk-frac.c
@@ -112,9 +112,9 @@ static const struct clk_ops clk_frac_ops = {
 struct clk *mxs_clk_frac(const char *name, const char *parent_name,
 			 void __iomem *reg, u8 shift, u8 width, u8 busy)
 {
+	struct clk_init_data init = {};
 	struct clk_frac *frac;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	frac = kzalloc_obj(*frac);
 	if (!frac)
diff --git a/drivers/clk/mxs/clk-pll.c b/drivers/clk/mxs/clk-pll.c
index 581868e0693c6e5e..5acf48cddbb2859f 100644
--- a/drivers/clk/mxs/clk-pll.c
+++ b/drivers/clk/mxs/clk-pll.c
@@ -82,9 +82,9 @@ static const struct clk_ops clk_pll_ops = {
 struct clk *mxs_clk_pll(const char *name, const char *parent_name,
 			void __iomem *base, u8 power, unsigned long rate)
 {
+	struct clk_init_data init = {};
 	struct clk_pll *pll;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	pll = kzalloc_obj(*pll);
 	if (!pll)
diff --git a/drivers/clk/mxs/clk-ref.c b/drivers/clk/mxs/clk-ref.c
index 9667d4d3c2a885eb..66ea1c229014ed60 100644
--- a/drivers/clk/mxs/clk-ref.c
+++ b/drivers/clk/mxs/clk-ref.c
@@ -113,9 +113,9 @@ static const struct clk_ops clk_ref_ops = {
 struct clk *mxs_clk_ref(const char *name, const char *parent_name,
 			void __iomem *reg, u8 idx)
 {
+	struct clk_init_data init = {};
 	struct clk_ref *ref;
 	struct clk *clk;
-	struct clk_init_data init;
 
 	ref = kzalloc_obj(*ref);
 	if (!ref)
-- 
2.43.0

