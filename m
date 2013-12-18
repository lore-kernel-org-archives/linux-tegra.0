From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] drm/tegra: fix compile w/ CONFIG_DYNAMIC_DEBUG
Date: Wed, 18 Dec 2013 13:53:33 -0700
Message-ID: <1387400013-9237-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With CONFIG_DYNAMIC_DEBUG=3Dy, the followin compile error occurs:

drivers/gpu/drm/tegra/mipi-phy.c: In function =E2=80=98mipi_dphy_timing=
_validate=E2=80=99:
drivers/gpu/drm/tegra/mipi-phy.c:69:11: error: =E2=80=98EINVAL=E2=80=99=
 undeclared (first use in this function)
drivers/gpu/drm/tegra/mipi-phy.c:69:11: note: each undeclared identifie=
r is reported only once for each function it appears in

=46ix this by directly including the header that defines EINVAL.

=46ixes: 39aa0a4f3be5 ("drm/tegra: Add DSI support")
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/mipi-phy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/mipi-phy.c b/drivers/gpu/drm/tegra/m=
ipi-phy.c
index 1d2ad267cfce..e2c4aedaee78 100644
--- a/drivers/gpu/drm/tegra/mipi-phy.c
+++ b/drivers/gpu/drm/tegra/mipi-phy.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
=20
+#include <linux/errno.h>
 #include <linux/kernel.h>
=20
 #include "mipi-phy.h"
--=20
1.8.1.5
