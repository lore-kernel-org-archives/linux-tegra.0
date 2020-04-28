From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 1/5] MAINTAINERS: Rename Tegra Video driver path
Date: Mon, 27 Apr 2020 21:20:46 -0700
Message-ID: <1588047650-29402-2-git-send-email-skomatineni@nvidia.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl
Cc: digetx@gmail.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch renames Tegra video driver path from media/tegra to
media/tegra-video as media/tegra is more generic.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 795b201..47cd448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16652,7 +16652,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
-F:	drivers/staging/media/tegra/
+F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
-- 
2.7.4
