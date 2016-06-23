From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 01/12] soc/tegra: pmc: Initialise resets associated with a power partition
Date: Thu, 23 Jun 2016 16:58:54 +0100
Message-ID: <1466697545-11868-2-git-send-email-jonathanh@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
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

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
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
