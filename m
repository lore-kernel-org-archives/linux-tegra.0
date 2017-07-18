From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] gpio: tegra: fix unbalanced chained_irq_enter/exit
Date: Tue, 18 Jul 2017 14:35:45 +0200
Message-ID: <a9c261800dbb662c9c703544817dc103e2937472.1500381146.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When more than one GPIO IRQs are triggered simultaneously,
tegra_gpio_irq_handler() called chained_irq_exit() multiple
times for one chained_irq_enter().

Fixes: 3c92db9ac0ca3eee8e46e2424b6c074e2e394ad9
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/gpio/gpio-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 88529d3c06c9..4bd99a38cae8 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -384,7 +384,7 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 			 * before executing the handler so that we don't
 			 * miss edges
 			 */
-			if (lvl & (0x100 << pin)) {
+			if (!unmasked && lvl & (0x100 << pin)) {
 				unmasked = 1;
 				chained_irq_exit(chip, desc);
 			}
-- 
2.11.0

