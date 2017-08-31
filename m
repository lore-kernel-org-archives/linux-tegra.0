From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] MAINTAINERS: Update Tegra IOMMU maintainer
Date: Thu, 31 Aug 2017 15:56:53 +0100
Message-ID: <1504191413-13132-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The email address for the Tegra IOMMU maintainer, Hiroshi, is no longer
valid. Hiroshi has not been maintaining the Tegra IOMMU driver for some
time now and so remove Hiroshi as the maintainer and add Thierry Reding
instead. Also add the mailing list information for this driver as well.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d99d87eafd73..d8113be76c69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13139,7 +13139,8 @@ S:	Supported
 F:	drivers/i2c/busses/i2c-tegra.c
 
 TEGRA IOMMU DRIVERS
-M:	Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Supported
 F:	drivers/iommu/tegra*
 
-- 
2.7.4
