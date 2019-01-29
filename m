From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 2/6] clocksource: tegra: add Tegra210 timer driver
Date: Tue, 29 Jan 2019 17:28:19 +0800
Message-ID: <20190129092823.24983-3-josephl@nvidia.com>
References: <20190129092823.24983-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129092823.24983-1-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra210 timer that runs at oscillator clock
(TMR10-TMR13). We need these timers to work as clock event device and to
replace the ARMv8 architected timer due to it can't survive across the
power cycle of the CPU core or CPUPORESET signal. So it can't be a wake-up
source when CPU suspends in power down state.

Based on the work of Antti P Miettinen <amiettinen@nvidia.com>

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v3:
 * use timer-of API
v2:
 * add error clean-up code
---
 drivers/clocksource/Kconfig          |   8 +
 drivers/clocksource/Makefile         |   1 +
 drivers/clocksource/timer-tegra210.c | 246 +++++++++++++++++++++++++++
 include/linux/cpuhotplug.h           |   1 +
 4 files changed, 256 insertions(+)
 create mode 100644 drivers/clocksource/timer-tegra210.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index a9e26f6a81a1..059b1b3f2adb 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -135,6 +135,14 @@ config TEGRA_TIMER
 	help
 	  Enables support for the Tegra driver.
=20
+config TEGRA210_TIMER
+	bool "Tegra210 timer driver"
+	default y if ARCH_TEGRA_210_SOC
+	depends on ARCH_TEGRA_210_SOC
+	select TIMER_OF
+	help
+	  Enable support for the Tegra210 driver.
+
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index cdd210ff89ea..95de59c8a47b 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SUN4I_TIMER)	+=3D timer-sun4i.o
 obj-$(CONFIG_SUN5I_HSTIMER)	+=3D timer-sun5i.o
 obj-$(CONFIG_MESON6_TIMER)	+=3D timer-meson6.o
 obj-$(CONFIG_TEGRA_TIMER)	+=3D timer-tegra20.o
+obj-$(CONFIG_TEGRA210_TIMER)	+=3D timer-tegra210.o
 obj-$(CONFIG_VT8500_TIMER)	+=3D timer-vt8500.o
 obj-$(CONFIG_NSPIRE_TIMER)	+=3D timer-zevio.o
 obj-$(CONFIG_BCM_KONA_TIMER)	+=3D bcm_kona_timer.o
