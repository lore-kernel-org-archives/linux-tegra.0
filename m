From: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging: nvec: add missing blank line after declarations
Date: Mon,  7 Jul 2014 18:05:41 +0200
Message-ID: <1404749141-3943-1-git-send-email-pawel.lebioda89@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fix 'missing blank line after declaration' warnings reported by checkpatch.pl.
Signed-off-by: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec_paz00.c | 1 +
 drivers/staging/nvec/nvec_power.c | 1 +
 drivers/staging/nvec/nvec_ps2.c   | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 934b796..e2e675a 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -35,6 +35,7 @@ static void nvec_led_brightness_set(struct led_classdev *led_cdev,
 {
 	struct nvec_led *led = to_nvec_led(led_cdev);
 	unsigned char buf[] = NVEC_LED_REQ;
+
 	buf[4] = value;
 
 	nvec_write_async(led->nvec, buf, sizeof(buf));
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index aacfcd6..6446e15 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -226,6 +226,7 @@ static int nvec_power_get_property(struct power_supply *psy,
 				   union power_supply_propval *val)
 {
 	struct nvec_power *power = dev_get_drvdata(psy->dev->parent);
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_ONLINE:
 		val->intval = power->on;
diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 45b2f13..f56f1db 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -53,12 +53,14 @@ static struct nvec_ps2 ps2_dev;
 static int ps2_startstreaming(struct serio *ser_dev)
 {
 	unsigned char buf[] = { NVEC_PS2, AUTO_RECEIVE_N, PACKET_SIZE };
+
 	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }
 
 static void ps2_stopstreaming(struct serio *ser_dev)
 {
 	unsigned char buf[] = { NVEC_PS2, CANCEL_AUTO_RECEIVE };
+
 	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }
 
-- 
1.8.3.2
