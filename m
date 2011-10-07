From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: fix compilation error due to mach/hardware.h removal
Date: Fri,  7 Oct 2011 08:31:41 -0700
Message-ID: <1318001501-14785-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: torvalds-de/tnXTf+JLsfHDXvbKv3VaTQe2KTcn/@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

This fixes a compilation error in cpu-tegra.c which was introduced in
dc8d966bc (ARM: convert PCI defines to variables) which removed the now
obsolete mach/hardware.h from the mach-tegra subtree.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
---

v2: Added patch subject of introducing commit

Linus, last minute build fix. Not sure of Arnd is planning another merge
before release so sending directly.

 arch/arm/mach-tegra/cpu-tegra.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/cpu-tegra.c b/arch/arm/mach-tegra/cpu-tegra.c
index 0e1016a..0e0fd4d 100644
--- a/arch/arm/mach-tegra/cpu-tegra.c
+++ b/arch/arm/mach-tegra/cpu-tegra.c
@@ -32,7 +32,6 @@
 
 #include <asm/system.h>
 
-#include <mach/hardware.h>
 #include <mach/clk.h>
 
 /* Frequency table index must be sequential starting at 0 */
-- 
1.7.4.1
