From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v6 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Mon, 19 Jun 2017 16:34:07 +0200
Message-ID: <20170619143408.15668-4-p.zabel@pengutronix.de>
References: <20170619143408.15668-1-p.zabel@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170619143408.15668-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Add support to get a list of resets available for the device.
These resets must be kept de-asserted until the device is
in use.

Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
[p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org: switch to hidden reset control array]
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
No changes since v5.
---
 drivers/usb/dwc3/dwc3-of-simple.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index a9bac09d3750d..23d2221bde9df 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -29,11 +29,13 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 struct dwc3_of_simple {
 	struct device		*dev;
 	struct clk		**clks;
 	int			num_clocks;
+	struct reset_control	*resets;
 };
 
 static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
@@ -96,9 +98,20 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
 
+	simple->resets = of_reset_control_array_get_optional_exclusive(np);
+	if (IS_ERR(simple->resets)) {
+		ret = PTR_ERR(simple->resets);
+		dev_err(dev, "failed to get device resets, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_deassert(simple->resets);
+	if (ret)
+		goto err_resetc_put;
+
 	ret = dwc3_of_simple_clk_init(simple, of_clk_get_parent_count(np));
 	if (ret)
-		return ret;
+		goto err_resetc_assert;
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
@@ -107,7 +120,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 			clk_put(simple->clks[i]);
 		}
 
-		return ret;
+		goto err_resetc_assert;
 	}
 
 	pm_runtime_set_active(dev);
@@ -115,6 +128,13 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(dev);
 
 	return 0;
+
+err_resetc_assert:
+	reset_control_assert(simple->resets);
+
+err_resetc_put:
+	reset_control_put(simple->resets);
+	return ret;
 }
 
 static int dwc3_of_simple_remove(struct platform_device *pdev)
@@ -130,6 +150,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 		clk_put(simple->clks[i]);
 	}
 
+	reset_control_assert(simple->resets);
+	reset_control_put(simple->resets);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
-- 
2.11.0