diff --git a/drivers/clocksource/timer-tegra210.c b/drivers/clocksource/tim=
er-tegra210.c
new file mode 100644
index 000000000000..7bc751c7da99
--- /dev/null
+++ b/drivers/clocksource/timer-tegra210.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/percpu.h>
+#include <linux/syscore_ops.h>
+
+#include "timer-of.h"
+
+#define TIMER_PTV		0x0
+#define TIMER_PTV_EN		BIT(31)
+#define TIMER_PTV_PER		BIT(30)
+#define TIMER_PCR		0x4
+#define TIMER_PCR_INTR_CLR	BIT(30)
+#define TIMERUS_CNTR_1US	0x10
+#define TIMERUS_USEC_CFG	0x14
+
+#define TIMER10_OFFSET		0x90
+#define TIMER10_IRQ_IDX		10
+
+#define TIMER_FOR_CPU(cpu) (TIMER10_OFFSET + (cpu) * 8)
+#define IRQ_IDX_FOR_CPU(cpu)	(TIMER10_IRQ_IDX + cpu)
+#define get_cpu_timer_reg_base(evt) 				\
+({								\
+	struct timer_of *to =3D to_timer_of(evt);			\
+	timer_of_base(to) + TIMER_FOR_CPU(smp_processor_id());	\
+})
+
+static u32 usec_config;
+
+static int tegra210_timer_set_next_event(unsigned long cycles,
+					 struct clock_event_device *evt)
+{
+	void __iomem *reg_base =3D get_cpu_timer_reg_base(evt);
+
+	writel(TIMER_PTV_EN |
+	       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
+	       reg_base + TIMER_PTV);
+
+	return 0;
+}
+
+static int tegra210_timer_shutdown(struct clock_event_device *evt)
+{
+	void __iomem *reg_base =3D get_cpu_timer_reg_base(evt);
+
+	writel(0, reg_base + TIMER_PTV);
+
+	return 0;
+}
+
+static int tegra210_timer_set_periodic(struct clock_event_device *evt)
+{
+	void __iomem *reg_base =3D get_cpu_timer_reg_base(evt);
+
+	writel(TIMER_PTV_EN | TIMER_PTV_PER |
+	       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
+	       reg_base + TIMER_PTV);
+
+	return 0;
+}
+
+static irqreturn_t tegra210_timer_isr(int irq, void *dev_id)
+{
+	struct clock_event_device *evt =3D (struct clock_event_device *)dev_id;
+	void __iomem *reg_base =3D get_cpu_timer_reg_base(evt);
+
+	writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static DEFINE_PER_CPU(struct timer_of, tegra_to) =3D {
+	.flags =3D TIMER_OF_CLOCK | TIMER_OF_BASE,
+	.clkevt =3D {
+		.name =3D "tegra_timer",
+		.rating =3D 460,
+		.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
+		.set_next_event =3D tegra210_timer_set_next_event,
+		.set_state_shutdown =3D tegra210_timer_shutdown,
+		.set_state_periodic =3D tegra210_timer_set_periodic,
+		.set_state_oneshot =3D tegra210_timer_shutdown,
+		.tick_resume =3D tegra210_timer_shutdown,
+	},
+};
+
+static int tegra210_timer_setup(unsigned int cpu)
+{
+	struct timer_of *to =3D per_cpu_ptr(&tegra_to, cpu);
+
+	irq_force_affinity(to->clkevt.irq, cpumask_of(cpu));
+	enable_irq(to->clkevt.irq);
+
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
+					1, /* min */
+					0x1fffffff); /* 29 bits */
+
+	return 0;
+}
+
+static int tegra210_timer_stop(unsigned int cpu)
+{
+	struct timer_of *to =3D per_cpu_ptr(&tegra_to, cpu);
+
+	to->clkevt.set_state_shutdown(&to->clkevt);
+	disable_irq_nosync(to->clkevt.irq);
+
+	return 0;
+}
+
+static int tegra_timer_suspend(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct timer_of *to =3D per_cpu_ptr(&tegra_to, cpu);
+		void __iomem *reg_base =3D timer_of_base(to) +
+					 TIMER_FOR_CPU(cpu);
+		writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
+	}
+
+	return 0;
+}
+
+static void tegra_timer_resume(void)
+{
+	struct timer_of *to =3D this_cpu_ptr(&tegra_to);
+	writel(usec_config, timer_of_base(to) + TIMERUS_USEC_CFG);
+}
+
+static struct syscore_ops tegra_timer_syscore_ops =3D {
+	.suspend =3D tegra_timer_suspend,
+	.resume =3D tegra_timer_resume,
+};
+
+static int __init tegra210_timer_init(struct device_node *np)
+{
+	int cpu, ret =3D 0;
+	struct timer_of *to;
+
+	to =3D this_cpu_ptr(&tegra_to);
+	ret =3D timer_of_init(np, to);
+	if (ret)
+		goto out_to;
+
+	for_each_possible_cpu(cpu) {
+		struct timer_of *cpu_to;
+		cpu_to =3D per_cpu_ptr(&tegra_to, cpu);
+
+		cpu_to->of_base.base =3D timer_of_base(to);
+		cpu_to->of_clk.rate =3D timer_of_rate(to);
+		cpu_to->clkevt.cpumask =3D cpumask_of(cpu);
+
+		cpu_to->clkevt.irq =3D
+			irq_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
+		if (!cpu_to->clkevt.irq) {
+			pr_err("%s: can't map IRQ for CPU%d\n",
+			       __func__, cpu);
+			ret =3D -EINVAL;
+			goto out_to;
+		}
+
+		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
+		ret =3D request_irq(cpu_to->clkevt.irq, tegra210_timer_isr,
+				  IRQF_TIMER | IRQF_NOBALANCING,
+				  cpu_to->clkevt.name, &cpu_to->clkevt);
+		if (ret) {
+			pr_err("%s: cannot setup irq %d for CPU%d\n",
+				__func__, cpu_to->clkevt.irq, cpu);
+			ret =3D -EINVAL;
+			goto out_irq;
+		}
+	}
+
+	/*
+	 * Configure microsecond timers to have 1MHz clock
+	 * Config register is 0xqqww, where qq is "dividend", ww is "divisor"
+	 * Uses n+1 scheme
+	 */
+	switch (timer_of_rate(to)) {
+	case 12000000:
+		usec_config =3D 0x000b; /* (11+1)/(0+1) */
+		break;
+	case 12800000:
+		usec_config =3D 0x043f; /* (63+1)/(4+1) */
+		break;
+	case 13000000:
+		usec_config =3D 0x000c; /* (12+1)/(0+1) */
+		break;
+	case 16800000:
+		usec_config =3D 0x0453; /* (83+1)/(4+1) */
+		break;
+	case 19200000:
+		usec_config =3D 0x045f; /* (95+1)/(4+1) */
+		break;
+	case 26000000:
+		usec_config =3D 0x0019; /* (25+1)/(0+1) */
+		break;
+	case 38400000:
+		usec_config =3D 0x04bf; /* (191+1)/(4+1) */
+		break;
+	case 48000000:
+		usec_config =3D 0x002f; /* (47+1)/(0+1) */
+		break;
+	default:
+		ret =3D -EINVAL;
+		goto out_irq;
+	}
+
+	writel(usec_config, timer_of_base(to) + TIMERUS_USEC_CFG);
+
+	cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
+			  "AP_TEGRA_TIMER_STARTING", tegra210_timer_setup,
+			  tegra210_timer_stop);
+
+	register_syscore_ops(&tegra_timer_syscore_ops);
+
+	return ret;
+
+out_irq:
+	for_each_possible_cpu(cpu) {
+		struct timer_of *cpu_to;
+		cpu_to =3D per_cpu_ptr(&tegra_to, cpu);
+		if (cpu_to->clkevt.irq) {
+			free_irq(cpu_to->clkevt.irq, &cpu_to->clkevt);
+			irq_dispose_mapping(cpu_to->clkevt.irq);
+		}
+	}
+out_to:
+	timer_of_cleanup(to);
+
+	return ret;
+}
+
+TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_timer_i=
nit);
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index fd586d0301e7..e78281d07b70 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -121,6 +121,7 @@ enum cpuhp_state {
 	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
 	CPUHP_AP_ARM_TWD_STARTING,
 	CPUHP_AP_QCOM_TIMER_STARTING,
+	CPUHP_AP_TEGRA_TIMER_STARTING,
 	CPUHP_AP_ARMADA_TIMER_STARTING,
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
--=20
2.20.1
