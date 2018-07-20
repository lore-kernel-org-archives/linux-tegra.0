From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 6/8] clk: tegra30: add 2d and 3d idle clocks
Date: Fri, 20 Jul 2018 14:45:30 +0100
Message-ID: <20180720134532.13148-7-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

The 2D and 3D clocks have an IDLE field in bits 15:8 so add these
clocks by making a 2D and 3D mux, and split the divider into the
standard 2D/3D ones and 2D/3D idle clocks.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk-id.h              |  4 ++++
 drivers/clk/tegra/clk-tegra-periph.c    | 23 +++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra30.c         |  8 ++++++++
 include/dt-bindings/clock/tegra30-car.h |  7 ++++++-
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index b616e33c5255..0d202a70ce66 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -91,8 +91,12 @@ enum clk_id {
 	tegra_clk_fuse_burn,
 	tegra_clk_gpu,
 	tegra_clk_gr2d,
+	tegra_clk_gr2d_mux,
+	tegra_clk_gr2d_idle,
 	tegra_clk_gr2d_8,
 	tegra_clk_gr3d,
+	tegra_clk_gr3d_mux,
+	tegra_clk_gr3d_idle,
 	tegra_clk_gr3d_8,
 	tegra_clk_hclk,
 	tegra_clk_hda,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 47e5b1ac1a69..83967dac93f2 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -263,6 +263,21 @@
 		.flags = _flags,					\
 	}
 
+#define GATE_DIV(_name, _parent_name, _offset,				\
+		 _div_shift, _div_width, _div_frac_width, _div_flags,	\
+			     _clk_num, _gate_flags,  _clk_id, _flags)	\
+	{								\
+		.name = _name,						\
+		.clk_id = _clk_id,					\
+		.offset = _offset,					\
+		.p.parent_name =  _parent_name,				\
+		.periph = TEGRA_CLK_PERIPH(0, 0, 0,			\
+					   _div_shift, _div_width,	\
+					   _div_frac_width, _div_flags, \
+				_clk_num, _gate_flags, NULL, NULL),	\
+		.flags = _flags						\
+	}
+
 #define PLLP_BASE 0xa0
 #define PLLP_MISC 0xac
 #define PLLP_MISC1 0x680
@@ -646,8 +661,12 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
 	MUX("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x),
 	MUX("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60, 0, tegra_clk_mpe),
-	MUX("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d),
-	MUX("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d),
+	MUX("2d_mux", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 0, TEGRA_PERIPH_NO_DIV | TEGRA_PERIPH_NO_RESET | TEGRA_PERIPH_NO_GATE, tegra_clk_gr2d_mux),
+	GATE_DIV("2d", "2d_mux", CLK_SOURCE_2D, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP,21, 0, tegra_clk_gr2d, 0),
+	GATE_DIV("2d_idle", "2d_mux", CLK_SOURCE_2D, 8, 8, 1, TEGRA_DIVIDER_ROUND_UP, 0, TEGRA_PERIPH_NO_GATE | TEGRA_PERIPH_NO_RESET, tegra_clk_gr2d_idle, 0),
+	MUX("3d_mux", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 0, TEGRA_PERIPH_NO_DIV | TEGRA_PERIPH_NO_RESET | TEGRA_PERIPH_NO_GATE, tegra_clk_gr3d_mux),
+	GATE_DIV("3d", "3d_mux", CLK_SOURCE_3D, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 24, 0, tegra_clk_gr3d, 0),
+	GATE_DIV("3d_idle", "3d_mux", CLK_SOURCE_3D, 8, 8, 1, TEGRA_DIVIDER_ROUND_UP, 0, TEGRA_PERIPH_NO_GATE | TEGRA_PERIPH_NO_RESET, tegra_clk_gr3d_idle, 0),
 	INT8("vde", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla_pllc4, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_9),
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index acfe661b2ae7..227d3643ecca 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -658,8 +658,12 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .dev_id = "mpe", .dt_id = TEGRA30_CLK_MPE },
 	{ .dev_id = "host1x", .dt_id = TEGRA30_CLK_HOST1X },
 	{ .dev_id = "3d", .dt_id = TEGRA30_CLK_GR3D },
+	{ .dev_id = "3d", .con_id = "mux", .dt_id = TEGRA30_CLK_GR3D_MUX },
+	{ .dev_id = "3d", .con_id = "idle", .dt_id = TEGRA30_CLK_GR3D_IDLE },
 	{ .dev_id = "3d2", .dt_id = TEGRA30_CLK_GR3D2 },
 	{ .dev_id = "2d", .dt_id = TEGRA30_CLK_GR2D },
+	{ .dev_id = "2d", .con_id = "mux", .dt_id = TEGRA30_CLK_GR2D_MUX },
+	{ .dev_id = "2d", .con_id = "idle", .dt_id = TEGRA30_CLK_GR2D_IDLE },
 	{ .dev_id = "se", .dt_id = TEGRA30_CLK_SE },
 	{ .dev_id = "mselect", .dt_id = TEGRA30_CLK_MSELECT },
 	{ .dev_id = "tegra-nor", .dt_id = TEGRA30_CLK_NOR },
@@ -762,6 +766,10 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_host1x] = { .dt_id = TEGRA30_CLK_HOST1X, .present = true },
 	[tegra_clk_gr2d] = { .dt_id = TEGRA30_CLK_GR2D, .present = true },
 	[tegra_clk_gr3d] = { .dt_id = TEGRA30_CLK_GR3D, .present = true },
+	[tegra_clk_gr2d_mux] = { .dt_id = TEGRA30_CLK_GR2D_MUX, .present = true },
+	[tegra_clk_gr3d_mux] = { .dt_id = TEGRA30_CLK_GR3D_MUX, .present = true },
+	[tegra_clk_gr2d_idle] = { .dt_id = TEGRA30_CLK_GR2D_IDLE, .present = true },
+	[tegra_clk_gr3d_idle] = { .dt_id = TEGRA30_CLK_GR3D_IDLE, .present = true },
 	[tegra_clk_mselect] = { .dt_id = TEGRA30_CLK_MSELECT, .present = true },
 	[tegra_clk_nor] = { .dt_id = TEGRA30_CLK_NOR, .present = true },
 	[tegra_clk_sdmmc1] = { .dt_id = TEGRA30_CLK_SDMMC1, .present = true },
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index 3c90f1535551..eda4ca60351e 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -269,6 +269,11 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+
+#define TEGRA30_CLK_GR2D_MUX	309
+#define TEGRA30_CLK_GR3D_MUX	310
+#define TEGRA30_CLK_GR2D_IDLE	311
+#define TEGRA30_CLK_GR3D_IDLE	312
+#define TEGRA30_CLK_CLK_MAX 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.18.0
