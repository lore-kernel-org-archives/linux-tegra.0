From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv5 7/8] ARM: tegra: Add board data and 2D clocks
Date: Tue, 15 Jan 2013 13:26:21 +0200
Message-ID: <1358249182-17486-8-git-send-email-tbergstrom@nvidia.com>
References: <1358249182-17486-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358249182-17486-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a driver alias gr2d for Tegra 2D device, and assign a duplicate
of 2D clock to that driver alias.

Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c    |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c    |    1 +
 arch/arm/mach-tegra/tegra20_clocks_data.c |    2 +-
 arch/arm/mach-tegra/tegra30_clocks_data.c |    1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 171ba3c..9fcc800 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -96,6 +96,7 @@ static struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-slink", 0x7000D800, "spi_tegra.2", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-slink", 0x7000DA00, "spi_tegra.3", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-host1x", 0x50000000, "host1x", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-gr2d", 0x54140000, "gr2d", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-dc", 0x54200000, "tegradc.0", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-dc", 0x54240000, "tegradc.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-hdmi", 0x54280000, "hdmi", NULL),
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index cfe5fc0..0b4a1f0 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -59,6 +59,7 @@ static struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra30-slink", 0x7000DC00, "spi_tegra.4", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-slink", 0x7000DE00, "spi_tegra.5", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-host1x", 0x50000000, "host1x", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-gr2d", 0x54140000, "gr2d", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-dc", 0x54200000, "tegradc.0", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-dc", 0x54240000, "tegradc.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-hdmi", 0x54280000, "hdmi", NULL),
diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index a23a073..15d440a 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -1041,7 +1041,7 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("usbd",	"utmip-pad",	NULL),
 	CLK_DUPLICATE("usbd",	"tegra-ehci.0",	NULL),
 	CLK_DUPLICATE("usbd",	"tegra-otg",	NULL),
-	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
+	CLK_DUPLICATE("2d",	"gr2d",	"gr2d"),
 	CLK_DUPLICATE("3d",	"tegra_grhost",	"gr3d"),
 	CLK_DUPLICATE("epp",	"tegra_grhost",	"epp"),
 	CLK_DUPLICATE("mpe",	"tegra_grhost",	"mpe"),
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 741d264..5c4b7b7 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1338,6 +1338,7 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("pll_p", "tegradc.0", "parent"),
 	CLK_DUPLICATE("pll_p", "tegradc.1", "parent"),
 	CLK_DUPLICATE("pll_d2_out0", "hdmi", "parent"),
+	CLK_DUPLICATE("2d", "gr2d", "gr2d"),
 };
 
 static struct clk *tegra_ptr_clks[] = {
-- 
1.7.9.5
