From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] usb: host: ehci-tegra: request deferred probe when failing to get phy
Date: Wed, 24 Dec 2014 18:16:30 +0800
Message-ID: <1419416190-4321-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The commit 1290a958d48e ("usb: phy: propagate __of_usb_find_phy()'s error on
failure") changed the condition to return -EPROBE_DEFER to host driver.
Originally the Tegra host driver depended on the returned -EPROBE_DEFER to
get the phy device later when booting. Now we have to do that explicitly.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi,

This fixes a regression found on 3.19-rc1. The USB host can't be probed and
the USB failed on Jetson TK1.

Thanks,
Vince


 drivers/usb/host/ehci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 19a9af1b4d74..ff9af29b4e9f 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -451,7 +451,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 
 	u_phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(u_phy)) {
-		err = PTR_ERR(u_phy);
+		err = -EPROBE_DEFER;
 		goto cleanup_clk_en;
 	}
 	hcd->usb_phy = u_phy;
-- 
1.9.1
