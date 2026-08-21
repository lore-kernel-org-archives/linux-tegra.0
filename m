Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC55845A2AD;
	Fri, 21 Aug 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303154; cv=none; b=oV+v08feGlhzxBevHr108s1OgTEz+iLP3/iWFRb5ZL1+K3K5ZgrKcVUGB/MXIehHAM7hzTatP1fOMMfNve7gKrB6BY4PaqVfjORXBsGZjVbRLgzO0jBPPimA9D0bacJZdNWQcPSopcBACE367D5ROrj93u2GRn/RowYcu5GHkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303154; c=relaxed/simple;
	bh=BoVDFLjm3qmryxpWKKtPiB9xGLwmcZ8bdHtjqA34dYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRL7+mmiS5ceIHiEQj9rH6TOU9bd11/V60QxzEudxf56JRbvrevGpPPTGv04UTpfQp6Ys7FXrP/6cJObGZef9SI/MxYQmhdGoW30/R6cMMuChh0cMyE4nfwROb3do3mtvksGHAC4or+4Zmu8vheT2QqyUiRtWn3Xi+3txLCZwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5598F1F000E9;
	Fri, 21 Aug 2026 09:05:30 +0000 (UTC)
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
Subject: [PATCH 45/45] clk: zynqmp: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:55 +0200
Message-ID: <ca5b863571e9e21d123ab95cd5667b19f0d14d96.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/zynqmp/clk-gate-zynqmp.c | 2 +-
 drivers/clk/zynqmp/clk-mux-zynqmp.c  | 2 +-
 drivers/clk/zynqmp/divider.c         | 2 +-
 drivers/clk/zynqmp/pll.c             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
index db10eb69f3fe01a5..1a462af7b8ea3efa 100644
--- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
@@ -109,10 +109,10 @@ struct clk_hw *zynqmp_clk_register_gate(const char *name, u32 clk_id,
 					u8 num_parents,
 					const struct clock_topology *nodes)
 {
+	struct clk_init_data init = {};
 	struct zynqmp_clk_gate *gate;
 	struct clk_hw *hw;
 	int ret;
-	struct clk_init_data init;
 
 	/* allocate the gate */
 	gate = kzalloc_obj(*gate);
diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index e37bd3516974c1ee..79509e387b51fe40 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -133,9 +133,9 @@ struct clk_hw *zynqmp_clk_register_mux(const char *name, u32 clk_id,
 				       u8 num_parents,
 				       const struct clock_topology *nodes)
 {
+	struct clk_init_data init = {};
 	struct zynqmp_clk_mux *mux;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	mux = kzalloc_obj(*mux);
diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 4075f6ecf076a8e6..3eabd1cf211ddba3 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -278,9 +278,9 @@ struct clk_hw *zynqmp_clk_register_divider(const char *name,
 					   u8 num_parents,
 					   const struct clock_topology *nodes)
 {
+	struct clk_init_data init = {};
 	struct zynqmp_clk_divider *div;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	/* allocate the divider */
diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 6463787cf57b6018..6158386ca743d1f8 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -313,9 +313,9 @@ struct clk_hw *zynqmp_clk_register_pll(const char *name, u32 clk_id,
 				       u8 num_parents,
 				       const struct clock_topology *nodes)
 {
+	struct clk_init_data init = {};
 	struct zynqmp_pll *pll;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	init.name = name;
-- 
2.43.0

