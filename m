From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/6] i2c: tegra: Use device name for adapter name
Date: Thu, 11 Aug 2016 11:16:57 +0100
Message-ID: <1470910620-9898-4-git-send-email-jonathanh@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

All Tegra I2C devices have the name "Tegra I2C adapter" which is not
very useful when viewing the I2C adapter names via the sysfs. Therefore,
use the device name, which is unique for each I2C device, instead.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 412b914fa84b..57f9c1612533 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -921,7 +921,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 	i2c_dev->adapter.owner = THIS_MODULE;
 	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
-	strlcpy(i2c_dev->adapter.name, "Tegra I2C adapter",
+	strlcpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
 		sizeof(i2c_dev->adapter.name));
 	i2c_dev->adapter.dev.parent = &pdev->dev;
 	i2c_dev->adapter.nr = pdev->id;
-- 
2.1.4
