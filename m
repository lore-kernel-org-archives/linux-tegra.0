From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: [RFC PATCH 5/5] input: touchscreen: Fix rmi4 sysfs and driver removal
Date: Wed, 16 Jan 2013 14:56:13 -0500
Message-ID: <1358366173-56861-6-git-send-email-jeremya@cs.columbia.edu>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358366173-56861-1-git-send-email-jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

The "InternalLimits" sysfs entry used the "Limit_Register_Count" show
function. This has been changed to the correct "InternalLimits" function.

The rmi_f09_remove function tries to kfree u8 values which could never
hold memory pointers. I have removed the offending code, but would
appreciate feedback from one more knowledgeable than myself.

Signed-off-by: Jeremy C. Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Change-Id: I54ca675af8eae19f7dfb3494d531baaab0281dfb
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/input/touchscreen/rmi4/rmi_f09.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/rmi4/rmi_f09.c b/drivers/input/touchscreen/rmi4/rmi_f09.c
index 0ec980d..f1f0d01 100644
--- a/drivers/input/touchscreen/rmi4/rmi_f09.c
+++ b/drivers/input/touchscreen/rmi4/rmi_f09.c
@@ -107,7 +107,7 @@ static struct device_attribute attrs[] = {
 	__ATTR(HostTestEn, RMI_RW_ATTR,
 	       rmi_f09_HostTestEn_show, rmi_f09_HostTestEn_store),
 	__ATTR(InternalLimits, RMI_RO_ATTR,
-	       rmi_f09_Limit_Register_Count_show, rmi_store_error),
+	       rmi_f09_InternalLimits_show, rmi_store_error),
 	__ATTR(Result_Register_Count, RMI_RO_ATTR,
 	       rmi_f09_Result_Register_Count_show, rmi_store_error),
 };
@@ -169,11 +169,6 @@ error_exit:
 
 static void rmi_f09_remove(struct rmi_function_container *fc)
 {
-	struct rmi_fn_09_data *data = fc->data;
-	if (data) {
-		kfree(data->query.Limit_Register_Count);
-		kfree(data->query.f09_bist_query1);
-	}
 	kfree(fc->data);
 }
 
-- 
1.8.1
