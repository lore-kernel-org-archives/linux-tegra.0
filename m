From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 3/7] of: Add PWM support.
Date: Tue, 20 Dec 2011 11:32:14 +0100
Message-ID: <1324377138-32129-4-git-send-email-thierry.reding@avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324377138-32129-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds helpers to support device-tree bindings for the generic
PWM API.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/of/Kconfig     |    6 +++
 drivers/of/Makefile    |    1 +
 drivers/of/pwm.c       |   88 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_pwm.h |   41 ++++++++++++++++++++++
 include/linux/pwm.h    |    4 ++
 5 files changed, 140 insertions(+), 0 deletions(-)
 create mode 100644 drivers/of/pwm.c
 create mode 100644 include/linux/of_pwm.h

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index cac63c9..62a2073 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -47,6 +47,12 @@ config OF_GPIO
 	help
 	  OpenFirmware GPIO accessors
 
+config OF_PWM
+	def_bool y
+	depends on PWM
+	help
+	  OpenFirmware PWM accessors
+
 config OF_I2C
 	def_tristate I2C
 	depends on I2C && !SPARC
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index dccb117..c3acf27 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_OF_ADDRESS)  += address.o
 obj-$(CONFIG_OF_IRQ)    += irq.o
 obj-$(CONFIG_OF_DEVICE) += device.o platform.o
 obj-$(CONFIG_OF_GPIO)   += gpio.o
+obj-$(CONFIG_OF_PWM)	+= pwm.o
 obj-$(CONFIG_OF_I2C)	+= of_i2c.o
 obj-$(CONFIG_OF_NET)	+= of_net.o
 obj-$(CONFIG_OF_SPI)	+= of_spi.o
diff --git a/drivers/of/pwm.c b/drivers/of/pwm.c
new file mode 100644
index 0000000..c0ef302
--- /dev/null
+++ b/drivers/of/pwm.c
@@ -0,0 +1,88 @@
+/*
+ * OF helpers for the PWM API
+ *
+ * Copyright (c) 2011 Avionic Design GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pwm.h>
+
+static int of_pwmchip_is_match(struct pwm_chip *chip, void *data)
+{
+	return chip->of_node == data;
+}
+
+/**
+ * of_node_to_pwmchip() - finds the PWM chip associated with a device node
+ * @np:		device node of the PWM chip
+ *
+ * Returns a pointer to the PWM chip associated with the specified device
+ * node or NULL if the device node doesn't represent a PWM chip.
+ */
+struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
+{
+	return pwmchip_find(np, of_pwmchip_is_match);
+}
+
+/**
+ * of_get_named_pwm() - get a PWM number and period to use with the PWM API
+ * @np:		device node to get the PWM from
+ * @propname:	property name containing PWM specifier(s)
+ * @index:	index of the PWM
+ * @period_ns:	a pointer to the PWM period (in ns) to fill in
+ *
+ * Returns PWM number to use with the Linux generic PWM API or a negative
+ * error code on failure. If @period_ns is not NULL the function fills in
+ * the value parsed from the period-ns property.
+ */
+int of_get_named_pwm(struct device_node *np, const char *propname,
+		     int index, unsigned int *period_ns)
+{
+	struct device_node *pwm_np;
+	const void *pwm_spec;
+	struct pwm_chip *pc;
+	const __be32 *spec;
+	u32 cells;
+	u32 pwm;
+	int ret;
+
+	ret = of_parse_phandles_with_args(np, propname, "#pwm-cells", index,
+					  &pwm_np, &pwm_spec);
+	if (ret) {
+		pr_debug("%s(): can't parse pwms property\n", __func__);
+		goto out;
+	}
+
+	pc = of_node_to_pwmchip(pwm_np);
+	if (!pc) {
+		ret = -ENODEV;
+		goto put;
+	}
+
+	ret = of_property_read_u32(pwm_np, "#pwm-cells", &cells);
+	if (ret < 0)
+		goto put;
+
+	spec = (const __be32 *)pwm_spec;
+	pwm = be32_to_cpup(pwm_spec);
+
+	if ((cells > 1) && period_ns)
+		*period_ns = be32_to_cpu(spec[1]);
+
+	ret = pc->base + pwm;
+
+put:
+	of_node_put(pwm_np);
+out:
+	pr_debug("%s() exited with status %d\n", __func__, ret);
+	return ret;
+}
+EXPORT_SYMBOL(of_get_named_pwm);
diff --git a/include/linux/of_pwm.h b/include/linux/of_pwm.h
new file mode 100644
index 0000000..8d6d569
--- /dev/null
+++ b/include/linux/of_pwm.h
@@ -0,0 +1,41 @@
+/*
+ * OF helpers for the PWM API
+ *
+ * Copyright (c) 2011 Avionic Design GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __LINUX_OF_PWM_H
+#define __LINUX_OF_PWM_H
+
+#include <linux/pwm.h>
+
+struct device_node;
+
+#ifdef CONFIG_OF_PWM
+
+struct pwm_chip *of_node_to_pwmchip(struct device_node *np);
+int of_get_named_pwm(struct device_node *np, const char *propname,
+		     int index, unsigned int *period_ns);
+
+#else
+
+static inline struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
+{
+	return NULL;
+}
+
+static inline int of_get_named_pwm(struct device_node *np,
+				   const char *propname, int index,
+				   unsigned int *period_ns)
+{
+	return -ENOSYS;
+}
+
+#endif /* CONFIG_OF_PWM */
+
+#endif /* __LINUX_OF_PWM_H */
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 01c0153..d6be4e4 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -65,6 +65,10 @@ struct pwm_chip {
 	struct pwm_ops		*ops;
 	int			base;
 	unsigned int		npwm;
+
+#ifdef CONFIG_OF_PWM
+	struct device_node	*of_node;
+#endif
 };
 
 int pwmchip_add(struct pwm_chip *chip);
-- 
1.7.8
