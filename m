From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/4] clk: tegra: Add AHB DMA clock entry
Date: Wed,  4 Oct 2017 02:02:38 +0300
Message-ID: <a2f03a761de34e8b814049b8dcd9791acbca4d6d.1507070638.git.digetx@gmail.com>
References: <cover.1507070638.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507070638.git.digetx@gmail.com>
In-Reply-To: <cover.1507070638.git.digetx@gmail.com>
References: <cover.1507070638.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

AHB DMA engine presents on Tegra20/30. Add missing clock entries, so that
driver for the AHB DMA controller could be implemented.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-id.h           | 1 +
 drivers/clk/tegra/clk-tegra-periph.c | 1 +
 drivers/clk/tegra/clk-tegra20.c      | 1 +
 drivers/clk/tegra/clk-tegra30.c      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 689f344377a7..c1661b47bbda 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -12,6 +12,7 @@ enum clk_id {
 	tegra_clk_amx,
 	tegra_clk_amx1,
 	tegra_clk_apb2ape,
+	tegra_clk_ahbdma,
 	tegra_clk_apbdma,
 	tegra_clk_apbif,
 	tegra_clk_ape,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 848255cc0209..0bce2bc55f0d 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -823,6 +823,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("timer", "clk_m", 5, 0, tegra_clk_timer, CLK_IS_CRITICAL),
 	GATE("isp", "clk_m", 23, 0, tegra_clk_isp, 0),
 	GATE("vcp", "clk_m", 29, 0, tegra_clk_vcp, 0),
+	GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
 	GATE("apbdma", "clk_m", 34, 0, tegra_clk_apbdma, 0),
 	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
 	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 837e5cbd60e9..42740aad8791 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -522,6 +522,7 @@ static struct tegra_devclk devclks[] __initdata = {
 };
 
 static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
+	[tegra_clk_ahbdma] = { .dt_id = TEGRA20_CLK_AHBDMA, .present = true },
 	[tegra_clk_spdif_out] = { .dt_id = TEGRA20_CLK_SPDIF_OUT, .present = true },
 	[tegra_clk_spdif_in] = { .dt_id = TEGRA20_CLK_SPDIF_IN, .present = true },
 	[tegra_clk_sdmmc1] = { .dt_id = TEGRA20_CLK_SDMMC1, .present = true },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index a2d163f759b4..ee168b0d9023 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -788,6 +788,7 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_extern3] = { .dt_id = TEGRA30_CLK_EXTERN3, .present = true },
 	[tegra_clk_disp1] = { .dt_id = TEGRA30_CLK_DISP1, .present = true },
 	[tegra_clk_disp2] = { .dt_id = TEGRA30_CLK_DISP2, .present = true },
+	[tegra_clk_ahbdma] = { .dt_id = TEGRA30_CLK_AHBDMA, .present = true },
 	[tegra_clk_apbdma] = { .dt_id = TEGRA30_CLK_APBDMA, .present = true },
 	[tegra_clk_rtc] = { .dt_id = TEGRA30_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA30_CLK_TIMER, .present = true },
-- 
2.14.1
