From: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH] include/linux/platform_data/tegra_emc.h: Remove unused header
Date: Thu, 28 Aug 2014 13:54:18 +0200
Message-ID: <1409226858-3406-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The header file include/linux/platform_data/tegra_emc.h does not seem
to be used anywhere. It was orphaned by a7cbe92c "ARM: tegra: remove
tegra EMC scaling driver". Remove it.

Signed-off-by: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 include/linux/platform_data/tegra_emc.h | 34 ---------------------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 include/linux/platform_data/tegra_emc.h

diff --git a/include/linux/platform_data/tegra_emc.h b/include/linux/platform_data/tegra_emc.h
deleted file mode 100644
index df67505..0000000
--- a/include/linux/platform_data/tegra_emc.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/*
- * Copyright (C) 2011 Google, Inc.
- *
- * Author:
- *	Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
- *	Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
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
-#ifndef __TEGRA_EMC_H_
-#define __TEGRA_EMC_H_
-
-#define TEGRA_EMC_NUM_REGS 46
-
-struct tegra_emc_table {
-	unsigned long rate;
-	u32 regs[TEGRA_EMC_NUM_REGS];
-};
-
-struct tegra_emc_pdata {
-	int num_tables;
-	struct tegra_emc_table *tables;
-};
-
-#endif
-- 
2.0.4
