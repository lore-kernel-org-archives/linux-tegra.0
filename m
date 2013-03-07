From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 2/3] MAINTAINERS: tegra: match related files using N: not K:
Date: Wed,  6 Mar 2013 17:29:00 -0700
Message-ID: <1362616141-13947-2-git-send-email-swarren@wwwdotorg.org>
References: <1362616141-13947-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362616141-13947-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, Marcin Slusarz <marcin.slusarz@gmail.com>, Lucas Stach <dev@lynxeye.de>, Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@canonical.com>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

This causes the regex to be applied to filenames only, and not patch or
file content (such as comments). This should prevent e.g.
drivers/gpu/drm/nouveau/nv50_display.c from matching this entry.

Reported-by: Marcin Slusarz <marcin.slusarz@gmail.com>
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 MAINTAINERS |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9b1e37..2d02ab5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7851,7 +7851,7 @@ L:	linux-tegra@vger.kernel.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
 S:	Supported
-K:	(?i)[^a-z]tegra
+N:	[^a-z]tegra
 
 TEHUTI ETHERNET DRIVER
 M:	Andy Gospodarek <andy@greyhouse.net>
-- 
1.7.10.4
