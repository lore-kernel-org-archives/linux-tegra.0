From: Jesse Chan <jc-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] media: tegra-cec: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
Date: Mon, 20 Nov 2017 12:56:52 -0800
Message-ID: <20171120205652.86405-1-jc@linux.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jesse Chan <jc-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This change resolves a new compile-time warning
when built as a loadable module:

WARNING: modpost: missing MODULE_LICENSE() in drivers/media/platform/tegra-cec/tegra_cec.o
see include/linux/module.h for more information

This adds the license as "GPL v2", which matches the header of the file.

MODULE_DESCRIPTION and MODULE_AUTHOR are also added.

Signed-off-by: Jesse Chan <jc-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/platform/tegra-cec/tegra_cec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
index 807c94c70049..92f93a880015 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -493,3 +493,8 @@ static struct platform_driver tegra_cec_driver = {
 };
 
 module_platform_driver(tegra_cec_driver);
+
+MODULE_DESCRIPTION("Tegra HDMI CEC driver");
+MODULE_AUTHOR("NVIDIA CORPORATION");
+MODULE_AUTHOR("Cisco Systems, Inc. and/or its affiliates");
+MODULE_LICENSE("GPL v2");
-- 
2.14.1
