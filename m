From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 8/9] gpio: tegra186: Rename flow variable to type
Date: Fri, 21 Sep 2018 12:25:45 +0200
Message-ID: <20180921102546.12745-9-thierry.reding@gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The IRQ core code refers to the interrupt type by that name, whereas the
term flow is almost never used. Some GPIO controllers use the term
flow_type, but it is most consistent to just go with the IRQ core
terminology.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9d0292c8a199..66ec38bb7954 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -279,7 +279,7 @@ static void tegra186_irq_unmask(struct irq_data *data)
 	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
 }
 
-static int tegra186_irq_set_type(struct irq_data *data, unsigned int flow)
+static int tegra186_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_gpio *gpio = irq_data_get_irq_chip_data(data);
 	void __iomem *base;
@@ -293,7 +293,7 @@ static int tegra186_irq_set_type(struct irq_data *data, unsigned int flow)
 	value &= ~TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_MASK;
 	value &= ~TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL;
 
-	switch (flow & IRQ_TYPE_SENSE_MASK) {
+	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_NONE:
 		break;
 
@@ -325,7 +325,7 @@ static int tegra186_irq_set_type(struct irq_data *data, unsigned int flow)
 
 	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
 
-	if ((flow & IRQ_TYPE_EDGE_BOTH) == 0)
+	if ((type & IRQ_TYPE_EDGE_BOTH) == 0)
 		irq_set_handler_locked(data, handle_level_irq);
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
-- 
2.19.0
