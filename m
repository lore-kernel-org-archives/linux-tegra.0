From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: tegra: clock: add i2c fast clock entry in clock table
Date: Wed, 8 Aug 2012 13:21:31 +0530
Message-ID: <1344412294-2420-2-git-send-email-ldewangan@nvidia.com>
References: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344412294-2420-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra's i2c controller require two clock sources named as
div-clk and fast-clk for proper operation.
Currently, the entry of fast-clk is missing in tegra30
clock table and it is incorrectly named in the tegra20
clock table.
Adds aliases to enable lookups for "fast-clk" to succeed.
A later patch will remove the incorrectly named clock,
once the driver is modified to use the new name.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra20_clocks_data.c |    4 ++++
 arch/arm/mach-tegra/tegra30_clocks_data.c |    5 +++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index b5c518e..7312ecd 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -1028,6 +1028,10 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("cop",	"tegra-avp",	"cop"),
 	CLK_DUPLICATE("vde",	"tegra-aes",	"vde"),
 	CLK_DUPLICATE("cclk",	NULL,		"cpu"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.0", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.1", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
 };
 
 #define CLK(dev, con, ck)	\
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index c924240..eae85b7 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1287,6 +1287,11 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("dam1", NULL, "dam1"),
 	CLK_DUPLICATE("dam2", NULL, "dam2"),
 	CLK_DUPLICATE("spdif_in", NULL, "spdif_in"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.0", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.1", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
+	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.4", "fast-clk"),
 };
 
 struct clk *tegra_ptr_clks[] = {
-- 
1.7.1.1
