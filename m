From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v4 2/3] of: add vendor prefix for GMT
Date: Thu, 12 Sep 2013 19:24:20 +0800
Message-ID: <1378985061-28547-3-git-send-email-wni@nvidia.com>
References: <1378985061-28547-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378985061-28547-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khali@linux-fr.org, linux@roeck-us.net, broonie@kernel.org, swarren@wwwdotorg.org
Cc: lm-sensors@lm-sensors.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Adding Global Mixed-mode Technology Inc. to the list
of devicetree vendor prefixes.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2956800..634c35f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -28,6 +28,7 @@ est	ESTeem Wireless Modems
 fsl	Freescale Semiconductor
 GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
 gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
+gmt	Global Mixed-mode Technology Inc.
 hisilicon	Hisilicon Limited.
 hp	Hewlett Packard
 ibm	International Business Machines (IBM)
-- 
1.7.9.5
