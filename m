From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] soc/tegra: Clean-up PMC rail IO error messages
Date: Sat, 22 Oct 2016 20:23:54 +0100
Message-ID: <1477164236-29351-4-git-send-email-jonathanh@nvidia.com>
References: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477164236-29351-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Clean-up the error messages in the PMC rail IO functions by:
1. Using pr_err instead of pr_info which is currently used.
2. Use the compiler __func__ marco for displaying the function name.
3. Add specific error messages to the function tegra_io_rail_prepare()
   instead of just reporting it failed.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6a6df6e8bfd6..8c9797379949 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -919,8 +919,10 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 	 * There are two sets of 30 bits to select IO rails, but bits 30 and
 	 * 31 are control bits rather than IO rail selection bits.
 	 */
-	if (id > 63 || *bit & IO_DPD_REQ_CODE_MASK)
+	if (id > 63 || *bit & IO_DPD_REQ_CODE_MASK) {
+		pr_err("%s(): invalid rail ID %d\n", __func__, id);
 		return -EINVAL;
+	}
 
 	if (id < 32) {
 		*status = IO_DPD_STATUS;
@@ -931,8 +933,10 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 	}
 
 	rate = clk_get_rate(pmc->clk);
-	if (!rate)
+	if (!rate) {
+		pr_err("%s(): failed to get clock rate\n", __func__);
 		return -ENODEV;
+	}
 
 	tegra_pmc_writel(DPD_SAMPLE_ENABLE, DPD_SAMPLE);
 
@@ -983,7 +987,7 @@ int tegra_io_rail_power_on(unsigned int id)
 
 	err = tegra_io_rail_poll(status, bit, 0, 250);
 	if (err) {
-		pr_info("tegra_io_rail_poll() failed: %d\n", err);
+		pr_err("%s(): failed to power on rail %d\n", __func__, id);
 		goto error;
 	}
 
@@ -1005,16 +1009,16 @@ int tegra_io_rail_power_off(unsigned int id)
 	mutex_lock(&pmc->powergates_lock);
 
 	err = tegra_io_rail_prepare(id, &request, &status, &bit);
-	if (err) {
-		pr_info("tegra_io_rail_prepare() failed: %d\n", err);
+	if (err)
 		goto error;
-	}
 
 	tegra_pmc_writel(IO_DPD_REQ_CODE_ON | bit, request);
 
 	err = tegra_io_rail_poll(status, bit, bit, 250);
-	if (err)
+	if (err) {
+		pr_err("%s(): failed to power off rail %d\n", __func__, id);
 		goto error;
+	}
 
 	tegra_io_rail_unprepare();
 
-- 
1.9.1
