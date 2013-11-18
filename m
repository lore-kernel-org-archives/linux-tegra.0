From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] clk: tegra: add TEGRA_PERIPH_NO_GATE
Date: Mon, 18 Nov 2013 16:11:38 +0100
Message-ID: <1384787499-26994-4-git-send-email-treding@nvidia.com>
References: <1384787499-26994-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384787499-26994-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra124 has a clock which consists of a mux and a fractional divider.
Add support for this.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-periph.c       | 18 +++++++++++++++---
 drivers/clk/tegra/clk-tegra-periph.c |  6 ++++++
 drivers/clk/tegra/clk.h              |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index b5feccca2f1e..d62b396863c1 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -170,6 +170,14 @@ const struct clk_ops tegra_clk_periph_nodiv_ops = {
 	.disable = clk_periph_disable,
 };
 
+const struct clk_ops tegra_clk_periph_no_gate_ops = {
+	.get_parent = clk_periph_get_parent,
+	.set_parent = clk_periph_set_parent,
+	.recalc_rate = clk_periph_recalc_rate,
+	.round_rate = clk_periph_round_rate,
+	.set_rate = clk_periph_set_rate,
+};
+
 static struct clk *_tegra_clk_register_periph(const char *name,
 			const char **parent_names, int num_parents,
 			struct tegra_clk_periph *periph,
@@ -181,11 +189,15 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	struct tegra_clk_periph_regs *bank;
 	bool div = !(periph->gate.flags & TEGRA_PERIPH_NO_DIV);
 
-	flags |= periph->gate.flags & TEGRA_PERIPH_NO_DIV ?
-			CLK_SET_RATE_PARENT : 0;
+	if (periph->gate.flags & TEGRA_PERIPH_NO_DIV) {
+		flags |= CLK_SET_RATE_PARENT;
+		init.ops = &tegra_clk_periph_nodiv_ops;
+	} else if (periph->gate.flags & TEGRA_PERIPH_NO_GATE)
+		init.ops = &tegra_clk_periph_no_gate_ops;
+	else
+		init.ops = &tegra_clk_periph_ops;
 
 	init.name = name;
-	init.ops = div ? &tegra_clk_periph_ops : &tegra_clk_periph_nodiv_ops;
 	init.flags = flags;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 18509821fdc4..d3978e734ad6 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -147,6 +147,12 @@
 			29, MASK(3), 0, 0, 8, 1, 0, _clk_num,	\
 			_gate_flags, _clk_id, _parents##_idx, 0, NULL)
 
+#define MUX8_NOGATE_LOCK(_name, _parents, _offset, _clk_id, _lock)	\
+	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,	\
+			      29, MASK(3), 0, 0, 8, 1, 0, 0,		\
+			      TEGRA_PERIPH_NO_GATE, _clk_id,		\
+			      _parents##_idx, 0, _lock)
+
 #define INT(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index f984ebed9f1f..40fb011233c0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -391,6 +391,7 @@ struct tegra_clk_periph_gate {
 #define TEGRA_PERIPH_ON_APB BIT(2)
 #define TEGRA_PERIPH_WAR_1005168 BIT(3)
 #define TEGRA_PERIPH_NO_DIV BIT(4)
+#define TEGRA_PERIPH_NO_GATE BIT(5)
 
 void tegra_periph_reset(struct tegra_clk_periph_gate *gate, bool assert);
 extern const struct clk_ops tegra_clk_periph_gate_ops;
-- 
1.8.4.2
