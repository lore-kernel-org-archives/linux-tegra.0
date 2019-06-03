From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 4/8] regulator: core Bump MAX_COUPLED to 3
Date: Tue,  4 Jun 2019 02:59:00 +0300
Message-ID: <20190603235904.19097-5-digetx@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603235904.19097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra20 SoC's couple 3 regulators, bump the MAX_COUPLED accordingly
to support that case of coupling.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/regulator/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index dfd8e518b283..5e81020d66ae 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -15,7 +15,7 @@
 #ifndef __LINUX_REGULATOR_DRIVER_H_
 #define __LINUX_REGULATOR_DRIVER_H_
 
-#define MAX_COUPLED		2
+#define MAX_COUPLED		3
 
 #include <linux/device.h>
 #include <linux/notifier.h>
-- 
2.21.0
