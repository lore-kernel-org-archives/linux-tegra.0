From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 6/8] clk: sirf: Constify parent names in clock init data
Date: Wed, 08 Apr 2015 15:22:17 +0200
Message-ID: <1428499339-29569-7-git-send-email-k.kozlowski@samsung.com>
References: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1428499339-29569-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The array of parent names can be made as array of const pointers to
const strings.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/sirf/clk-common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sirf/clk-common.c b/drivers/clk/sirf/clk-common.c
index 37af51c5f213..e9cf5730effe 100644
--- a/drivers/clk/sirf/clk-common.c
+++ b/drivers/clk/sirf/clk-common.c
@@ -188,7 +188,7 @@ static struct clk_ops std_pll_ops = {
 	.set_rate = pll_clk_set_rate,
 };
 
-static const char *pll_clk_parents[] = {
+static const char * const pll_clk_parents[] = {
 	"osc",
 };
 
@@ -284,7 +284,7 @@ static struct clk_hw usb_pll_clk_hw = {
  * clock domains - cpu, mem, sys/io, dsp, gfx
  */
 
-static const char *dmn_clk_parents[] = {
+static const char * const dmn_clk_parents[] = {
 	"rtc",
 	"osc",
 	"pll1",
@@ -673,7 +673,7 @@ static void std_clk_disable(struct clk_hw *hw)
 	clkc_writel(val, reg);
 }
 
-static const char *std_clk_io_parents[] = {
+static const char * const std_clk_io_parents[] = {
 	"io",
 };
 
@@ -949,7 +949,7 @@ static struct clk_std clk_pulse = {
 	},
 };
 
-static const char *std_clk_dsp_parents[] = {
+static const char * const std_clk_dsp_parents[] = {
 	"dsp",
 };
 
@@ -981,7 +981,7 @@ static struct clk_std clk_mf = {
 	},
 };
 
-static const char *std_clk_sys_parents[] = {
+static const char * const std_clk_sys_parents[] = {
 	"sys",
 };
 
@@ -999,7 +999,7 @@ static struct clk_std clk_security = {
 	},
 };
 
-static const char *std_clk_usb_parents[] = {
+static const char * const std_clk_usb_parents[] = {
 	"usb_pll",
 };
 
-- 
1.9.1
