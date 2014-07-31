From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch 1/2] pinctrl: tegra-xusb: fix an off by one test
Date: Thu, 31 Jul 2014 18:22:17 +0300
Message-ID: <20140731152217.GD31539@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This shoudld be ">= ARRAY_SIZE()" instead of "> ARRAY_SIZE()".

Fixes: dc0a39386687 ('pinctrl: Add NVIDIA Tegra XUSB pad controller support')
Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index a066204..419a047 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -680,7 +680,7 @@ static struct phy *tegra_xusb_padctl_xlate(struct device *dev,
 	if (args->args_count <= 0)
 		return ERR_PTR(-EINVAL);
 
-	if (index > ARRAY_SIZE(padctl->phys))
+	if (index >= ARRAY_SIZE(padctl->phys))
 		return ERR_PTR(-EINVAL);
 
 	return padctl->phys[index];
