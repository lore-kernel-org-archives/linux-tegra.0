From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] MAINTAINERS: add defconfig file to TEGRA section
Date: Wed, 29 Aug 2012 11:02:29 +0200
Message-ID: <1346230949-6051-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94b823f..39d8a59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6779,6 +6779,7 @@ Q:	http://patchwork.ozlabs.org/project/linux-tegr=
a/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-teg=
ra.git
 S:	Supported
 F:	arch/arm/mach-tegra
+F:	arch/arm/configs/tegra_defconfig
=20
 TEHUTI ETHERNET DRIVER
 M:	Andy Gospodarek <andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org>
--=20
1.7.10.4
