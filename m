From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: compile error in cpu-tegra.c
Date: Tue, 4 Oct 2011 13:39:36 +0200
Message-ID: <201110041339.36990.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

today I tried linux-next and arm-soc tree (which is to be merged to linux-next 
soon). Both trees fail to compile with this error:

arch/arm/mach-tegra/cpu-tegra.c:35:27: error: mach/hardware.h: No such file or 
directory
make[1]: *** [arch/arm/mach-tegra/cpu-tegra.o] Error 1
make: *** [arch/arm/mach-tegra] Error 2

I think the problem was introduced by commmit c9d95fbe. If this is already fixed 
somewhere, just ignore this message. Otherwise the patch below should fix it:

----

ARM: tegra: fix compilation error due to mach/hardware.h removal
    
This fixes a compilation error in cpu-tegra.c which was introduced
in commit dc8d966bccde0b8b6c9e8c6e663c747030c17435 which removed
the now obsolete mach/hardware.h from the mach-tegra subtree.
    
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

diff --git a/arch/arm/mach-tegra/cpu-tegra.c b/arch/arm/mach-tegra/cpu-tegra.c
index 0e1016a..0e0fd4d 100644
--- a/arch/arm/mach-tegra/cpu-tegra.c
+++ b/arch/arm/mach-tegra/cpu-tegra.c
@@ -32,7 +32,6 @@
 
 #include <asm/system.h>
 
-#include <mach/hardware.h>
 #include <mach/clk.h>
 
 /* Frequency table index must be sequential starting at 0 */
