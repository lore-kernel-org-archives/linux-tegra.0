From: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Subject: [PATCH RESEND] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter
 functionality
Date: Mon, 11 Jul 2011 10:37:55 +0300
Message-ID: <20110711073755.GA8665@gentoodev.compulab.local>
Reply-To: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>"@mike-pc.compulab.local
Cc: "Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>"@mike-pc.compulab.local, "Stephen Warren swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org"@mike-pc.compulab.local, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Ben,
This patch has been waiting for quite a long time and I've got no response
from you concerning it.
Can you _please_ at last merge it so it'll make to 3.1?

--
Sincerely yours,
Mike,


From 5ac2b2824d2d49954aa9897344481e32f2368749 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Date: Mon, 11 Jul 2011 10:28:57 +0300
Subject: [PATCH] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter functionality

as there are a lot of i2c device drivers that require it

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4d93196..2fe4951 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -524,7 +524,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 
 static u32 tegra_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-- 
1.7.3.1
