From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra194
Date: Thu, 7 May 2020 11:13:48 +0100
Message-ID: <20200507101349.14118-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The PMIC wake event can be used to bring the system out of suspend based
on certain events happening on the PMIC (such as an RTC alarm).

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 72cfda7305d5..8169737c3252 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3326,6 +3326,7 @@ static const char * const tegra194_reset_sources[] = {
 };
 
 static const struct tegra_wake_event tegra194_wake_events[] = {
+	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
 };
-- 
2.17.1
