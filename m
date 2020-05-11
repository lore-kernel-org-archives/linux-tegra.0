From: Lukas Bulwahn <lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] MAINTAINERS: correct path in TEGRA VIDEO DRIVER
Date: Mon, 11 May 2020 21:28:44 +0200
Message-ID: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hverkuil-cisco-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukas Bulwahn <lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver") added
the driver to drivers/staging/media/tegra-video/, but commit 2c6b617f2cca
("MAINTAINERS: Add Tegra Video driver section") added a file entry
referring to drivers/staging/media/tegra/.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  drivers/staging/media/tegra/

Adjust the file entry in TEGRA VIDEO DRIVER to the correct path.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Sowjanya, please ack this minor patch.

applies cleanly on next-20200511

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abba1aff1ae..dd310f1c3bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16679,7 +16679,7 @@ L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
-F:	drivers/staging/media/tegra/
+F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
-- 
2.17.1
