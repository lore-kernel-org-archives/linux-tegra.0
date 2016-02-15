From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] soc: tegra: pmc: Ensure GPU partition can be toggled on/off by PMC
Date: Mon, 15 Feb 2016 12:38:11 +0000
Message-ID: <1455539891-6508-1-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-9-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-9-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For Tegra124 and Tegra210, the GPU partition cannot be toggled on and
off via the APBDEV_PMC_PWRGATE_TOGGLE_0 register. For these devices, the
partition is simply powered up and down via an external regulator.
For these devices, there is a separate register for controlling the
signal clamping of the partition and this is described in the PMC SoC
data by the "has_gpu_clamp" variable. Use this variable to determine if
the GPU partition can be controlled via the APBDEV_PMC_PWRGATE_TOGGLE_0
register and ensure that no one can incorrectly try to toggle the GPU
partition via the APBDEV_PMC_PWRGATE_TOGGLE_0 register.

Furthermore, we cannot use the APBDEV_PMC_PWRGATE_STATUS_0 register to
determine if the GPU partition is powered for Tegra124 and Tegra210.
However, if the GPU partition is powered, then the signal clamp for the
GPU partition should be removed and so use bit 0 of the
APBDEV_PMC_GPU_RG_CNTRL_0 register to determine if the clamp has been
removed (bit[0] = 0) and the GPU partition is powered.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Changes v1-v2:
- Drop the has_gpu_toggle and use has_gpu_clamps as it is not necessary
  to have two variables.
- Correct the register used for reading the clamps status for the GPU
  partition

 drivers/soc/tegra/pmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8e358dbffaed..e4fd40fa27e8 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -176,7 +176,10 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
 
 static inline bool tegra_powergate_state(int id)
 {
-	return (tegra_pmc_readl(PWRGATE_STATUS) & BIT(id)) != 0;
+	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
+		return (tegra_pmc_readl(GPU_RG_CNTRL) & 0x1) == 0;
+	else
+		return (tegra_pmc_readl(PWRGATE_STATUS) & BIT(id)) != 0;
 }
 
 static inline bool tegra_powergate_is_valid(int id)
@@ -191,6 +194,9 @@ static inline bool tegra_powergate_is_valid(int id)
  */
 static int tegra_powergate_set(unsigned int id, bool new_state)
 {
+	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
+		return -EINVAL;
+
 	mutex_lock(&pmc->powergates_lock);
 
 	if (tegra_powergate_state(id) == new_state) {
-- 
2.1.4
