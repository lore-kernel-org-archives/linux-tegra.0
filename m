From: Dmitry Osipenko <digetx@gmail.com>
Subject: [RFC PATCH v1 4/6] regulator: core Bump MAX_COUPLED to 3
Date: Sun, 14 Apr 2019 20:59:37 +0300
Message-ID: <20190414175939.12368-5-digetx@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414175939.12368-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra20 SoC's couple 3 regulators, bump the MAX_COUPLED accordingly
to support that case of coupling.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/regulator/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 25c5a1862af2..25826f2b0ceb 100644
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
