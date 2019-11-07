From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] gpio: xgs-iproc: Fix crash when driver is built as a module
Date: Thu, 7 Nov 2019 10:35:40 +0000
Message-ID: <20191107103540.21088-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, rjui@broadcom.com, sbranden@broadcom.com, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit 6a41b6c5fc20 ("gpio: Add xgs-iproc driver") introduced a new
GPIO driver for the Broadcom GPIO controller. When this driver is built
as a module the following warning is observed because the
bcm_iproc_gpio_of_match structure is defined with the __initconst
attribute ...

 MODPOST vmlinux.o
 WARNING: vmlinux.o(.data+0x834d0): Section mismatch in reference from
 the variable bcm_iproc_gpio_driver to the variable
 .init.rodata:bcm_iproc_gpio_of_match
 The variable bcm_iproc_gpio_driver references
 the variable __initconst bcm_iproc_gpio_of_match

This then causes a translation fault on boot which and results in a
system crash. Fix this by dropping the __initconst attribute from the
bcm_iproc_gpio_of_match structure.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpio/gpio-xgs-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index a3fdd95cc9e6..bb183f584d92 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -299,7 +299,7 @@ static int __exit iproc_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
+static const struct of_device_id bcm_iproc_gpio_of_match[] = {
 	{ .compatible = "brcm,iproc-gpio-cca" },
 	{}
 };
-- 
2.17.1
