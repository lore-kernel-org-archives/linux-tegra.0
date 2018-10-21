From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 5/6] gpio: gpio-tegra: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:00 +0200
Message-ID: <20181021200002.1472-6-wsa+renesas@sang-engineering.com>
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/gpio/gpio-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 47dbd19751d0..02f6db925fd5 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -404,8 +404,7 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 #ifdef CONFIG_PM_SLEEP
 static int tegra_gpio_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
+	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
 	unsigned long flags;
 	unsigned int b, p;
 
@@ -444,8 +443,7 @@ static int tegra_gpio_resume(struct device *dev)
 
 static int tegra_gpio_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
+	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
 	unsigned long flags;
 	unsigned int b, p;
 
-- 
2.19.0
