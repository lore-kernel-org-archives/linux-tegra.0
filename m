From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/8] soc: tegra: pmc: Restore base address on probe failure
Date: Thu, 11 Feb 2016 18:03:20 +0000
Message-ID: <1455213806-21871-3-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

During early initialisation, the PMC registers are mapped and the PMC SoC
data is populated in the PMC data structure. This allows other drivers
access the PMC register space, via the public tegra PMC APIs, prior to
probing the PMC device.

When the PMC device is probed, the PMC registers are mapped again and if
successful the initial mapping is freed. If the probing of the PMC device
fails after the registers are remapped, then the registers will be
unmapped and hence the pointer to the PMC registers will be invalid. This
could lead to a potential crash, because once the PMC SoC data pointer is
populated, the driver assumes that the PMC register mapping is also valid
and a user calling any of the public tegra PMC APIs could trigger an
exception because these APIs don't check that the mapping is still valid.

Fix this by updating the mapping and freeing the original mapping only if
probing the PMC device is successful.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Please note that in order to properly fix this, we should lock around the
update on the base address pointer. The 3rd patch of this series adds the
locking and with the locking in place we can then also drop this "tmp"
variable added here.

 drivers/soc/tegra/pmc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 922430322877..900f72f0d757 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -807,7 +807,7 @@ out:
 
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
-	void __iomem *base = pmc->base;
+	void __iomem *base, *tmp;
 	struct resource *res;
 	int err;
 
@@ -817,11 +817,9 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 	/* take over the memory region from the early initialization */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmc->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pmc->base))
-		return PTR_ERR(pmc->base);
-
-	iounmap(base);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	pmc->clk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(pmc->clk)) {
@@ -850,6 +848,10 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	tmp = pmc->base;
+	pmc->base = base;
+	iounmap(tmp);
+
 	return 0;
 }
 
-- 
2.1.4
