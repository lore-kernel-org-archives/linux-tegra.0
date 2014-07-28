From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] MAINTAINERS: Update Tegra Git URL
Date: Mon, 28 Jul 2014 12:06:26 -0600
Message-ID: <1406570786-10432-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

swarren/linux-tegra.git is a stale location; it has moved to
tegra/linux.git.

While the git protocol re-directs to the new location, HTTP does not.
Besides, MAINTAINERS should contain the canonical URL.

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
[swarren, updated commit message]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 86efa7e213c2..dcda974bd7ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8922,7 +8922,7 @@ M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
 M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-teg=
ra.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 S:	Supported
 N:	[^a-z]tegra
=20
--=20
1.9.1
