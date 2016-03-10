From: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Staging: nvec: removes an unnecessary cast on a void pointer
Date: Thu, 10 Mar 2016 21:24:59 +0100
Message-ID: <20160310202456.GA8619@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org
Cc: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Patch to nvec_ps2.c to remove an unnecessary cast on a void pointer.

Signed-off-by: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 0922dd3..a324322 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -78,7 +78,7 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 			     unsigned long event_type, void *data)
 {
 	int i;
-	unsigned char *msg = (unsigned char *)data;
+	unsigned char *msg = data;
 
 	switch (event_type) {
 	case NVEC_PS2_EVT:
-- 
1.9.1
