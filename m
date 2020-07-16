From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/9] dt-bindings: fuse: tegra: Add missing compatible strings
Date: Thu, 16 Jul 2020 16:18:49 +0200
Message-ID: <20200716141856.544718-3-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716141856.544718-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra FUSE device tree bindings haven't been updated in a while. Add
compatible strings for the SoC generations that were released since the
last update.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/fuse/nvidia,tegra20-fuse.txt         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index 41372d441131..2aaf661c04ee 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -4,8 +4,9 @@ Required properties:
 - compatible : For Tegra20, must contain "nvidia,tegra20-efuse".  For Tegra30,
   must contain "nvidia,tegra30-efuse".  For Tegra114, must contain
   "nvidia,tegra114-efuse".  For Tegra124, must contain "nvidia,tegra124-efuse".
-  Otherwise, must contain "nvidia,<chip>-efuse", plus one of the above, where
-  <chip> is tegra132.
+  For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
+  For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
+  "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
   Details:
   nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
 	due to a hardware bug. Tegra20 also lacks certain information which is
-- 
2.27.0
