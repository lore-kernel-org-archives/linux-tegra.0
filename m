From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] MAINTAINERS: condense some Tegra related entries
Date: Thu,  2 Oct 2014 13:20:59 -0600
Message-ID: <1412277659-1940-2-git-send-email-swarren@wwwdotorg.org>
References: <1412277659-1940-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412277659-1940-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There's little point having specific entries in MAINTAINERS for Tegra
drivers that are already covered by the top-level Tegra architecture
support entry, and maintained by people listed there. Remove the
duplicates.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3ab9f1eaf86..1fa5b07cd749 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9015,11 +9015,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 S:	Supported
 N:	[^a-z]tegra
 
-TEGRA ASOC DRIVER
-M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
-S:	Supported
-F:	sound/soc/tegra/
-
 TEGRA CLOCK DRIVER
 M:	Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 M:	Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
@@ -9031,11 +9026,6 @@ M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 S:	Supported
 F:	drivers/dma/tegra20-apb-dma.c
 
-TEGRA GPIO DRIVER
-M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
-S:	Supported
-F:	drivers/gpio/gpio-tegra.c
-
 TEGRA I2C DRIVER
 M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 S:	Supported
@@ -9052,11 +9042,6 @@ M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 S:	Supported
 F:	drivers/input/keyboard/tegra-kbc.c
 
-TEGRA PINCTRL DRIVER
-M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
-S:	Supported
-F:	drivers/pinctrl/pinctrl-tegra*
-
 TEGRA PWM DRIVER
 M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 S:	Supported
-- 
1.9.1
