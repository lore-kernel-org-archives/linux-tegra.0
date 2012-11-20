From: Sivaram Nair <sivaramn@nvidia.com>
Subject: [PATCH 1/1] arm: tegra: select correct parent clk for pll_p
Date: Tue, 20 Nov 2012 09:29:16 +0200
Message-ID: <1353396556-7738-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sivaram Nair <sivaramn@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

For Tegra30, pll_p clk's parent is wrongly specified as clk_m instead of
pll_ref in the tegra30_clk_init_table and this is resulting in a
boot-time warning. This patch fixes this by correcting the clk init
table.

Signed-off-by: Sivaram Nair <sivaramn@nvidia.com>
---
 arch/arm/mach-tegra/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 0816562..d54cfc5 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -104,7 +104,7 @@ static __initdata struct tegra_clk_init_table tegra20_clk_init_table[] = {
 static __initdata struct tegra_clk_init_table tegra30_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "clk_m",	NULL,		0,		true },
-	{ "pll_p",	"clk_m",	408000000,	true },
+	{ "pll_p",	"pll_ref",	408000000,	true },
 	{ "pll_p_out1",	"pll_p",	9600000,	true },
 	{ "pll_p_out4",	"pll_p",	102000000,	true },
 	{ "sclk",	"pll_p_out4",	102000000,	true },
-- 
1.7.9.5
