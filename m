From: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging:nvec:nvec_ps2.c: Prefering
 kzalloc(sizeof(*ser_dev)...) over kzalloc(sizeof(struct serio)...)
Date: Tue, 14 Feb 2017 22:31:20 +0530
Message-ID: <20170214170120.GA6501@arushi-HP-Pavilion-Notebook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marvin24-Mmb7MZpHnFY@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Prefer kzalloc(sizeof(*ser_dev)...) over kzalloc(sizeof(struct
serio)...) as reported by checkpatch.pl.

Signed-off-by: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 499952c8ef39..3b7bce3ffd19 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -107,7 +107,7 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	struct serio *ser_dev;
 
-	ser_dev = kzalloc(sizeof(struct serio), GFP_KERNEL);
+	ser_dev = kzalloc(sizeof(*ser_dev), GFP_KERNEL);
 	if (!ser_dev)
 		return -ENOMEM;
 
-- 
2.11.0
