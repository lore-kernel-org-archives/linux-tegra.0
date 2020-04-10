From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 12/68] usb: phy: tegra: Include proper GPIO consumer header to fix compile testing
Date: Thu,  9 Apr 2020 23:45:37 -0400
Message-ID: <20200410034634.7731-12-sashal@kernel.org>
References: <20200410034634.7731-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200410034634.7731-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 9cb9322a26ae84424c3e16e58617b3d8962fdbbb ]

The driver uses only GPIO Descriptor Consumer Interface so include
proper header.  This fixes compile test failures (e.g. on i386):

    drivers/usb/phy/phy-tegra-usb.c: In function ‘ulpi_phy_power_on’:
    drivers/usb/phy/phy-tegra-usb.c:695:2: error:
        implicit declaration of function ‘gpiod_set_value_cansleep’ [-Werror=implicit-function-declaration]
    drivers/usb/phy/phy-tegra-usb.c: In function ‘tegra_usb_phy_probe’:
    drivers/usb/phy/phy-tegra-usb.c:1167:11: error:
        implicit declaration of function ‘devm_gpiod_get_from_of_node’ [-Werror=implicit-function-declaration]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Link: https://lore.kernel.org/r/1583234960-24909-1-git-send-email-krzk@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 6153cc35aba0d..cffe2aced4884 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -12,12 +12,11 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/resource.h>
 #include <linux/slab.h>
-- 
2.20.1
