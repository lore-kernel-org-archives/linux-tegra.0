From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Mon,  3 Apr 2017 19:12:01 +0530
Message-ID: <1491226922-20307-4-git-send-email-vivek.gautam@codeaurora.org>
References: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491226922-20307-1-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support to get a list of resets available for the device.
These resets must be kept de-asserted until the device is
in use.

Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---

Changes since v1:
 - Using new APIs for reset control array.
 - Using the *_get_exclusive() API.
 - Added reset_control_array_put() to error and driver removal path.

 drivers/usb/dwc3/dwc3-of-simple.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index fe414e7a9c78..96786f5ede0b 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -29,13 +29,48 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 struct dwc3_of_simple {
 	struct device		*dev;
 	struct clk		**clks;
 	int			num_clocks;
+	int			num_resets;
+	struct reset_control_array *resets;
 };
 
+static int dwc3_of_simple_reset_init(struct dwc3_of_simple *simple, int count)
+{
+	struct device		*dev = simple->dev;
+	int			ret;
+
+	/* Not all platforms have resets, so don't return a failure */
+	if (count < 0)
+		return 0;
+
+	simple->num_resets = count;
+
+	simple->resets = devm_kcalloc(dev, count, sizeof(simple->resets),
+							GFP_KERNEL);
+	if (!simple->resets)
+		return -ENOMEM;
+
+	ret = of_reset_control_array_get_exclusive(dev->of_node, count,
+							simple->resets);
+	if (ret) {
+		dev_err(dev, "failed to get device resets\n");
+		return ret;
+	}
+
+	ret = reset_control_array_deassert(count, simple->resets);
+	if (ret) {
+		reset_control_array_put(count, simple->resets);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
 {
 	struct device		*dev = simple->dev;
@@ -100,6 +135,10 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dwc3_of_simple_reset_init(simple, of_reset_control_get_count(np));
+	if (ret)
+		return ret;
+
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		for (i = 0; i < simple->num_clocks; i++) {
@@ -107,6 +146,9 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 			clk_put(simple->clks[i]);
 		}
 
+		reset_control_array_assert(simple->num_resets, simple->resets);
+		reset_control_array_put(simple->num_resets, simple->resets);
+
 		return ret;
 	}
 
@@ -128,6 +170,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 		clk_put(simple->clks[i]);
 	}
 
+	reset_control_array_assert(simple->num_resets, simple->resets);
+	reset_control_array_put(simple->num_resets, simple->resets);
+
 	of_platform_depopulate(dev);
 
 	pm_runtime_put_sync(dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
