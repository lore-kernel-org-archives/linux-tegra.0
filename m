From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] fix compilation with binutils 2.21
Date: Wed, 27 Apr 2011 17:47:59 +0200
Message-ID: <201104271747.59497.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

I need the following patch to compile the tegra kernel with binutils 2.21 (as in 
Ubuntu Natty and soon everywhere else). As far as I can see, it produces 
identical binaries (and boots of course).

--- a/arch/arm/mach-tegra/headsmp-t2.S
+++ b/arch/arm/mach-tegra/headsmp-t2.S
@@ -108,7 +108,7 @@ __restart_plls:
        /* FIXME: need to record actual power transition here */
        mov     r0, #0
        b       __cortex_a9_l2x0_restart
-ENDPROC(__restart_pllx)
+ENDPROC(__restart_plls)
 /*
  *     __enable_coresite_access
  *

Marc Dietrich
