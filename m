From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 31/61] gpio: mxc: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:20 +0530
Message-ID: <1456150130-2668-32-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: ldewangan@nvidia.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration and clean the
error path.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-mxc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7fd21cb..1b342a3 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -462,14 +462,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
 
-	err = gpiochip_add_data(&port->gc, port);
+	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)
 		goto out_bgio;
 
 	irq_base = irq_alloc_descs(-1, 0, 32, numa_node_id());
 	if (irq_base < 0) {
 		err = irq_base;
-		goto out_gpiochip_remove;
+		goto out_bgio;
 	}
 
 	port->domain = irq_domain_add_legacy(np, 32, irq_base, 0,
@@ -492,8 +492,6 @@ out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_irqdesc_free:
 	irq_free_descs(irq_base, 32);
-out_gpiochip_remove:
-	gpiochip_remove(&port->gc);
 out_bgio:
 	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
 	return err;
-- 
2.1.4
