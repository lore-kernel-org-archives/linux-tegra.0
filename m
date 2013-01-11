From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3] staging: nvec: remove use of clk_get_sys
Date: Fri, 11 Jan 2013 14:03:54 -0700
Message-ID: <1357938234-16570-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

As clock information is added to device tree clock can be looked up
using clk_get. Remove use of clk_get_sys.

Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[swarren: updated TODO file to remove entry that requested this change]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note: This patch needs to go through the Tegra tree due to dependencies
on the clock driver rework there.

v3: Added update to TODO file

 drivers/staging/nvec/TODO   |    4 ----
 drivers/staging/nvec/nvec.c |    2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/nvec/TODO b/drivers/staging/nvec/TODO
index f950ab8..e5ae42a 100644
--- a/drivers/staging/nvec/TODO
+++ b/drivers/staging/nvec/TODO
@@ -1,9 +1,5 @@
 ToDo list (incomplete, unordered)
 	- add compile as module support
-	- fix clk usage
-	  should not be using clk_get_sys(), but clk_get(&pdev->dev, conn)
-	  where conn is either NULL if the device only has one clock, or
-	  the device specific name if it has multiple clocks.
 	- move half of the nvec init stuff to i2c-tegra.c
 	- move event handling to nvec_events
 	- finish suspend/resume support
diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index d51615b..9417941 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -770,7 +770,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	i2c_clk = clk_get_sys("tegra-i2c.2", "div-clk");
+	i2c_clk = clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(i2c_clk)) {
 		dev_err(nvec->dev, "failed to get controller clock\n");
 		return -ENODEV;
-- 
1.7.10.4
