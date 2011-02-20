From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/7] ARM: tegra: refactor pcie init
Date: Sat, 19 Feb 2011 23:44:39 -0600
Message-ID: <1298180684-6261-3-git-send-email-olof@lixom.net>
References: <1298180684-6261-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298180684-6261-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PCIe init is really quite simple. The per-board specifications can be
moved into the base board file instead, and pass in the pinmux groups
to enable/disable when setting up PCIe.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile             |    1 -
 arch/arm/mach-tegra/board-harmony-pcie.c |   57 ------------------------------
 arch/arm/mach-tegra/board-harmony.c      |   14 +++++++
 arch/arm/mach-tegra/board.h              |   14 +++++++-
 arch/arm/mach-tegra/pcie.c               |   20 +++++++---
 5 files changed, 41 insertions(+), 65 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-harmony-pcie.c

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 6b537de..9e314cc 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_TEGRA_PCI)			+= pcie.o
 
 obj-${CONFIG_MACH_HARMONY}              += board-harmony.o
 obj-${CONFIG_MACH_HARMONY}              += board-harmony-pinmux.o
-obj-${CONFIG_MACH_HARMONY}              += board-harmony-pcie.o
 
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice.o
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice-pinmux.o
diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
deleted file mode 100644
index f7e7d45..0000000
--- a/arch/arm/mach-tegra/board-harmony-pcie.c
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * arch/arm/mach-tegra/board-harmony-pcie.c
- *
- * Copyright (C) 2010 CompuLab, Ltd.
- * Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#include <linux/kernel.h>
-#include <linux/gpio.h>
-#include <linux/err.h>
-#include <linux/regulator/consumer.h>
-
-#include <asm/mach-types.h>
-
-#include <mach/pinmux.h>
-#include "board.h"
-
-#ifdef CONFIG_TEGRA_PCI
-
-static int __init harmony_pcie_init(void)
-{
-	int err;
-
-	if (!machine_is_harmony())
-		return 0;
-
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_GPV, TEGRA_TRI_NORMAL);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXA, TEGRA_TRI_NORMAL);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXK, TEGRA_TRI_NORMAL);
-
-	err = tegra_pcie_init(true, true);
-	if (err)
-		goto err_pcie;
-
-	return 0;
-
-err_pcie:
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_GPV, TEGRA_TRI_TRISTATE);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXA, TEGRA_TRI_TRISTATE);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXK, TEGRA_TRI_TRISTATE);
-
-	return err;
-}
-
-subsys_initcall(harmony_pcie_init);
-
-#endif
diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index b9dbdb1..652dd68 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -30,6 +30,7 @@
 
 #include <mach/iomap.h>
 #include <mach/irqs.h>
+#include <mach/pinmux-t2.h>
 
 #include "board.h"
 #include "board-harmony.h"
@@ -102,6 +103,17 @@ static __initdata struct tegra_clk_init_table harmony_clk_init_table[] = {
 	{ NULL,		NULL,		0,		0},
 };
 
+struct tegra_pcie_info harmony_pcie_info = {
+	.init_port0	= true,
+	.init_port1	= true,
+	.nr_pingroups	= 3,
+	.pingroups	= {
+		TEGRA_PINGROUP_GPV,
+		TEGRA_PINGROUP_SLXA,
+		TEGRA_PINGROUP_SLXK,
+	},
+};
+
 static void __init tegra_harmony_init(void)
 {
 	tegra_common_init();
@@ -111,6 +123,8 @@ static void __init tegra_harmony_init(void)
 	harmony_pinmux_init();
 
 	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
+
+	tegra_pcie_init(&harmony_pcie_info);
 }
 
 MACHINE_START(HARMONY, "harmony")
diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
index b3f9c94..a84ec3a 100644
--- a/arch/arm/mach-tegra/board.h
+++ b/arch/arm/mach-tegra/board.h
@@ -23,13 +23,25 @@
 
 #include <linux/types.h>
 
+struct tegra_pcie_info {
+	bool	init_port0;
+	bool	init_port1;
+	int	nr_pingroups;
+	int	pingroups[];
+};
+
 void tegra_assert_system_reset(char mode, const char *cmd);
 
 void __init tegra_common_init(void);
 void __init tegra_map_common_io(void);
 void __init tegra_init_irq(void);
 void __init tegra_init_clock(void);
-int __init tegra_pcie_init(bool init_port0, bool init_port1);
+
+#ifdef CONFIG_TEGRA_PCI
+void __init tegra_pcie_init(struct tegra_pcie_info *);
+#else
+static inline void tegra_pcie_init(struct tegra_pcie_info *i) { }
+#endif
 
 extern struct sys_timer tegra_timer;
 #endif
diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index 53f5fa3..c8e69ed 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -887,29 +887,37 @@ static void __init tegra_pcie_add_port(int index, u32 offset, u32 reset_reg)
 	memset(pp->res, 0, sizeof(pp->res));
 }
 
-int __init tegra_pcie_init(bool init_port0, bool init_port1)
+int __init tegra_pcie_init(struct tegra_pcie_info *tegra_pcie_info)
 {
 	int err;
+	int i;
 
-	if (!(init_port0 || init_port1))
-		return -ENODEV;
+	for (i = 0; i < tegra_pcie_info->nr_pingroups; i++)
+		tegra_pinmux_set_tristate(tegra_pcie_info[i]->pingroup,
+					  TEGRA_TRI_NORMAL);
 
 	err = tegra_pcie_get_resources();
 	if (err)
-		return err;
+		goto err;
 
 	tegra_pcie_enable_controller();
 
 	/* setup the AFI address translations */
 	tegra_pcie_setup_translations();
 
-	if (init_port0)
+	if (tegra_pcie_info->init_port0)
 		tegra_pcie_add_port(0, RP0_OFFSET, AFI_PEX0_CTRL);
 
-	if (init_port1)
+	if (tegra_pcie_info->init_port1)
 		tegra_pcie_add_port(1, RP1_OFFSET, AFI_PEX1_CTRL);
 
 	pci_common_init(&tegra_pcie_hw);
 
 	return 0;
+
+err:
+	for (i = 0; i < tegra_pcie_info->nr_pingroups; i++)
+		tegra_pinmux_set_tristate(tegra_pcie_info[i]->pingroup,
+					  TEGRA_TRI_TRISTATE);
+	return err;
 }
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
