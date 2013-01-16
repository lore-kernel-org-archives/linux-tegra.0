From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: [RFC PATCH 4/5] input: lid: Fix init function ignores sysfs retval
Date: Wed, 16 Jan 2013 14:56:12 -0500
Message-ID: <1358366173-56861-5-git-send-email-jeremya@cs.columbia.edu>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358366173-56861-1-git-send-email-jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Don't ignore the sysfs_create_group return value in the lid_init()
function. This suppresses a compiler warning and results in more robust
code for free :-)

Signed-off-by: Jeremy C. Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Change-Id: I2fef38736d39fbd5f60ef5a658f14d917122b942
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/input/lid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/lid.c b/drivers/input/lid.c
index 1d27609..26e3d64 100644
--- a/drivers/input/lid.c
+++ b/drivers/input/lid.c
@@ -163,7 +163,9 @@ static int __init lid_init(void)
                 return -ENOMEM;
         }
 
-	sysfs_create_group((struct kobject*)&lid_dev->dev.kobj, &lid_attr_group);
+	err_code = sysfs_create_group((struct kobject*)&lid_dev->dev.kobj, &lid_attr_group);
+	if (err_code != 0)
+		return err_code;
 
 	err_code = lid_input_device_create();
 	if(err_code != 0)
-- 
1.8.1
