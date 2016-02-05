From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk: tegra: Fixup post dividers on Tegra210
Date: Fri,  5 Feb 2016 17:17:32 +0100
Message-ID: <1454689052-25289-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 86c679a52294 ("clk: tegra: pll: Fix _pll_ramp_calc_pll logic and
_calc_dynamic_ramp_rate") changed the PLL divider computation logic to
consistently use P-divider values from tables as real dividers rather
than the hardware values. Unfortunately for some reason many of the
Tegra210 clocks didn't have their tables updated (most likely an over-
sight by me when applying the patches). This commit fixes them all up.

Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c | 94 ++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 58c0753e9c9c..37abd20d9b1f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1320,9 +1320,9 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 
 static struct tegra_clk_pll_freq_table pll_x_freq_table[] = {
 	/* 1 GHz */
-	{ 12000000, 1000000000, 166, 1, 1, 0 }, /* actual: 996.0 MHz */
-	{ 13000000, 1000000000, 153, 1, 1, 0 }, /* actual: 994.0 MHz */
-	{ 38400000, 1000000000, 156, 3, 1, 0 }, /* actual: 998.4 MHz */
+	{ 12000000, 1000000000, 166, 1, 2, 0 }, /* actual: 996.0 MHz */
+	{ 13000000, 1000000000, 153, 1, 2, 0 }, /* actual: 994.0 MHz */
+	{ 38400000, 1000000000, 156, 3, 2, 0 }, /* actual: 998.4 MHz */
 	{        0,          0,   0, 0, 0, 0 },
 };
 
@@ -1371,9 +1371,9 @@ static struct div_nmp pllc_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_cx_freq_table[] = {
-	{ 12000000, 510000000, 85, 1, 1, 0 },
-	{ 13000000, 510000000, 78, 1, 1, 0 }, /* actual: 507.0 MHz */
-	{ 38400000, 510000000, 79, 3, 1, 0 }, /* actual: 505.6 MHz */
+	{ 12000000, 510000000, 85, 1, 2, 0 },
+	{ 13000000, 510000000, 78, 1, 2, 0 }, /* actual: 507.0 MHz */
+	{ 38400000, 510000000, 79, 3, 2, 0 }, /* actual: 505.6 MHz */
 	{        0,         0,  0, 0, 0, 0 },
 };
 
@@ -1486,9 +1486,9 @@ static struct div_nmp pllss_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_c4_vco_freq_table[] = {
-	{ 12000000, 600000000, 50, 1, 0, 0 },
-	{ 13000000, 600000000, 46, 1, 0, 0 }, /* actual: 598.0 MHz */
-	{ 38400000, 600000000, 62, 4, 0, 0 }, /* actual: 595.2 MHz */
+	{ 12000000, 600000000, 50, 1, 1, 0 },
+	{ 13000000, 600000000, 46, 1, 1, 0 }, /* actual: 598.0 MHz */
+	{ 38400000, 600000000, 62, 4, 1, 0 }, /* actual: 595.2 MHz */
 	{        0,         0,  0, 0, 0, 0 },
 };
 
