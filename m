From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] dt-bindings: tegra: Update compatible strings for Tegra flowctrl
Date: Wed, 15 Mar 2017 13:31:54 +0000
Message-ID: <1489584715-23138-5-git-send-email-jonathanh@nvidia.com>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489584715-23138-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Update the compatible strings for Tegra Flow Control driver to match
the device-tree source files for Tegra.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
index ccf0adddc820..d92bf782985f 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
@@ -1,7 +1,13 @@
 NVIDIA Tegra Flow Controller
 
 Required properties:
-- compatible: Should be "nvidia,tegra<chip>-flowctrl"
+- compatible: Should contain one of the following:
+	For Tegra20 must contain "nvidia,tegra20-flowctrl".
+	For Tegra30 must contain "nvidia,tegra30-flowctrl".
+	For Tegra114 must contain "nvidia,tegra114-flowctrl"
+	For Tegra124 must contain "nvidia,tegra124-flowctrl"
+	For Tegra132 must contain "nvidia,tegra124-flowctrl"
+	For Tegra210 must contain "nvidia,tegra210-flowctrl"
 - reg: Should contain one register range (address and length)
 
 Example:
-- 
2.7.4
