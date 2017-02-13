From: Franck Demathieu <fdemathieu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging: nvec: Fix incorrect type of i2c address
Date: Mon, 13 Feb 2017 09:35:19 +0100
Message-ID: <20170213083519.10309-1-fdemathieu@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marvin24-Mmb7MZpHnFY@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Franck Demathieu <franck.demathieu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

The i2c address is unsigned according to the dt-bindings.
Fix sparse issue (-Wtypesign):

  drivers/staging/nvec/nvec.c:781:35: warning: incorrect type in argument 3 (different signedness)
  drivers/staging/nvec/nvec.c:781:35:    expected unsigned int [usertype] *out_value
  drivers/staging/nvec/nvec.c:781:35:    got int *<noident>

Signed-off-by: Franck Demathieu <fdemathieu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.h b/drivers/staging/nvec/nvec.h
index c03ca8d..aa7c70e 100644
--- a/drivers/staging/nvec/nvec.h
+++ b/drivers/staging/nvec/nvec.h
@@ -138,7 +138,7 @@ struct nvec_chip {
 	struct device *dev;
 	int gpio;
 	int irq;
-	int i2c_addr;
+	u32 i2c_addr;
 	void __iomem *base;
 	struct clk *i2c_clk;
 	struct reset_control *rst;
-- 
2.8.1
