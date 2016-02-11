From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/8] soc: tegra: pmc: Protect public functions from potential race conditions
Date: Thu, 11 Feb 2016 18:03:21 +0000
Message-ID: <1455213806-21871-4-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The PMC base address pointer is initialised during early boot so that
early platform code may used the PMC public functions. During the probe
of the PMC driver the base address pointer is mapped again and the initial
mapping is freed. This exposes a window where a device accessing the PMC
registers via one of the public functions, could race with the updating
of the pointer and lead to a invalid access. Furthermore, the only
protection between multiple devices attempting to access the PMC registers
is when setting the powergate state to on or off. None of the other public
functions that access the PMC registers are protected.

Use the existing mutex to protect paths that may race with regard to
accessing the PMC registers.

Note that functions tegra_io_rail_prepare()/poll() either return a
negative value on failure or zero on success. Therefore, it is not
necessary to check if the return value is less than zero and so only
test that the return value is not zero to test for failure. This
simplifies the error handling with the mutex locking in place.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 900f72f0d757..5449d1aa14e8 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -235,7 +235,10 @@ int tegra_powergate_is_powered(int id)
 	if (!pmc->soc || id < 0 || id >= pmc->soc->num_powergates)
 		return -EINVAL;
 
+	mutex_lock(&pmc->powergates_lock);
 	status = tegra_pmc_readl(PWRGATE_STATUS) & (1 << id);
+	mutex_unlock(&pmc->powergates_lock);
+
 	return !!status;
 }
 
@@ -250,6 +253,8 @@ int tegra_powergate_remove_clamping(int id)
 	if (!pmc->soc || id < 0 || id >= pmc->soc->num_powergates)
 		return -EINVAL;
 
+	mutex_lock(&pmc->powergates_lock);
+
 	/*
 	 * On Tegra124 and later, the clamps for the GPU are controlled by a
 	 * separate register (with different semantics).
@@ -257,7 +262,7 @@ int tegra_powergate_remove_clamping(int id)
 	if (id == TEGRA_POWERGATE_3D) {
 		if (pmc->soc->has_gpu_clamps) {
 			tegra_pmc_writel(0, GPU_RG_CNTRL);
-			return 0;
+			goto out;
 		}
 	}
 
@@ -274,6 +279,9 @@ int tegra_powergate_remove_clamping(int id)
 
 	tegra_pmc_writel(mask, REMOVE_CLAMPING);
 
+out:
+	mutex_unlock(&pmc->powergates_lock);
+
 	return 0;
 }
 EXPORT_SYMBOL(tegra_powergate_remove_clamping);
@@ -520,9 +528,11 @@ int tegra_io_rail_power_on(int id)
 	unsigned int bit, mask;
 	int err;
 
+	mutex_lock(&pmc->powergates_lock);
+
 	err = tegra_io_rail_prepare(id, &request, &status, &bit);
-	if (err < 0)
-		return err;
+	if (err)
+		goto error;
 
 	mask = 1 << bit;
 
@@ -533,14 +543,17 @@ int tegra_io_rail_power_on(int id)
 	tegra_pmc_writel(value, request);
 
 	err = tegra_io_rail_poll(status, mask, 0, 250);
-	if (err < 0) {
+	if (err) {
 		pr_info("tegra_io_rail_poll() failed: %d\n", err);
-		return err;
+		goto error;
 	}
 
 	tegra_io_rail_unprepare();
 
-	return 0;
+error:
+	mutex_unlock(&pmc->powergates_lock);
+
+	return err;
 }
 EXPORT_SYMBOL(tegra_io_rail_power_on);
 
@@ -550,10 +563,12 @@ int tegra_io_rail_power_off(int id)
 	unsigned int bit, mask;
 	int err;
 
+	mutex_lock(&pmc->powergates_lock);
+
 	err = tegra_io_rail_prepare(id, &request, &status, &bit);
-	if (err < 0) {
+	if (err) {
 		pr_info("tegra_io_rail_prepare() failed: %d\n", err);
-		return err;
+		goto error;
 	}
 
 	mask = 1 << bit;
@@ -565,12 +580,15 @@ int tegra_io_rail_power_off(int id)
 	tegra_pmc_writel(value, request);
 
 	err = tegra_io_rail_poll(status, mask, mask, 250);
-	if (err < 0)
-		return err;
+	if (err)
+		goto error;
 
 	tegra_io_rail_unprepare();
 
-	return 0;
+error:
+	mutex_unlock(&pmc->powergates_lock);
+
+	return err;
 }
 EXPORT_SYMBOL(tegra_io_rail_power_off);
 
@@ -807,7 +825,7 @@ out:
 
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
-	void __iomem *base, *tmp;
+	void __iomem *base;
 	struct resource *res;
 	int err;
 
@@ -848,9 +866,10 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	tmp = pmc->base;
+	mutex_lock(&pmc->powergates_lock);
+	iounmap(pmc->base);
 	pmc->base = base;
-	iounmap(tmp);
+	mutex_unlock(&pmc->powergates_lock);
 
 	return 0;
 }
-- 
2.1.4
