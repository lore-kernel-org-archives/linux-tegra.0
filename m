From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 10/11] drivers/staging: include <module.h> for modular android tegra_ion code
Date: Thu, 30 Apr 2015 21:47:46 -0400
Message-ID: <1430444867-22342-11-git-send-email-paul.gortmaker@windriver.com>
References: <1430444867-22342-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430444867-22342-1-git-send-email-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, =?UTF-8?q?Arve=20Hj=EF=BF=BDnnev=EF=BF=BDg?= <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This file is built off of a tristate Kconfig option and also contains
modular function calls so it should explicitly include module.h to
avoid compile breakage during header shuffles done in the future.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "Arve Hj=EF=BF=BDnnev=EF=BF=BDg" <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/staging/android/ion/tegra/tegra_ion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/android/ion/tegra/tegra_ion.c b/drivers/st=
aging/android/ion/tegra/tegra_ion.c
index 5b8ef0e66010..4d3c516cc15e 100644
--- a/drivers/staging/android/ion/tegra/tegra_ion.c
+++ b/drivers/staging/android/ion/tegra/tegra_ion.c
@@ -15,6 +15,7 @@
  */
=20
 #include <linux/err.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include "../ion.h"
--=20
2.2.1
