From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] memory: tegra: include linux/spinlock.h
Date: Fri, 25 May 2018 23:11:39 +0200
Message-ID: <20180525211155.1928474-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The newly added code in this file causes a build error unless
we include linux/spinlock.h, at least in some configurations:

In file included from drivers/memory/tegra/mc.h:15,
                 from drivers/memory/tegra/tegra20.c:11:
include/soc/tegra/mc.h:159:2: error: unknown type name 'spinlock_t'
  spinlock_t lock;
  ^~~~~~~~~~
drivers/memory/tegra/tegra20.c: In function 'terga20_mc_hotreset_assert':
drivers/memory/tegra/tegra20.c:207:2: error: implicit declaration of function 'spin_lock_irqsave'; did you mean 'arch_local_irq_save'? [-Werror=implicit-function-declaration]
  spin_lock_irqsave(&mc->lock, flags);
  ^~~~~~~~~~~~~~~~~

Fixes: cb557757e1aa ("memory: tegra: Add Tegra20 memory controller hot resets")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/memory/tegra/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 7119e532471c..8853e21b773f 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -6,6 +6,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/spinlock.h>
 #include <dt-bindings/memory/tegra20-mc.h>
 
 #include "mc.h"
-- 
2.9.0
