From: Daniel Axtens <dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] media: tegra-cec: add MODULE_LICENSE()
Date: Sat,  2 Dec 2017 16:59:18 +1100
Message-ID: <20171202055918.15989-1-dja@axtens.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Daniel Axtens <dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This fixes the following warning in an allmodconfig build:
WARNING: modpost: missing MODULE_LICENSE() in drivers/media/platform/tegra-cec/tegra_cec.o

The license matches the header.

Signed-off-by: Daniel Axtens <dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org>
---
 drivers/media/platform/tegra-cec/tegra_cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
index 807c94c70049..680884a69f9f 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -493,3 +493,5 @@ static struct platform_driver tegra_cec_driver = {
 };
 
 module_platform_driver(tegra_cec_driver);
+
+MODULE_LICENSE("GPL v2");
-- 
2.11.0
