From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH v2 6/6] ARM: tegra: Add Tegra30 host1x clock support
Date: Thu, 15 Nov 2012 22:07:59 +0100
Message-ID: <1353013679-16773-7-git-send-email-thierry.reding@avionic-design.de>
References: <1353013679-16773-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353013679-16773-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Setup the clock parents for the two display controllers and HDMI.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
 arch/arm/mach-tegra/tegra30_clocks_data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 7bc8b1d..6942c7a 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1298,8 +1298,6 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("usbd", "utmip-pad", NULL),
 	CLK_DUPLICATE("usbd", "tegra-ehci.0", NULL),
 	CLK_DUPLICATE("usbd", "tegra-otg", NULL),
-	CLK_DUPLICATE("hdmi", "tegradc.0", "hdmi"),
-	CLK_DUPLICATE("hdmi", "tegradc.1", "hdmi"),
 	CLK_DUPLICATE("dsib", "tegradc.0", "dsib"),
 	CLK_DUPLICATE("dsia", "tegradc.1", "dsia"),
 	CLK_DUPLICATE("bsev", "tegra-avp", "bsev"),
@@ -1337,6 +1335,9 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
 	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
 	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.4", "fast-clk"),
+	CLK_DUPLICATE("pll_p", "tegradc.0", "parent"),
+	CLK_DUPLICATE("pll_p", "tegradc.1", "parent"),
+	CLK_DUPLICATE("pll_d2_out0", "hdmi", "parent"),
 };
 
 struct clk *tegra_ptr_clks[] = {
-- 
1.8.0
