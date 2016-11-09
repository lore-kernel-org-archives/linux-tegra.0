From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 4/4] soc/tegra: pmc: Make configuration of IO pads in atomic context
Date: Wed, 9 Nov 2016 18:39:22 +0530
Message-ID: <1478696962-11831-5-git-send-email-ldewangan@nvidia.com>
References: <1478696962-11831-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478696962-11831-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org
Cc: gnurou@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The IO pad voltage configuration can be done in the regulator
notifier callback which is atomic in nature.

Replace the mutex with spin lock for the locking mechanism.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
 New in series based on pinctrl driver requirement.
---
 drivers/soc/tegra/pmc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 916a94b..52cd218 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -172,6 +172,7 @@ struct tegra_pmc_soc {
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_available: Bitmap of available power gates
  * @powergates_lock: mutex for power gate register access
+ * @io_pad_lock: Spinlock for IO pad voltage register access
  * @plat_subdevs: Platform device for PMC child devices.
  */
 struct tegra_pmc {
@@ -199,6 +200,7 @@ struct tegra_pmc {
 	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
 
 	struct mutex powergates_lock;
+	struct spinlock io_pad_lock;
 	struct platform_device **plat_subdevs;
 };
 
@@ -1103,7 +1105,7 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 	if (pad->voltage == UINT_MAX)
 		return -ENOTSUPP;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->io_pad_lock);
 
 	/* write-enable PMC_PWR_DET_VALUE[pad->voltage] */
 	value = tegra_pmc_readl(PMC_PWR_DET);
@@ -1120,7 +1122,7 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 
 	tegra_pmc_writel(value, PMC_PWR_DET_VALUE);
 
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->io_pad_lock);
 
 	usleep_range(100, 250);
 
@@ -1800,6 +1802,7 @@ static int __init tegra_pmc_early_init(void)
 	u32 value;
 
 	mutex_init(&pmc->powergates_lock);
+	spin_lock_init(&pmc->io_pad_lock);
 
 	np = of_find_matching_node_and_match(NULL, tegra_pmc_match, &match);
 	if (!np) {
-- 
2.1.4
