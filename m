From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 23/61] gpio: janz-ttl: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:12 +0530
Message-ID: <1456150130-2668-24-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, albeu-GANU6spQydw@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, shc_work-JGs/UdohzUI@public.gmane.org, support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration and remove the
need of driver callback .remove.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-janz-ttl.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index 482aa03..a8d0a6b 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -182,7 +182,7 @@ static int ttl_probe(struct platform_device *pdev)
 	gpio->base = -1;
 	gpio->ngpio = 20;
 
-	ret = gpiochip_add_data(gpio, NULL);
+	ret = devm_gpiochip_add_data(dev, gpio, NULL);
 	if (ret) {
 		dev_err(dev, "unable to add GPIO chip\n");
 		return ret;
@@ -191,21 +191,11 @@ static int ttl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ttl_remove(struct platform_device *pdev)
-{
-	struct ttl_module *mod = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&mod->gpio);
-
-	return 0;
-}
-
 static struct platform_driver ttl_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 	},
 	.probe		= ttl_probe,
-	.remove		= ttl_remove,
 };
 
 module_platform_driver(ttl_driver);
-- 
2.1.4
