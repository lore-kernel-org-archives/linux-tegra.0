From: "Alexander A. Klimov" <grandmaster-ecYmzcxolEDucvZx32VAuQ@public.gmane.org>
Subject: [PATCH] Replace HTTP links with HTTPS ones: STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER INTERFACE (nvec)
Date: Wed,  8 Jul 2020 11:14:28 +0200
Message-ID: <20200708091428.13554-1-grandmaster@al2klimov.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marvin24-Mmb7MZpHnFY@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Alexander A. Klimov" <grandmaster-ecYmzcxolEDucvZx32VAuQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster-ecYmzcxolEDucvZx32VAuQ@public.gmane.org>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster-ecYmzcxolEDucvZx32VAuQ@public.gmane.org>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/staging/nvec/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/README b/drivers/staging/nvec/README
index 0e2d5c4c875f..510e6933f402 100644
--- a/drivers/staging/nvec/README
+++ b/drivers/staging/nvec/README
@@ -10,5 +10,5 @@ but the source code[1] of the published nvec reference drivers can be a guide.
 This driver is currently only used by the AC100 project[2], but it is likely,
 that other Tegra boards (not yet mainlined, if ever) also use it.
 
-[1] e.g. http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=tree;f=arch/arm/mach-tegra/nvec;hb=android-tegra-2.6.32
+[1] e.g. https://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=tree;f=arch/arm/mach-tegra/nvec;hb=android-tegra-2.6.32
 [2] http://gitorious.org/ac100, http://launchpad.net/ac100
-- 
2.27.0