@@ -1537,19 +1537,19 @@ static struct tegra_clk_pll_params pll_c4_vco_params = {
 };
 
 static struct tegra_clk_pll_freq_table pll_m_freq_table[] = {
-	{ 12000000,  800000000,  66, 1, 0, 0 }, /* actual: 792.0 MHz */
-	{ 13000000,  800000000,  61, 1, 0, 0 }, /* actual: 793.0 MHz */
-	{ 38400000,  297600000,  93, 4, 2, 0 },
-	{ 38400000,  400000000, 125, 4, 2, 0 },
-	{ 38400000,  532800000, 111, 4, 1, 0 },
-	{ 38400000,  665600000, 104, 3, 1, 0 },
-	{ 38400000,  800000000, 125, 3, 1, 0 },
-	{ 38400000,  931200000,  97, 4, 0, 0 },
-	{ 38400000, 1065600000, 111, 4, 0, 0 },
-	{ 38400000, 1200000000, 125, 4, 0, 0 },
-	{ 38400000, 1331200000, 104, 3, 0, 0 },
-	{ 38400000, 1459200000,  76, 2, 0, 0 },
-	{ 38400000, 1600000000, 125, 3, 0, 0 },
+	{ 12000000,  800000000,  66, 1, 1, 0 }, /* actual: 792.0 MHz */
+	{ 13000000,  800000000,  61, 1, 1, 0 }, /* actual: 793.0 MHz */
+	{ 38400000,  297600000,  93, 4, 3, 0 },
+	{ 38400000,  400000000, 125, 4, 3, 0 },
+	{ 38400000,  532800000, 111, 4, 2, 0 },
+	{ 38400000,  665600000, 104, 3, 2, 0 },
+	{ 38400000,  800000000, 125, 3, 2, 0 },
+	{ 38400000,  931200000,  97, 4, 1, 0 },
+	{ 38400000, 1065600000, 111, 4, 1, 0 },
+	{ 38400000, 1200000000, 125, 4, 1, 0 },
+	{ 38400000, 1331200000, 104, 3, 1, 0 },
+	{ 38400000, 1459200000,  76, 2, 1, 0 },
+	{ 38400000, 1600000000, 125, 3, 1, 0 },
 	{        0,          0,   0, 0, 0, 0 },
 };
 
@@ -1660,9 +1660,9 @@ static struct tegra_clk_pll_params pll_e_params = {
 };
 
 static struct tegra_clk_pll_freq_table pll_re_vco_freq_table[] = {
-	{ 12000000, 672000000, 56, 1, 0, 0 },
-	{ 13000000, 672000000, 51, 1, 0, 0 }, /* actual: 663.0 MHz */
-	{ 38400000, 672000000, 70, 4, 0, 0 },
+	{ 12000000, 672000000, 56, 1, 1, 0 },
+	{ 13000000, 672000000, 51, 1, 1, 0 }, /* actual: 663.0 MHz */
+	{ 38400000, 672000000, 70, 4, 1, 0 },
 	{        0,         0,  0, 0, 0, 0 },
 };
 
@@ -1709,8 +1709,8 @@ static struct div_nmp pllp_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_p_freq_table[] = {
-	{ 12000000, 408000000, 34, 1, 0, 0 },
-	{ 38400000, 408000000, 85, 8, 0, 0 }, /* cf = 4.8MHz, allowed exception */
+	{ 12000000, 408000000, 34, 1, 1, 0 },
+	{ 38400000, 408000000, 85, 8, 1, 0 }, /* cf = 4.8MHz, allowed exception */
 	{        0,         0,  0, 0, 0, 0 },
 };
 
@@ -1776,14 +1776,14 @@ static struct div_nmp plla_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_a_freq_table[] = {
-	{ 12000000, 282240000, 47, 1, 1, 1, 0xf148 }, /* actual: 282240234 */
-	{ 12000000, 368640000, 61, 1, 1, 1, 0xfe15 }, /* actual: 368640381 */
-	{ 12000000, 240000000, 60, 1, 2, 1,      0 },
-	{ 13000000, 282240000, 43, 1, 1, 1, 0xfd7d }, /* actual: 282239807 */
-	{ 13000000, 368640000, 56, 1, 1, 1, 0x06d8 }, /* actual: 368640137 */
-	{ 13000000, 240000000, 55, 1, 2, 1,      0 }, /* actual: 238.3 MHz */
-	{ 38400000, 282240000, 44, 3, 1, 1, 0xf333 }, /* actual: 282239844 */
-	{ 38400000, 368640000, 57, 3, 1, 1, 0x0333 }, /* actual: 368639844 */
+	{ 12000000, 282240000, 47, 1, 2, 1, 0xf148 }, /* actual: 282240234 */
+	{ 12000000, 368640000, 61, 1, 2, 1, 0xfe15 }, /* actual: 368640381 */
+	{ 12000000, 240000000, 60, 1, 3, 1,      0 },
+	{ 13000000, 282240000, 43, 1, 2, 1, 0xfd7d }, /* actual: 282239807 */
+	{ 13000000, 368640000, 56, 1, 2, 1, 0x06d8 }, /* actual: 368640137 */
+	{ 13000000, 240000000, 55, 1, 3, 1,      0 }, /* actual: 238.3 MHz */
+	{ 38400000, 282240000, 44, 3, 2, 1, 0xf333 }, /* actual: 282239844 */
+	{ 38400000, 368640000, 57, 3, 2, 1, 0x0333 }, /* actual: 368639844 */
 	{ 38400000, 240000000, 75, 3, 3, 1,      0 },
 	{        0,         0,  0, 0, 0, 0,      0 },
 };
