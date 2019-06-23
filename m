From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] i2c: tegra: Add Dmitry as a reviewer
Date: Sun, 23 Jun 2019 20:46:55 +0300
Message-ID: <20190623174655.25445-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I'm contributing to Tegra's upstream development in general and happened
to review the Tegra's I2C patches for awhile because I'm actively using
upstream kernel on all of my Tegra-powered devices and initially some of
the submitted patches were getting my attention since they were causing
problems. Recently Wolfram Sang asked whether I'm interested in becoming
a reviewer for the driver and I don't mind at all.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac347278f1fc..402c6ee32db6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15588,6 +15588,7 @@ F:	drivers/dma/tegra*
 
 TEGRA I2C DRIVER
 M:	Laxman Dewangan <ldewangan@nvidia.com>
+R:	Dmitry Osipenko <digetx@gmail.com>
 S:	Supported
 F:	drivers/i2c/busses/i2c-tegra.c
 
-- 
2.22.0
