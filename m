From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 02/61] gpio: Add resource management devm_gpio_chip_{add_data,remove}
Date: Mon, 22 Feb 2016 19:37:51 +0530
Message-ID: <1456150130-2668-3-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: ldewangan@nvidia.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add devm wrappers for the gpiochip_add_data() and gpiochip_remove().

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 Documentation/driver-model/devres.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 831a536..8d8f944 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -252,6 +252,8 @@ GPIO
   devm_gpiod_get_index_optional()
   devm_gpiod_get_optional()
   devm_gpiod_put()
+  devm_gpiochip_add_data()
+  devm_gpiochip_remove()
 
 IIO
   devm_iio_device_alloc()
-- 
2.1.4