@@ -1829,9 +1829,9 @@ static struct div_nmp plld_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_d_freq_table[] = {
-	{ 12000000, 594000000, 99, 1, 1, 0,      0 },
-	{ 13000000, 594000000, 91, 1, 1, 0, 0xfc4f }, /* actual: 594000183 */
-	{ 38400000, 594000000, 30, 1, 1, 0, 0x0e00 },
+	{ 12000000, 594000000, 99, 1, 2, 0,      0 },
+	{ 13000000, 594000000, 91, 1, 2, 0, 0xfc4f }, /* actual: 594000183 */
+	{ 38400000, 594000000, 30, 1, 2, 0, 0x0e00 },
 	{        0,         0,  0, 0, 0, 0,      0 },
 };
 
@@ -1867,9 +1867,9 @@ static struct tegra_clk_pll_params pll_d_params = {
 };
 
 static struct tegra_clk_pll_freq_table tegra210_pll_d2_freq_table[] = {
-	{ 12000000, 594000000, 99, 1, 1, 0, 0xf000 },
-	{ 13000000, 594000000, 91, 1, 1, 0, 0xfc4f }, /* actual: 594000183 */
-	{ 38400000, 594000000, 30, 1, 1, 0, 0x0e00 },
+	{ 12000000, 594000000, 99, 1, 2, 0, 0xf000 },
+	{ 13000000, 594000000, 91, 1, 2, 0, 0xfc4f }, /* actual: 594000183 */
+	{ 38400000, 594000000, 30, 1, 2, 0, 0x0e00 },
 	{        0,         0,  0, 0, 0, 0,      0 },
 };
 
@@ -1912,9 +1912,9 @@ static struct tegra_clk_pll_params pll_d2_params = {
 };
 
 static struct tegra_clk_pll_freq_table pll_dp_freq_table[] = {
-	{ 12000000, 270000000, 90, 1, 3, 0, 0xf000 },
-	{ 13000000, 270000000, 83, 1, 3, 0, 0xf000 }, /* actual: 269.8 MHz */
-	{ 38400000, 270000000, 28, 1, 3, 0, 0xf400 },
+	{ 12000000, 270000000, 90, 1, 4, 0, 0xf000 },
+	{ 13000000, 270000000, 83, 1, 4, 0, 0xf000 }, /* actual: 269.8 MHz */
+	{ 38400000, 270000000, 28, 1, 4, 0, 0xf400 },
 	{        0,         0,  0, 0, 0, 0,      0 },
 };
 
@@ -1964,9 +1964,9 @@ static struct div_nmp pllu_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_u_freq_table[] = {
-	{ 12000000, 480000000, 40, 1, 0, 0 },
-	{ 13000000, 480000000, 36, 1, 0, 0 }, /* actual: 468.0 MHz */
-	{ 38400000, 480000000, 25, 2, 0, 0 },
+	{ 12000000, 480000000, 40, 1, 1, 0 },
+	{ 13000000, 480000000, 36, 1, 1, 0 }, /* actual: 468.0 MHz */
+	{ 38400000, 480000000, 25, 2, 1, 0 },
 	{        0,         0,  0, 0, 0, 0 },
 };
 
-- 
2.7.0
