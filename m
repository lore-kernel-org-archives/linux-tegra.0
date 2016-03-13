From: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Staging: nvec: removes useless cast on a void pointer.
Date: Sun, 13 Mar 2016 19:14:38 +0100
Message-ID: <20160313181435.GA12242@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: marvin24-Mmb7MZpHnFY@public.gmane.org, ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Patch to nvec.c to remove a useless cast on a void pointer.

Signed-off-by: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index c335ae2..52d1363 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -141,7 +141,7 @@ static int nvec_status_notifier(struct notifier_block *nb,
 {
 	struct nvec_chip *nvec = container_of(nb, struct nvec_chip,
 						nvec_status_notifier);
-	unsigned char *msg = (unsigned char *)data;
+	unsigned char *msg = data;
 
 	if (event_type != NVEC_CNTL)
 		return NOTIFY_DONE;
-- 
1.9.1
