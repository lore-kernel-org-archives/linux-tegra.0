From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 6/6] soc/tegra: pmc: Don't probe pmc if early initialisation fails
Date: Tue, 28 Jun 2016 11:38:28 +0100
Message-ID: <1467110308-22126-7-git-send-email-jonathanh@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit 0259f522e04f ('soc/tegra: pmc: Restore base address on probe
failure') fixes an issue where the PMC base address pointer is not
restored on probe failure. However, this fix creates another problem
where if early initialisation of the PMC driver fails and an initial
mapping for the PMC address space is not created, then when the PMC
device is probed, the PMC base address pointer will not be valid and
this will cause a crash when tegra_pmc_init() is called and attempts
to access a register.

Although the PMC address space is mapped a 2nd time during the probe
and so this could be fixed by populating the base address pointer
earlier during the probe, this adds more complexity to the code.
Moreover, the PMC probe also assumes the the soc data pointer is also
initialised when the device is probed and if not will also lead to a
crash when calling tegra_pmc_init_tsense_reset(). Given that if the
early initialisation does fail then something bad has happen, it seems
acceptable to allow the PMC device probe to fail as well. Therefore, if
the PMC base address pointer or soc data pointer are not valid when
probing the PMC device, WARN and return an error.

Fixes: 0259f522e04f ('soc/tegra: pmc: Restore base address on probe failure')

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

I am not too happy with this. The more I was looking at the transition
from the early init code to the driver probe the more holes I saw. I
tried to see if I could handle this better in the probe itself, but it
was adding a lot more code to the probe. So this was a simple way to
at least make it more robust.

If this approach is not acceptable, then how about if we simplify matters
in the probe, and if the probe fails then set the 'pmc->base' and 'pmc->soc'
pointers to NULL and not worry about restoring the initial base address?
Yes it may prevent users from controlling the powergates, but if the probe
fails then there are probably other problems and so may be we don't care.

 drivers/soc/tegra/pmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e62acaef140a..d5635db78b61 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1228,6 +1228,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err;
 
+	/*
+	 * Early initialisation should have configured an initial
+	 * register mapping and setup the soc data pointer. If these
+	 * are not valid then something went badly wrong!
+	 */
+	if (WARN_ON(!pmc->base || !pmc->soc))
+		return -ENODEV;
+
 	err = tegra_pmc_parse_dt(pmc, pdev->dev.of_node);
 	if (err < 0)
 		return err;
-- 
2.1.4
