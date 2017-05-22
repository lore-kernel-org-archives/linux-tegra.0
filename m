From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 1/4] usb: dwc3: of-simple: Re-order resource handling in remove
Date: Mon, 22 May 2017 16:53:24 +0530
Message-ID: <1495452207-6129-2-git-send-email-vivek.gautam@codeaurora.org>
References: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495452207-6129-1-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Move clock handling after of_platform_depopulate to achieve
a sequence that is reverse of the probe sequence.

Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---

 - new patch in this series.

 drivers/usb/dwc3/dwc3-of-simple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index fe414e7a9c78..a9bac09d3750 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -123,13 +123,13 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			i;
 
+	of_platform_depopulate(dev);
+
 	for (i = 0; i < simple->num_clocks; i++) {
 		clk_disable_unprepare(simple->clks[i]);
 		clk_put(simple->clks[i]);
 	}
 
-	of_platform_depopulate(dev);
