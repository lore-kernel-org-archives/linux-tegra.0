From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
Date: Fri, 5 Jul 2019 20:32:20 +0800
Message-ID: <20190705123220.54008-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

If CONFIG_DEBUG_FS is not set, building fails:

drivers/gpio/gpio-tegra.c: In function tegra_gpio_probe:
drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of function debugfs_create_file;
 did you mean bus_create_file? [-Werror=implicit-function-declaration]
  debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
  ^~~~~~~~~~~~~~~~~~~
  bus_create_file
drivers/gpio/gpio-tegra.c:666:9: error: tegra_dbg_gpio_fops undeclared (first use in this function);
 did you mean tegra_gpio_pm_ops?
        &tegra_dbg_gpio_fops);
         ^~~~~~~~~~~~~~~~~~~
         tegra_gpio_pm_ops

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 59b99d8..40fd6bd 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -662,8 +662,10 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
+#ifdef CONFIG_DEBUG_FS
 	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
 			    &tegra_dbg_gpio_fops);
+#endif
 
 	return 0;
 }
-- 
2.7.4
