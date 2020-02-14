From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v3 5/6] MAINTAINERS: Add Tegra Video driver section
Date: Fri, 14 Feb 2020 10:23:27 -0800
Message-ID: <1581704608-31219-6-git-send-email-skomatineni@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add maintainers and mailing list entries to Tegra Video driver section.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..5a3b4887b9ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16431,6 +16431,16 @@ M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 S:	Supported
 F:	drivers/spi/spi-tegra*
 
+TEGRA VIDEO DRIVER
+M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+M:	Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+M:	Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	drivers/staging/media/tegra/
+
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 S:	Supported
-- 
2.7.4
