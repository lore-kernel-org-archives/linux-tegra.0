Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC723546F9;
	Fri, 21 Aug 2026 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302677; cv=none; b=QLCsQPv+mgXqxuyb4VnH24hxUdJkfMFiOUu3appNBDLIXCK2JDxBnZs8YVz57vTysm/MC8mrN2yGzsTcnD/5eoy1C0o4xAgVI+DxyNetIOc6HJjOEtm0aJrmdtPzdPl1E4m1XOM355Y7stVPc5sJdA035e612Z2yVnZfC68Xa44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302677; c=relaxed/simple;
	bh=hz+QonUpA2QFaXbcBpJu1m5xqlS9BFG0jMXkHbxswyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atxbsdZEut86fg0LCOfHv2w4FCPrMx2nYgRy4pwQ3w5kYAo39SltAZLwXVBwErPdg/+KXPqlkRLq3NA5paaO9ULQHBQy438mTVfBXfQx2YhQDt4PPaumOcrBwCDcQ8+qQFKZCvSj2ksTLf/3Kf2v33Tk5embCb4yqkNkheGVwXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73351F000E9;
	Fri, 21 Aug 2026 08:57:38 +0000 (UTC)
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
Subject: [PATCH 14/45] clk: ingenic: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:53:24 +0200
Message-ID: <e3a8b277773f46eb200f3c4bac98ee380f3a24bc.1787239813.git.geert+renesas@glider.be>
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
 drivers/clk/ingenic/cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 41e4c69131bd6ec7..ad223aa20e8db5a5 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -644,8 +644,8 @@ static const struct clk_ops ingenic_clk_ops = {
 static int ingenic_register_clock(struct ingenic_cgu *cgu, unsigned idx)
 {
 	const struct ingenic_cgu_clk_info *clk_info = &cgu->clock_info[idx];
-	struct clk_init_data clk_init;
 	struct ingenic_clk *ingenic_clk = NULL;
+	struct clk_init_data clk_init = {};
 	struct clk *clk, *parent;
 	const char *parent_names[4];
 	unsigned caps, i, num_possible;
-- 
2.43.0

