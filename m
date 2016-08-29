From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH ] drivers/base: cacheinfo: remove warning in resume
Date: Mon, 29 Aug 2016 12:50:54 +0530
Message-ID: <1472455254-27692-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

CPU notifier is present for creating device
entries for child node "cache" under parent
node "cpu" as per DT. During resume from
suspend, while booting all non-boot CPU's,
this notifier for adding cache device gets
called before cpu device is added by
device_resume. Because of this warning message
of "parent should not be sleeping" comes during
resume.

Removing the notifier to explicitly add/remove
cache device as CPU and cache device get
added/removed anyway as part of normal suspend
resume sequence.
dpm_resume_end - > dpm_resume -> device_resume

Signed-off-by: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/base/cacheinfo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index e9fd32e91668..17d9c051a16f 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -544,8 +544,6 @@ static int __init cacheinfo_sysfs_init(void)
 			goto out;
 		}
 	}
-	__hotcpu_notifier(cacheinfo_cpu_callback, 0);
-
 out:
 	cpu_notifier_register_done();
 	return rc;
-- 
2.1.4
