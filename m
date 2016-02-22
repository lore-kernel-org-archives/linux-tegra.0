From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 20/61] gpio: ge: Use devm_gpiochip_add_data() for gpio
 registration
Date: Mon, 22 Feb 2016 19:38:09 +0530
Message-ID: <1456150130-2668-21-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, ldewangan@nvidia.com, bcm-kernel-feedback-list@broadcom.com, bjorn.andersson@sonymobile.com, catalin.marinas@arm.com, a.kesavan@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-ge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index cbbec83..8650b29 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -89,7 +89,7 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 	gc->of_node = pdev->dev.of_node;
 
 	/* This function adds a memory mapped GPIO chip */
-	ret = gpiochip_add_data(gc, NULL);
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, NULL);
 	if (ret)
 		goto err0;
 
-- 
2.1.4
