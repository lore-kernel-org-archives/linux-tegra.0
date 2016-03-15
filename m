From: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Staging: nvec: removes a useless cast on a void pointer
Date: Tue, 15 Mar 2016 19:37:54 +0100
Message-ID: <20160315183749.GA10628@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Remove an unnecessary cast on a void pointer in nvec_power.c

Signed-off-by: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec_power.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index b4a0545..fcbb0fa 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -90,7 +90,7 @@ static int nvec_power_notifier(struct notifier_block *nb,
 {
 	struct nvec_power *power =
 	    container_of(nb, struct nvec_power, notifier);
-	struct bat_response *res = (struct bat_response *)data;
+	struct bat_response *res = data;
 
 	if (event_type != NVEC_SYS)
 		return NOTIFY_DONE;
@@ -126,7 +126,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 {
 	struct nvec_power *power =
 	    container_of(nb, struct nvec_power, notifier);
-	struct bat_response *res = (struct bat_response *)data;
+	struct bat_response *res = data;
 	int status_changed = 0;
 
 	if (event_type != NVEC_BAT)
-- 
1.9.1
