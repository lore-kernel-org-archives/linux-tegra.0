From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V8 2/3] soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
Date: Fri, 17 Jun 2016 18:36:13 +0530
Message-ID: <1466168774-13707-3-git-send-email-ldewangan@nvidia.com>
References: <1466168774-13707-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466168774-13707-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, airlied@linux.ie, gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function tegra_pmc_readl() returns the u32 type data and hence
change the data type of variable where this data is stored to u32
type.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

---
Changes from V1:
-This is new in series as per discussion on V1 series to use u32 for
tegra_pmc_readl.

Changes from V2:
- Make unsigned long to u32 for some missed variable from V1.

Changes from V3:
- Revert back the value to ulong where time calcualtion is done.

Changes from V4:
- Collected RB from Jon.

Changes from V5/V6:
- None
---
 drivers/soc/tegra/pmc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6b61ec6..288dcb7 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -885,10 +885,10 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 	return 0;
 }
 
-static int tegra_io_rail_poll(unsigned long offset, unsigned long mask,
-			      unsigned long val, unsigned long timeout)
+static int tegra_io_rail_poll(unsigned long offset, u32 mask,
+			      u32 val, unsigned long timeout)
 {
-	unsigned long value;
+	u32 value;
 
 	timeout = jiffies + msecs_to_jiffies(timeout);
 
@@ -910,8 +910,9 @@ static void tegra_io_rail_unprepare(void)
 
 int tegra_io_rail_power_on(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
+	u32 value, mask;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -945,8 +946,9 @@ EXPORT_SYMBOL(tegra_io_rail_power_on);
 
 int tegra_io_rail_power_off(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
+	u32 value, mask;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
-- 
2.1.4
