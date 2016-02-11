From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/8] soc: tegra: pmc: Fix verification of valid partitions
Date: Thu, 11 Feb 2016 18:03:24 +0000
Message-ID: <1455213806-21871-7-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The tegra power partitions are referenced by a numerical ID which are
the same values programmed into the PMC registers for controlling the
partition. For a given device, the valid partition IDs may not be
contiguous and so simply checking that an ID is not greater than the
maximum ID supported may not mean it is valid. Fix this by checking if
the powergate is defined in the list of powergates for the Tegra SoC.

Add a helper function for checking valid powergates and use where we
need to verify if the powergate ID is valid or not.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9e8d359baf0e..e75782b47267 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -179,6 +179,11 @@ static inline bool tegra_powergate_state(int id)
 	return (tegra_pmc_readl(PWRGATE_STATUS) & BIT(id)) != 0;
 }
 
+static inline bool tegra_powergate_is_valid(int id)
+{
+	return (pmc->soc && pmc->soc->powergates[id]);
+}
+
 /**
  * tegra_powergate_set() - set the state of a partition
  * @id: partition ID
@@ -206,7 +211,7 @@ static int tegra_powergate_set(unsigned int id, bool new_state)
  */
 int tegra_powergate_power_on(unsigned int id)
 {
-	if (!pmc->soc || id >= pmc->soc->num_powergates)
+	if (!tegra_powergate_is_valid(id))
 		return -EINVAL;
 
 	return tegra_powergate_set(id, true);
@@ -218,7 +223,7 @@ int tegra_powergate_power_on(unsigned int id)
  */
 int tegra_powergate_power_off(unsigned int id)
 {
-	if (!pmc->soc || id >= pmc->soc->num_powergates)
+	if (!tegra_powergate_is_valid(id))
 		return -EINVAL;
 
 	return tegra_powergate_set(id, false);
@@ -233,7 +238,7 @@ int tegra_powergate_is_powered(unsigned int id)
 {
 	int status;
 
-	if (!pmc->soc || id >= pmc->soc->num_powergates)
+	if (!tegra_powergate_is_valid(id))
 		return -EINVAL;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -251,7 +256,7 @@ int tegra_powergate_remove_clamping(unsigned int id)
 {
 	u32 mask;
 
-	if (!pmc->soc || id >= pmc->soc->num_powergates)
+	if (!tegra_powergate_is_valid(id))
 		return -EINVAL;
 
 	mutex_lock(&pmc->powergates_lock);
-- 
2.1.4
