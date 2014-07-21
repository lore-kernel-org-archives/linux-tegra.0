From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging/nvec: Pass proper resource to mfd_add_devices()
Date: Mon, 21 Jul 2014 13:52:41 +0200
Message-ID: <1405943561-2656-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The mfd_add_devices() parameter takes a struct resource * as fifth
argument, but the nvec driver passes in a void __iomem *. The driver
gets away with it because none of the subdevices ever directly access
the registers.

While at it, use platform_get_irq() instead of platform_get_resource()
to get the device's interrupt. This makes it easier to pass in the
register region since the variable is no longer reused.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Alternatively we could simply pass NULL into mfd_add_devices(), which
might be a slightly more accurate representation of what's going on.

Marc, Greg, any preferences?

 drivers/staging/nvec/nvec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index d32504844896..11f9e1c3447c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -821,8 +821,8 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
+	nvec->irq = platform_get_irq(pdev, 0);
+	if (nvec->irq < 0) {
 		dev_err(&pdev->dev, "no irq resource?\n");
 		return -ENODEV;
 	}
@@ -840,7 +840,6 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	}
 
 	nvec->base = base;
-	nvec->irq = res->start;
 	nvec->i2c_clk = i2c_clk;
 	nvec->rx = &nvec->msg_pool[0];
 
@@ -893,7 +892,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	}
 
 	ret = mfd_add_devices(nvec->dev, -1, nvec_devices,
-			      ARRAY_SIZE(nvec_devices), base, 0, NULL);
+			      ARRAY_SIZE(nvec_devices), res, 0, NULL);
 	if (ret)
 		dev_err(nvec->dev, "error adding subdevices\n");
 
-- 
2.0.1
