From: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] gpio: tegra186: export MODULE_DEVICE_TABLE
Date: Tue,  5 May 2020 10:45:01 +0200
Message-ID: <20200505084501.13170-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Export MODULE_DEVICE_TABLE since the driver can be built as a module.

Signed-off-by: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpio/gpio-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 79b553dc39a3..178e9128ded0 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -894,6 +894,7 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
 
 static struct platform_driver tegra186_gpio_driver = {
 	.driver = {
-- 
2.25.0
