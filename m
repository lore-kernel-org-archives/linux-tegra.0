From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] soc/tegra: pmc: Guard against uninitialised PMC clock
Date: Sat, 22 Oct 2016 20:23:52 +0100
Message-ID: <1477164236-29351-2-git-send-email-jonathanh@nvidia.com>
References: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477164236-29351-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It is possible for the public functions, tegra_io_rail_power_on/off()
to be called before the PMC device has been probed. If this happens
then the pmc->clk member will not be initialised and the call to
clk_get_rate() in tegra_io_rail_prepare() will return zero and lead
to a divide-by-zero exception. The function clk_get_rate() will return
zero if a NULl clk pointer is passed. Therefore, rather that checking
if pmc->clk is initialised, fix this by checking the return value for
clk_get_rate() to make sure it is not zero.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 7792ed88d80b..c99580aabcf6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -931,6 +931,8 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 	}
 
 	rate = clk_get_rate(pmc->clk);
+	if (!rate)
+		return -ENODEV;
 
 	tegra_pmc_writel(DPD_SAMPLE_ENABLE, DPD_SAMPLE);
 
-- 
1.9.1
