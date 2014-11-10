From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] misc: Remove unused subdirectory
Date: Mon, 10 Nov 2014 16:09:56 +0100
Message-ID: <1415632196-13516-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit 783c8f4c8445 ("soc/tegra: Add efuse driver for Tegra") added a
fuse directory in drivers/misc along with a Makefile that were never
used. They were leftovers from an earlier version of the patch series.

Reported-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/misc/fuse/Makefile | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 drivers/misc/fuse/Makefile

diff --git a/drivers/misc/fuse/Makefile b/drivers/misc/fuse/Makefile
deleted file mode 100644
index 0679c4febc89..000000000000
--- a/drivers/misc/fuse/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
-- 
2.1.3
