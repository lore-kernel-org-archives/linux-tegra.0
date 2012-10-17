From: Devendra Naga <devendra.aaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm: mach-tegra: check wether we have debugfs enabled or not
Date: Wed, 17 Oct 2012 15:13:16 -0400
Message-ID: <1350501196-5632-1-git-send-email-devendra.aaru@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Devendra Naga <devendra.aaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

if debugfs is not enabled in kernel it returns -ENODEV, check it
with IS_ERR_OR_NULL along with the null return if it fails to
create a file in debugfs.

Signed-off-by: Devendra Naga <devendra.aaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index de0662d..1809b91d 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -269,7 +269,7 @@ int __init tegra_powergate_debugfs_init(void)
 	if (powergate_name) {
 		d = debugfs_create_file("powergate", S_IRUGO, NULL, NULL,
 			&powergate_fops);
-		if (!d)
+		if (IS_ERR_OR_NULL(d))
 			return -ENOMEM;
 	}
 
-- 
1.7.10.4
