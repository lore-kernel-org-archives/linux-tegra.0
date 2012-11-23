From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] ARM: tegra30: clocks: Make tegra_clk_duplicates private
Date: Fri, 23 Nov 2012 11:21:04 +0200
Message-ID: <1353662464-29037-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

No need to be public.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra30_clocks_data.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 7bc8b1d..c96e1dd 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1289,7 +1289,7 @@ struct clk *tegra_list_clks[] = {
  * configuration.  List those here to register them twice in the clock lookup
  * table under two names.
  */
-struct clk_duplicate tegra_clk_duplicates[] = {
+static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("uarta",  "serial8250.0", NULL),
 	CLK_DUPLICATE("uartb",  "serial8250.1", NULL),
 	CLK_DUPLICATE("uartc",  "serial8250.2", NULL),
-- 
1.7.9.5
