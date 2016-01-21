From: "Gujulan Elango, Hari Prasath (H.)" <hgujulan@visteon.com>
Subject: [PATCH] staging: nvec: replace led_classdev_register
Date: Thu, 21 Jan 2016 10:23:46 +0000
Message-ID: <20160121102450.GA10897@IND12F0122>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Language: en-US
Content-ID: <F5D919D1D5635241ADD8D71BDD41A674@eurprd06.prod.outlook.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "marvin24@gmx.de" <marvin24@gmx.de>, "ac100@lists.launchpad.net" <ac100@lists.launchpad.net>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Hari Prasath Gujulan Elango <hgujulan@visteon.com>

Replace the led_classdev_register() with the platform managed version
devm_led_classdev_register() & henceforth remove the redundant
nvec_paz00_remove() function.

Signed-off-by: Hari Prasath Gujulan Elango <hgujulan@visteon.com>
---
 drivers/staging/nvec/nvec_paz00.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 68146bf..cddbfd2 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -63,7 +63,7 @@ static int nvec_paz00_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(&pdev->dev, &led->cdev);
+	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
 	if (ret < 0)
 		return ret;
 
@@ -73,18 +73,8 @@ static int nvec_paz00_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nvec_paz00_remove(struct platform_device *pdev)
-{
-	struct nvec_led *led = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&led->cdev);
-
-	return 0;
-}
-
 static struct platform_driver nvec_paz00_driver = {
 	.probe  = nvec_paz00_probe,
-	.remove = nvec_paz00_remove,
 	.driver = {
 		.name  = "nvec-paz00",
 	},
-- 
1.9.1
