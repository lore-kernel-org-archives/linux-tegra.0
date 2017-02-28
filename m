From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v3 3/6] clk: tegra: fix constness for periph clks
Date: Tue, 28 Feb 2017 16:37:19 +0200
Message-ID: <1488292648-16876-4-git-send-email-pdeschrijver@nvidia.com>
References: <1488292648-16876-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488292648-16876-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

checkpatch now warns for const ** and expects const * const * to be used
instead. This means we have to update the prototypes and function
declarations to handle this change.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-periph.c | 4 ++--
 drivers/clk/tegra/clk.h        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index a17ca6d..a5a5809 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -138,7 +138,7 @@ static void clk_periph_disable(struct clk_hw *hw)
 };
 
 static struct clk *_tegra_clk_register_periph(const char *name,
-			const char **parent_names, int num_parents,
+			const char * const *parent_names, int num_parents,
 			struct tegra_clk_periph *periph,
 			void __iomem *clk_base, u32 offset,
 			unsigned long flags)
@@ -186,7 +186,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 }
 
 struct clk *tegra_clk_register_periph(const char *name,
-		const char **parent_names, int num_parents,
+		const char * const *parent_names, int num_parents,
 		struct tegra_clk_periph *periph, void __iomem *clk_base,
 		u32 offset, unsigned long flags)
 {
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index a62ea73..8b09021e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -586,7 +586,7 @@ struct tegra_clk_periph {
 
 extern const struct clk_ops tegra_clk_periph_ops;
 struct clk *tegra_clk_register_periph(const char *name,
-		const char **parent_names, int num_parents,
+		const char * const *parent_names, int num_parents,
 		struct tegra_clk_periph *periph, void __iomem *clk_base,
 		u32 offset, unsigned long flags);
 struct clk *tegra_clk_register_periph_nodiv(const char *name,
@@ -626,7 +626,7 @@ struct tegra_periph_init_data {
 	const char *name;
 	int clk_id;
 	union {
-		const char **parent_names;
+		const char *const *parent_names;
 		const char *parent_name;
 	} p;
 	int num_parents;
-- 
1.9.1
