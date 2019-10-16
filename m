From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/5] clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
Date: Wed, 16 Oct 2019 14:59:15 +0200
Message-ID: <20191016125919.1773898-2-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191016125919.1773898-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Later SoC generations implement this clock as SOR1_OUT. For consistency,
the Tegra210 implementation was adapted to match the same name in commit
4d1dc4018573 ("dt-bindings: clock: tegra: Add sor1_out clock").

Clean up the remaining pieces by adopting the new name for the internal
identifiers and remove the old alias. Note that since both SOR1_SRC and
SOR1_OUT were referring to the same device tree clock ID, this does not
break device tree ABI.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-id.h               | 2 +-
 drivers/clk/tegra/clk-tegra210.c         | 2 +-
 include/dt-bindings/clock/tegra210-car.h | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index de466b4446da..ae02885c9475 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -238,7 +238,7 @@ enum clk_id {
 	tegra_clk_sor0,
 	tegra_clk_sor0_lvds,
 	tegra_clk_sor1,
-	tegra_clk_sor1_src,
+	tegra_clk_sor1_out,
 	tegra_clk_spdif,
 	tegra_clk_spdif_2x,
 	tegra_clk_spdif_in,
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index df172d5772d7..019287df6c12 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2353,7 +2353,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_sor0] = { .dt_id = TEGRA210_CLK_SOR0, .present = true },
 	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA210_CLK_SOR0_LVDS, .present = true },
 	[tegra_clk_sor1] = { .dt_id = TEGRA210_CLK_SOR1, .present = true },
-	[tegra_clk_sor1_src] = { .dt_id = TEGRA210_CLK_SOR1_SRC, .present = true },
+	[tegra_clk_sor1_out] = { .dt_id = TEGRA210_CLK_SOR1_OUT, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
 	[tegra_clk_pll_g_ref] = { .dt_id = TEGRA210_CLK_PLL_G_REF, .present = true, },
 	[tegra_clk_uartb_8] = { .dt_id = TEGRA210_CLK_UARTB, .present = true },
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 6b77e721f6b1..b43b9e84e62e 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -309,7 +309,6 @@
 #define TEGRA210_CLK_CLK_OUT_3 279
 #define TEGRA210_CLK_BLINK 280
 /* 281 */
-#define TEGRA210_CLK_SOR1_SRC 282
 #define TEGRA210_CLK_SOR1_OUT 282
 /* 283 */
 #define TEGRA210_CLK_XUSB_HOST_SRC 284
-- 
2.23.0
