From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] USB: ehci-tegra: remove redundant gpio_set_value
Date: Mon, 30 Apr 2012 17:24:10 -0600
Message-ID: <1335828250-8470-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The immediately preceding gpio_direction_output() already set the value,
so there's no need to repeat it. This also prevents gpio_set_value() from
WARNing when the GPIO is sleepable (e.g. is on an I2C expander); the set
direction API is always sleepable, but plain set_value isn't.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.3 v3.4
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index a6e9b2c..cb2a6b3 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -587,7 +587,6 @@ static int setup_vbus_gpio(struct platform_device *pdev,
 		dev_err(&pdev->dev, "can't enable vbus\n");
 		return err;
 	}
-	gpio_set_value(gpio, 1);
 
 	return err;
 }
-- 
1.7.0.4
