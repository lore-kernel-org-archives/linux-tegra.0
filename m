From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 01/11] soc/tegra: pmc: Initialise resets associated with a power partition
Date: Wed, 29 Jun 2016 10:17:47 +0100
Message-ID: <1467191877-26017-2-git-send-email-jonathanh@nvidia.com>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467191877-26017-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When registering the Tegra power partitions with the generic PM domain
framework, the current state of the each partition is checked and used
as the default state for the partition. However, the state of each reset
associated with the partition is not initialised and so it is possible
that the state of the resets are not in the expected state. For example,
if a partition is on, then the resets should be de-asserted and if the
partition is off, the resets should be asserted.

There have been cases where the bootloader has powered on a partition
and only de-asserted some of the resets to some of the devices in the
partition. This can cause accesses to these devices to hang the system
when the kernel boots and attempts to probe these devices.

Ideally, the driver for the device should ensure the reset has been
de-asserted when probing, but the resets cannot be shared between the
PMC driver (that needs to de-assert/assert the reset when turning the
partition on or off) and another driver because we cannot ensure the
reset is in the correct state.

To ensure the resets are in the correct state, when using the generic
PM domain framework, put each reset associated with the partition in
the correct state (based upon the partition's current state) when
obtaining the resets for a partition.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d13516981629..8a421a0b1ece 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -738,7 +738,7 @@ err:
 }
 
 static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
-					 struct device_node *np)
+					 struct device_node *np, bool off)
 {
 	struct reset_control *rst;
 	unsigned int i, count;
@@ -758,6 +758,16 @@ static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
 			err = PTR_ERR(pg->resets[i]);
 			goto error;
 		}
+
+		if (off)
+			err = reset_control_assert(pg->resets[i]);
+		else
+			err = reset_control_deassert(pg->resets[i]);
+
+		if (err) {
+			reset_control_put(pg->resets[i]);
+			goto error;
+		}
 	}
 
 	pg->num_resets = count;
@@ -798,14 +808,14 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pg->genpd.power_on = tegra_genpd_power_on;
 	pg->pmc = pmc;
 
+	off = !tegra_powergate_is_powered(pg->id);
+
 	if (tegra_powergate_of_get_clks(pg, np))
 		goto set_available;
 
-	if (tegra_powergate_of_get_resets(pg, np))
+	if (tegra_powergate_of_get_resets(pg, np, off))
 		goto remove_clks;
 
-	off = !tegra_powergate_is_powered(pg->id);
-
 	pm_genpd_init(&pg->genpd, NULL, off);
 
 	if (of_genpd_add_provider_simple(np, &pg->genpd))
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
