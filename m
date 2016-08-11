From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/6] i2c: tegra: Simplify I2C resume
Date: Thu, 11 Aug 2016 11:16:58 +0100
Message-ID: <1470910620-9898-5-git-send-email-jonathanh@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The I2C adapter is unlocked regardless of whether the tegra_i2c_init()
called during the resume is successful or not. However, if the
tegra_i2c_init() is not successful, then ->is_suspended is not set to
false. Simplify the resume code by only setting ->is_suspended to false
if tegra_i2c_init() is successful and return the error code from
tegra_i2c_init().

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 57f9c1612533..4eaf3c4a531b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -984,17 +984,12 @@ static int tegra_i2c_resume(struct device *dev)
 	i2c_lock_adapter(&i2c_dev->adapter);
 
 	ret = tegra_i2c_init(i2c_dev);
-
-	if (ret) {
-		i2c_unlock_adapter(&i2c_dev->adapter);
-		return ret;
-	}
-
-	i2c_dev->is_suspended = false;
+	if (!ret)
+		i2c_dev->is_suspended = false;
 
 	i2c_unlock_adapter(&i2c_dev->adapter);
 
-	return 0;
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(tegra_i2c_pm, tegra_i2c_suspend, tegra_i2c_resume);
-- 
2.1.4
