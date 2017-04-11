From: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Subject: [PATCH] soc/tegra: flowctrl: Fix error handling
Date: Tue, 11 Apr 2017 05:40:41 +0200
Message-ID: <20170411034041.18662-1-christophe.jaillet@wanadoo.fr>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It is likely that returning returned by 'devm_ioremap_resource()' is
expected here instead of something related to 'base' which should be a
valid pointer at this point.

Fixes: 841fd94c43a4 ("soc/tegra: flowctrl: Add basic platform driver")

Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
---
 drivers/soc/tegra/flowctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/flowctrl.c b/drivers/soc/tegra/flowctrl.c
index 0e345c05fc65..5433cc7a043e 100644
--- a/drivers/soc/tegra/flowctrl.c
+++ b/drivers/soc/tegra/flowctrl.c
@@ -157,7 +157,7 @@ static int tegra_flowctrl_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	tegra_flowctrl_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tegra_flowctrl_base))
-		return PTR_ERR(base);
+		return PTR_ERR(tegra_flowctrl_base);
 
 	iounmap(base);
 
-- 
2.11.0
