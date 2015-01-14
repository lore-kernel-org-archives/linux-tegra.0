From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 8/9] PCI: tegra: remove the power sequence from driver
Date: Wed, 14 Jan 2015 14:19:31 +0800
Message-ID: <1421216372-8025-9-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We have the generic PM domain support for Tegra SoCs now. So remove the
duplicated power sequence here.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 6f9c29fa70e7..22ef3cd61aa8 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -980,12 +980,6 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
 	if (err < 0)
 		dev_warn(pcie->dev, "failed to power off PHY: %d\n", err);
 
-	reset_control_assert(pcie->pcie_xrst);
-	reset_control_assert(pcie->afi_rst);
-	reset_control_assert(pcie->pex_rst);
-
-	tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
-
 	err = regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
 	if (err < 0)
 		dev_warn(pcie->dev, "failed to disable regulators: %d\n", err);
@@ -996,25 +990,11 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 	const struct tegra_pcie_soc_data *soc = pcie->soc_data;
 	int err;
 
-	reset_control_assert(pcie->pcie_xrst);
-	reset_control_assert(pcie->afi_rst);
-	reset_control_assert(pcie->pex_rst);
-
-	tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
-
 	/* enable regulators */
 	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
 	if (err < 0)
 		dev_err(pcie->dev, "failed to enable regulators: %d\n", err);
 
-	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
-						pcie->pex_clk,
-						pcie->pex_rst);
-	if (err) {
-		dev_err(pcie->dev, "powerup sequence failed: %d\n", err);
-		return err;
-	}
-
 	reset_control_deassert(pcie->afi_rst);
 
 	err = clk_prepare_enable(pcie->afi_clk);
-- 
1.9.1
