From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] soc: tegra: remove redundant $(CONFIG_ARCH_TEGRA) in Makefile
Date: Fri, 31 Jul 2015 14:58:21 +0900
Message-ID: <1438322301-24584-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Kbuild descends into drivers/soc/tegra/ only when CONFIG_ARCH_TEGRA
is enabled. (see drivers/soc/Makefile)

$(CONFIG_ARCH_TEGRA) in drivers/soc/tegra/Makefile always evaluates
to 'y'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/soc/tegra/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index cdaad9d..ae857ff 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_ARCH_TEGRA) += fuse/
+obj-y += fuse/
 
-obj-$(CONFIG_ARCH_TEGRA) += common.o
-obj-$(CONFIG_ARCH_TEGRA) += pmc.o
+obj-y += common.o
+obj-y += pmc.o
-- 
1.9.1
