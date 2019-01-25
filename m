From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/7] soc/tegra: pmc: Make tegra_powergate_is_powered() a local
 function
Date: Fri, 25 Jan 2019 11:22:51 +0100
Message-ID: <20190125102255.6862-3-thierry.reding@gmail.com>
References: <20190125102255.6862-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125102255.6862-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>

Now there are no more external users of tegra_powergate_is_powered(),
make this a local function.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 include/soc/tegra/pmc.h | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 550653302ff2..fa0e1ac6d501 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -637,7 +637,7 @@ EXPORT_SYMBOL(tegra_powergate_power_off);
  * tegra_powergate_is_powered() - check if partition is powered
  * @id: partition ID
  */
-int tegra_powergate_is_powered(unsigned int id)
+static int tegra_powergate_is_powered(unsigned int id)
 {
 	if (!tegra_powergate_is_valid(id))
 		return -EINVAL;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index a9db1b501de1..b32ee5d82dd4 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -161,7 +161,6 @@ enum tegra_io_pad {
 #define TEGRA_IO_RAIL_LVDS	TEGRA_IO_PAD_LVDS
 
 #ifdef CONFIG_SOC_TEGRA_PMC
-int tegra_powergate_is_powered(unsigned int id);
 int tegra_powergate_power_on(unsigned int id);
 int tegra_powergate_power_off(unsigned int id);
 int tegra_powergate_remove_clamping(unsigned int id);
@@ -182,11 +181,6 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
 
 #else
-static inline int tegra_powergate_is_powered(unsigned int id)
-{
-	return -ENOSYS;
-}
-
 static inline int tegra_powergate_power_on(unsigned int id)
 {
 	return -ENOSYS;
-- 
2.19.1
