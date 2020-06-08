From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 5.6 049/606] usb: gadget: tegra-xudc: Fix idle suspend/resume
Date: Mon,  8 Jun 2020 19:02:54 -0400
Message-ID: <20200608231211.3363633-49-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200608231211.3363633-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

commit 0534d40160cb9505073b0ecf5e7210daee319a66 upstream.

When the XUDC device is idle (i.e. powergated), care must be taken not
to access any registers because that would lead to a crash.

Move the call to tegra_xudc_device_mode_off() into the same conditional
as the tegra_xudc_powergate() call to make sure we only force device
mode off if the XUDC is actually powered up.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 634c2c19a176..a22d190d00a0 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3740,11 +3740,11 @@ static int __maybe_unused tegra_xudc_suspend(struct device *dev)
 
 	flush_work(&xudc->usb_role_sw_work);
 
-	/* Forcibly disconnect before powergating. */
-	tegra_xudc_device_mode_off(xudc);
-
-	if (!pm_runtime_status_suspended(dev))
+	if (!pm_runtime_status_suspended(dev)) {
+		/* Forcibly disconnect before powergating. */
+		tegra_xudc_device_mode_off(xudc);
 		tegra_xudc_powergate(xudc);
+	}
 
 	pm_runtime_disable(dev);
 
-- 
2.25.1
