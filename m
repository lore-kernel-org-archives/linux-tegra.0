From: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] staging: nvec: fix block comments
Date: Wed,  9 Dec 2015 08:14:06 +0100
Message-ID: <1449645246-18561-1-git-send-email-simon.guinot@sequanux.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch fixes a couple of checkpatch warnings about block comments.

Signed-off-by: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
---
 drivers/staging/nvec/nvec.c       |  6 ++++--
 drivers/staging/nvec/nvec_power.c | 14 +++++++++-----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 802c9597d421..cb0927ddd78f 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -508,8 +508,10 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 
 	spin_lock(&nvec->rx_lock);
 
-	/* add the received data to the work list
-	   and move the ring buffer pointer to the next entry */
+	/*
+	 * Add the received data to the work list and move the ring buffer
+	 * pointer to the next entry.
+	 */
 	list_add_tail(&nvec->rx->node, &nvec->rx_data);
 
 	spin_unlock(&nvec->rx_lock);
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 04a7402ae2df..b4a0545e8806 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -207,8 +207,10 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 	case TYPE:
 		memcpy(power->bat_type, &res->plc, res->length - 2);
 		power->bat_type[res->length - 2] = '\0';
-		/* this differs a little from the spec
-		   fill in more if you find some */
+		/*
+		 * This differs a little from the spec fill in more if you find
+		 * some.
+		 */
 		if (!strncmp(power->bat_type, "Li", 30))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
@@ -356,12 +358,14 @@ static void nvec_power_poll(struct work_struct *work)
 	if (counter >= ARRAY_SIZE(bat_iter))
 		counter = 0;
 
-/* AC status via sys req */
+	/* AC status via sys req */
 	nvec_write_async(power->nvec, buf, 2);
 	msleep(100);
 
-/* select a battery request function via round robin
-   doing it all at once seems to overload the power supply */
+	/*
+	 * Select a battery request function via round robin doing it all at
+	 * once seems to overload the power supply.
+	 */
 	buf[0] = NVEC_BAT;
 	buf[1] = bat_iter[counter++];
 	nvec_write_async(power->nvec, buf, 2);
-- 
2.1.4
