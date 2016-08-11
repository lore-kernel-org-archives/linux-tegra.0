From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] soc/tegra: pmc: Fix incorrect DPD request
Date: Thu, 11 Aug 2016 09:13:36 +0800
Message-ID: <1470878016-6098-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reading the DPD_REQ & DPD2_REQ registers returns the previous requests.
If we sets the current request bit with the returned value, then other
pads will be turned on or off unexpectedly.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi,

I did not notice Laxman had a series[1] which also touched pmc code,
and it seems the series isn't merged yet. Should I rebase this patch
on it?

Thanks,
Vince


 drivers/soc/tegra/pmc.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 71c834f3847e..7792ed88d80b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -967,8 +967,8 @@ static void tegra_io_rail_unprepare(void)
 
 int tegra_io_rail_power_on(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -977,15 +977,9 @@ int tegra_io_rail_power_on(unsigned int id)
 	if (err)
 		goto error;
 
-	mask = 1 << bit;
+	tegra_pmc_writel(IO_DPD_REQ_CODE_OFF | BIT(bit), request);
 
-	value = tegra_pmc_readl(request);
-	value |= mask;
-	value &= ~IO_DPD_REQ_CODE_MASK;
-	value |= IO_DPD_REQ_CODE_OFF;
-	tegra_pmc_writel(value, request);
-
-	err = tegra_io_rail_poll(status, mask, 0, 250);
+	err = tegra_io_rail_poll(status, BIT(bit), 0, 250);
 	if (err) {
 		pr_info("tegra_io_rail_poll() failed: %d\n", err);
 		goto error;
@@ -1002,8 +996,8 @@ EXPORT_SYMBOL(tegra_io_rail_power_on);
 
 int tegra_io_rail_power_off(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -1014,15 +1008,9 @@ int tegra_io_rail_power_off(unsigned int id)
 		goto error;
 	}
 
-	mask = 1 << bit;
-
-	value = tegra_pmc_readl(request);
-	value |= mask;
-	value &= ~IO_DPD_REQ_CODE_MASK;
-	value |= IO_DPD_REQ_CODE_ON;
-	tegra_pmc_writel(value, request);
+	tegra_pmc_writel(IO_DPD_REQ_CODE_ON | BIT(bit), request);
 
-	err = tegra_io_rail_poll(status, mask, mask, 250);
+	err = tegra_io_rail_poll(status, BIT(bit), BIT(bit), 250);
 	if (err)
 		goto error;
 
-- 
2.7.4
