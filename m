From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/4] gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell functions
Date: Mon,  8 Jul 2019 07:01:35 -0400
Message-ID: <20190708110138.24657-2-masneyb@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org, jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com, linux-tegra@vger.kernel.org, david.daney@cavium.com, yamada.masahiro@socionext.com, treding@nvidia.com, bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Introduce the functions gpiochip_populate_parent_fwspec_{two,four}cell
that will be used for hierarchical IRQ support in GPIO drivers.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpio/gpiolib.c      | 24 ++++++++++++++++++++++++
 include/linux/gpio/driver.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d767e111694d..06c9cf714c99 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1946,6 +1946,30 @@ static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
 	return !!gc->irq.parent_domain;
 }
 
+void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+					     struct irq_fwspec *fwspec,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type)
+{
+	fwspec->param_count = 2;
+	fwspec->param[0] = parent_hwirq;
+	fwspec->param[1] = parent_type;
+}
+EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_twocell);
+
+void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+					      struct irq_fwspec *fwspec,
+					      unsigned int parent_hwirq,
+					      unsigned int parent_type)
+{
+	fwspec->param_count = 4;
+	fwspec->param[0] = 0;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = 0;
+	fwspec->param[3] = parent_type;
+}
+EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_fourcell);
+
 #else
 
 static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 682ad09e29f4..6b6bca20c8f9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -493,6 +493,36 @@ struct bgpio_pdata {
 	int ngpio;
 };
 
+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
+
+void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+					     struct irq_fwspec *fwspec,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type);
+void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+					      struct irq_fwspec *fwspec,
+					      unsigned int parent_hwirq,
+					      unsigned int parent_type);
+
+#else
+
+static void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+						    struct irq_fwspec *fwspec,
+						    unsigned int parent_hwirq,
+						    unsigned int parent_type)
+{
+}
+
+static void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+						     struct irq_fwspec *fwspec,
+						     unsigned int parent_hwirq,
+						     unsigned int parent_type)
+{
+}
+
+#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
+
+
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 
 int bgpio_init(struct gpio_chip *gc, struct device *dev,
-- 
2.20.1
