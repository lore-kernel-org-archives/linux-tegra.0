From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] printk: Make it compile with !CONFIG_PRINTK
Date: Mon, 14 May 2012 19:18:02 +0300
Message-ID: <1337012284-18680-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kay-tD+1rO4QERM@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add missing prepend_timestamp() dummy.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 kernel/printk.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/kernel/printk.c b/kernel/printk.c
index 8b027bd..5f9e278 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -1438,6 +1438,7 @@ EXPORT_SYMBOL(printk);
 static struct log *log_from_idx(u32 idx) { return NULL; }
 static u32 log_next(u32 idx) { return 0; }
 static char *log_text(const struct log *msg) { return NULL; }
+static size_t prepend_timestamp(unsigned long long t, char *buf) { return 0; }
 static void call_console_drivers(int level, const char *text, size_t len) {}
 
 #endif /* CONFIG_PRINTK */
-- 
1.7.5.4
