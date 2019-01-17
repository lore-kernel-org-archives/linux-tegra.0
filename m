From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1] i2c: tegra: increase transfer timeout
Date: Thu, 17 Jan 2019 12:39:32 -0800
Message-ID: <1547757572-29075-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

increase transfer timeout to 10s to allow enough time during max
transfer size.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e417ebf7628c..ca7c581fb4c0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -25,7 +25,7 @@
 
 #include <asm/unaligned.h>
 
-#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
+#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(10000))
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
-- 
2.7.4
