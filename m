From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: [RFC PATCH 3/5] power: smb347: Fix stack corruption
Date: Wed, 16 Jan 2013 14:56:11 -0500
Message-ID: <1358366173-56861-4-git-send-email-jeremya@cs.columbia.edu>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358366173-56861-1-git-send-email-jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Stack array variables declared in smb347_reg_show() were one element too
short. This patch increases the arrays to their proper size.

Signed-off-by: Jeremy C. Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Change-Id: I1db786a473cf176899050eb671309af463a9878d
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/power/smb347-charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/smb347-charger.c b/drivers/power/smb347-charger.c
index ff3d233..504c5c6 100755
--- a/drivers/power/smb347-charger.c
+++ b/drivers/power/smb347-charger.c
@@ -1016,7 +1016,7 @@ static void dockin_isr_work_function(struct work_struct *dat)
 static ssize_t smb347_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct i2c_client *client = charger->client;
-	uint8_t config_reg[14], cmd_reg[1], status_reg[10];
+	uint8_t config_reg[14], cmd_reg[2], status_reg[11];
 	int i, ret = 0;
 
 	ret += i2c_smbus_read_i2c_block_data(client, smb347_CHARGE, 15, config_reg)
-- 
1.8.1
