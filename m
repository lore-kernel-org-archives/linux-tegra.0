From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] gpio: tegra: Move driver registration to subsys_init level
Date: Thu,  2 Aug 2018 14:11:44 +0300
Message-ID: <20180802111144.12512-2-digetx@gmail.com>
References: <20180802111144.12512-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802111144.12512-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is a bug in regards to deferred probing within the drivers core
that causes GPIO-driver to suspend after its users. The bug appears if
GPIO-driver probe is getting deferred, which happens after introducing
dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ranges"
property in device-tree. The bug in the drivers core is old (more than 4
years now) and is well known, unfortunately there is no easy fix for it.
The good news is that we can workaround the deferred probe issue by
changing GPIO / PINCTRL drivers registration order and hence by moving
PINCTRL driver registration to the arch_init level and GPIO to the
subsys_init.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 2d940785bad0..a53c77db9744 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -712,4 +712,4 @@ static int __init tegra_gpio_init(void)
 {
 	return platform_driver_register(&tegra_gpio_driver);
 }
-postcore_initcall(tegra_gpio_init);
+subsys_initcall(tegra_gpio_init);
-- 
2.18.0
