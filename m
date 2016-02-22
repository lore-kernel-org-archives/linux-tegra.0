From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 07/61] gpio: adp5588: Use devm_gpiochip_add_data() for gpio
 registration
Date: Mon, 22 Feb 2016 19:37:56 +0530
Message-ID: <1456150130-2668-8-git-send-email-ldewangan@nvidia.com>
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

Use devm_gpiochip_add_data() for GPIO registration and remove the
call for gpiochip_remove() from remove callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/gpio/gpio-adp5588.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 19a0eba..c0f718b 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -414,7 +414,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 		}
 	}
 
-	ret = gpiochip_add_data(&dev->gpio_chip, dev);
+	ret = devm_gpiochip_add_data(&client->dev, &dev->gpio_chip, dev);
 	if (ret)
 		goto err_irq;
 
@@ -457,8 +457,6 @@ static int adp5588_gpio_remove(struct i2c_client *client)
 	if (dev->irq_base)
 		free_irq(dev->client->irq, dev);
 
-	gpiochip_remove(&dev->gpio_chip);
-
 	return 0;
 }
 
-- 
2.1.4
