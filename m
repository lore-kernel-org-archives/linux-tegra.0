From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v9 08/14] clk: tegra: Add flags to tegra_clk_periph()
Date: Wed, 3 Apr 2013 17:40:42 +0300
Message-ID: <1365000110-8916-9-git-send-email-pdeschrijver@nvidia.com>
References: <1365000110-8916-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365000110-8916-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

We will need some tegra peripheral clocks with the CLK_IGNORE_UNUSED flag,
most notably mselect, which is a bridge between AXI and most peripherals.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-periph.c  |   11 ++++++-----
 drivers/clk/tegra/clk-tegra20.c |    2 +-
 drivers/clk/tegra/clk-tegra30.c |    2 +-
 drivers/clk/tegra/clk.h         |    9 ++++++---
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 788486e..067abb3 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -170,14 +170,15 @@ const struct clk_ops tegra_clk_periph_nodiv_ops = {
 static struct clk *_tegra_clk_register_periph(const char *name,
 			const char **parent_names, int num_parents,
 			struct tegra_clk_periph *periph,
-			void __iomem *clk_base, u32 offset, bool div)
+			void __iomem *clk_base, u32 offset, bool div,
+			unsigned long flags)
 {
 	struct clk *clk;
 	struct clk_init_data init;
 
 	init.name = name;
 	init.ops = div ? &tegra_clk_periph_ops : &tegra_clk_periph_nodiv_ops;
-	init.flags = div ? 0 : CLK_SET_RATE_PARENT;
+	init.flags = flags;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
@@ -202,10 +203,10 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 struct clk *tegra_clk_register_periph(const char *name,
 		const char **parent_names, int num_parents,
 		struct tegra_clk_periph *periph, void __iomem *clk_base,
-		u32 offset)
+		u32 offset, unsigned long flags)
 {
 	return _tegra_clk_register_periph(name, parent_names, num_parents,
-			periph, clk_base, offset, true);
+			periph, clk_base, offset, true, flags);
 }
 
 struct clk *tegra_clk_register_periph_nodiv(const char *name,
@@ -214,5 +215,5 @@ struct clk *tegra_clk_register_periph_nodiv(const char *name,
 		u32 offset)
 {
 	return _tegra_clk_register_periph(name, parent_names, num_parents,
-			periph, clk_base, offset, false);
+			periph, clk_base, offset, false, CLK_SET_RATE_PARENT);
 }
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index b6a747f..05c4995 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1019,7 +1019,7 @@ static void __init tegra20_periph_clk_init(void)
 		data = &tegra_periph_clk_list[i];
 		clk = tegra_clk_register_periph(data->name, data->parent_names,
 				data->num_parents, &data->periph,
-				clk_base, data->offset);
+				clk_base, data->offset, data->flags);
 		clk_register_clkdev(clk, data->con_id, data->dev_id);
 		clks[data->clk_id] = clk;
 	}
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 9c43bb4..7e749b0 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1668,7 +1668,7 @@ static void __init tegra30_periph_clk_init(void)
 		data = &tegra_periph_clk_list[i];
 		clk = tegra_clk_register_periph(data->name, data->parent_names,
 				data->num_parents, &data->periph,
-				clk_base, data->offset);
+				clk_base, data->offset, data->flags);
 		clk_register_clkdev(clk, data->con_id, data->dev_id);
 		clks[data->clk_id] = clk;
 	}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 8cedb09..fd12b77 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -417,7 +417,7 @@ extern const struct clk_ops tegra_clk_periph_ops;
 struct clk *tegra_clk_register_periph(const char *name,
 		const char **parent_names, int num_parents,
 		struct tegra_clk_periph *periph, void __iomem *clk_base,
-		u32 offset);
+		u32 offset, unsigned long flags);
 struct clk *tegra_clk_register_periph_nodiv(const char *name,
 		const char **parent_names, int num_parents,
 		struct tegra_clk_periph *periph, void __iomem *clk_base,
@@ -460,12 +460,14 @@ struct tegra_periph_init_data {
 	u32 offset;
 	const char *con_id;
 	const char *dev_id;
+	unsigned long flags;
 };
 
 #define TEGRA_INIT_DATA_TABLE(_name, _con_id, _dev_id, _parent_names, _offset,\
 			_mux_shift, _mux_mask, _mux_flags, _div_shift,	\
 			_div_width, _div_frac_width, _div_flags, _regs,	\
-			_clk_num, _enb_refcnt, _gate_flags, _clk_id, _table) \
+			_clk_num, _enb_refcnt, _gate_flags, _clk_id, _table,\
+			_flags) \
 	{								\
 		.name = _name,						\
 		.clk_id = _clk_id,					\
@@ -480,6 +482,7 @@ struct tegra_periph_init_data {
 		.offset = _offset,					\
 		.con_id = _con_id,					\
 		.dev_id = _dev_id,					\
+		.flags = _flags						\
 	}
 
 #define TEGRA_INIT_DATA(_name, _con_id, _dev_id, _parent_names, _offset,\
@@ -490,7 +493,7 @@ struct tegra_periph_init_data {
 			_mux_shift, BIT(_mux_width) - 1, _mux_flags,	\
 			_div_shift, _div_width, _div_frac_width, _div_flags, \
 			_regs, _clk_num, _enb_refcnt, _gate_flags, _clk_id,\
-			NULL)
+			NULL, 0)
 
 /**
  * struct clk_super_mux - super clock
-- 
1.7.7.rc0.72.g4b5ea.dirty
