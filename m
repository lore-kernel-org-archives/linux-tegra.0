From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/8] soc: tegra: pmc: Fix testing of powergate state
Date: Thu, 11 Feb 2016 18:03:23 +0000
Message-ID: <1455213806-21871-6-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In tegra_powergate_set() the state of the powergates is read and OR'ed
with the bit for the powergate of interest. This unsigned 32-bit value
is then compared with a boolean value to test if the powergate is
already in the desired state. When turning on a powergate, apart from
the powergate that is represented by bit 0, this test will always
return false and so we may attempt to turn on the powergate when it is
already on.

After OR'ing the bit for the powergate, check if the result is not equal
to zero before comparing with the boolean value. Add a helper function
to return the current state of a powergate and use this in both
tegra_powergate_set() and tegra_powergate_is_powered() where we check
the powergate status.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5f32a3e34476..9e8d359baf0e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -174,6 +174,11 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
 	writel(value, pmc->base + offset);
 }
 
+static inline bool tegra_powergate_state(int id)
+{
+	return (tegra_pmc_readl(PWRGATE_STATUS) & BIT(id)) != 0;
+}
+
 /**
  * tegra_powergate_set() - set the state of a partition
  * @id: partition ID
@@ -181,13 +186,9 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
  */
 static int tegra_powergate_set(unsigned int id, bool new_state)
 {
-	bool status;
-
 	mutex_lock(&pmc->powergates_lock);
 
-	status = tegra_pmc_readl(PWRGATE_STATUS) & (1 << id);
-
-	if (status == new_state) {
+	if (tegra_powergate_state(id) == new_state) {
 		mutex_unlock(&pmc->powergates_lock);
 		return 0;
 	}
@@ -230,16 +231,16 @@ EXPORT_SYMBOL(tegra_powergate_power_off);
  */
 int tegra_powergate_is_powered(unsigned int id)
 {
-	u32 status;
+	int status;
 
 	if (!pmc->soc || id >= pmc->soc->num_powergates)
 		return -EINVAL;
 
 	mutex_lock(&pmc->powergates_lock);
-	status = tegra_pmc_readl(PWRGATE_STATUS) & (1 << id);
+	status = tegra_powergate_state(id);
 	mutex_unlock(&pmc->powergates_lock);
 
-	return !!status;
+	return status;
 }
 
 /**
-- 
2.1.4
