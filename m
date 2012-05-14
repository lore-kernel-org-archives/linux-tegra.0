From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/4] printk: Move to separate directory for easier modification
Date: Mon, 14 May 2012 09:54:30 -0700
Message-ID: <76bd4533a88ae2ebf584887d51bf306591d0c01a.1337013604.git.joe@perches.com>
References: <1337013987.29436.16.camel@joe2Laptop>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337013987.29436.16.camel@joe2Laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay-tD+1rO4QERM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make it easier to break up printk into bite-sized chunks.

Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---
 kernel/Makefile              |    3 ++-
 kernel/printk/Makefile       |    1 +
 kernel/{ => printk}/printk.c |    2 --
 3 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 kernel/printk/Makefile
 rename kernel/{ => printk}/printk.c (99%)

diff --git a/kernel/Makefile b/kernel/Makefile
index cb41b95..1ea2933 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -2,7 +2,7 @@
 # Makefile for the linux kernel.
 #
 
-obj-y     = fork.o exec_domain.o panic.o printk.o \
+obj-y     = fork.o exec_domain.o panic.o \
 	    cpu.o exit.o itimer.o time.o softirq.o resource.o \
 	    sysctl.o sysctl_binary.o capability.o ptrace.o timer.o user.o \
 	    signal.o sys.o kmod.o workqueue.o pid.o \
@@ -24,6 +24,7 @@ endif
 
 obj-y += sched/
 obj-y += power/
+obj-y += printk/
 
 obj-$(CONFIG_FREEZER) += freezer.o
 obj-$(CONFIG_PROFILING) += profile.o
diff --git a/kernel/printk/Makefile b/kernel/printk/Makefile
new file mode 100644
index 0000000..6bae497
--- /dev/null
+++ b/kernel/printk/Makefile
@@ -0,0 +1 @@
+obj-y				+= printk.o
diff --git a/kernel/printk.c b/kernel/printk/printk.c
similarity index 99%
rename from kernel/printk.c
rename to kernel/printk/printk.c
index b663c2c..d98c094 100644
--- a/kernel/printk.c
+++ b/kernel/printk/printk.c
@@ -1,6 +1,4 @@
 /*
- *  linux/kernel/printk.c
- *
  *  Copyright (C) 1991, 1992  Linus Torvalds
  *
  * Modified to make sys_syslog() more flexible: added commands to
-- 
1.7.8.111.gad25c.dirty
