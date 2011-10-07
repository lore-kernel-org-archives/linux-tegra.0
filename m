From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] MAINTAINERS: Update tegra maintainer information
Date: Fri,  7 Oct 2011 13:27:48 -0700
Message-ID: <1318019268-6946-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A couple of changes to the Tegra maintainership setup:

I'm very glad to bring on Stephen Warren on board as a maintainer. The
work he has done so far is excellent, and the fact that he works for
Nvidia means he has long-term interest in the platform.

Erik Gilling did an astounding amount of work on getting things up and
running but has been a silent partner on the maintainership side for a
while, and is stepping down. Thanks for your contributions so far, Erik.

Finally, update the git URL since I'll take over running the main repo
for a while.

Overall maintainership model isn't changing much at this time: We'll all
three review patches as appropriate, and one of us will collect the main
repo (me at this time).

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ace8f9c..5483e0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6366,10 +6366,10 @@ F:	net/ipv4/tcp_lp.c
 
 TEGRA SUPPORT
 M:	Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
-M:	Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
 M:	Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
+M:	Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-T:	git git://android.git.kernel.org/kernel/tegra.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
 S:	Supported
 F:	arch/arm/mach-tegra
 
-- 
1.7.4.1
